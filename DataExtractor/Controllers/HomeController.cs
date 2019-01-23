using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using Dapper;
using HtmlAgilityPack;
using Fizzler.Systems.HtmlAgilityPack;
using DataExtractor.Models;
using System.Net.Sockets;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace DataExtractor.Controllers
{
    public class HomeController : Controller
    {
        public const string DefaultLink = "https://www.sigmaaldrich.com";
        private static IWebDriver webDriver;
        private static TimeSpan defaultWait = TimeSpan.FromSeconds(10);
        private static String targetUrl = "https://www.sigmaaldrich.com/catalog/product/mm/100126?lang=en&region=PK";
        private static String driversDir = @"C:\Users\Abdul Rouf\Documents\Visual Studio 2017\Projects\DataExtractor\DataExtractor\Drivers";
        public async Task<ActionResult> Categories()
        {
            List<ProductCategory> ProductCategories = new List<ProductCategory>();
            Dictionary<string, ProductCategory> ProductCategoriesToBeProcessed = await CategoryPage();
            return View();
        }

        public async Task<ActionResult> Index()
        {

            string ExcelQuery = @"
            SELECT 
            C.CategoryName as ProductCategory ,
            P.ID_Link,
            P.name,
            ISNULL(SKU.SKU,'-') as SKU_Packsize,
            ISNULL(PCK.Packaging,'-') Packaging,
            '-' as Volume,
            '-' as Density,
            ISNULL(PCK.AmountINKG,'-') as AmountINKG,
            ISNULL(SKU.Price,'-') as Price, 
            ISNULL(CAST(PCK.PricePerKG AS VARCHAR), '-') as PricePerKG,
            ISNULL(P.Assay, '-') as Assay,
            ISNULL(P.CASnumber, '-') as CASNumber, 
            ISNULL(P.InChlkey, '-') as InChlkey,
            ISNULL(P.Description, '-') as Description,
            ISNULL(P.Biologicalsource, '-') as Biologicalsource,
            ISNULL(p.Synonyms, '-') as Synonyms,
            ISNULL(P.Linearformula,  '-') as Linearformula,
            ISNULL(p.Molecularweight, '-') as Molecularweight, 
            ISNULL(p.ECnumber, '-') as ECnumber,
            ISNULL(p.Beilsteinnumber, '-') as Beilsteinnumber,
            ISNULL(P.PubChemID, '-') as PubChemID,
            P.ProductUrl
            FROM Product P
            INNER JOIN SubCategory S ON S.ID = P.SubCategoryID
            INNER JOIN Category C ON C.ID = S.CategoryID
            LEFT JOIN  Product_SKU SKU ON SKU.ProductID = P.ID
            LEFT JOIN  Product_Packaging PCK ON PCK.Packaging like  '%' + SKU.SKU + '%' AND PCK.ProductID = SKU.ProductID
            order by ProductCategory, S.SubCategoryName, P.name, SKU.SKU
            ";


            List<SubCategory> SubCategories = DBHelper.GetList<SubCategory>().Where(x => x.Processed == false).ToList();
            ProcessSubCategories(SubCategories);
           // await ExtractProductsFromSubCategories();
            string PCKQuery = @"
            SELECT SKU.*, PCK.ID, PCK.Packaging, PCK.PricePerKG, PCK.AmountINKG FROM Product P 
            INNER JOIN  Product_SKU SKU ON SKU.ProductID = P.ID
            INNER JOIN  Product_Packaging PCK ON PCK.Packaging like  '%' + SKU.SKU + '%'
            ";



            //ExtractProductInformation();
           // UpdateProductsPrices();
            //await ExtractProductsFromSubCategories();
            return View();
        }

        public async void SubCategories()
        {

            List<Category> Categories = DBHelper.GetList<Category>().Where(x => x.Processed == false).ToList();

            foreach (var element in Categories)
            {

                Dictionary<string, ProductSubCategory> subCategories = await SubCategoryPage(element.CategoryURL);

                List<SubCategory> SubCategories = new List<SubCategory>();
                foreach (var s in subCategories)
                {
                    SubCategories.Add(new SubCategory
                    {
                        CategoryID = element.ID,
                        Processed = false,
                        SubCategoryID = null,
                        SubCategoryName = s.Value.SubCategoryName,
                        SubCategoryURL = s.Key
                    });
                }

                foreach (var s in SubCategories)
                {
                    DBHelper.Insert(s);
                }
            }

        }



        private async void ProcessSubCategories(List<SubCategory> subCategories)
        {
            foreach (var element in subCategories)
            {

                Dictionary<string, Product> dictionary = await ProductsPage(element.SubCategoryURL);
                if (dictionary == null || dictionary.Count == 0)
                {
                    Dictionary<string, SubCategory> SubCategories = await ProductPageSubCategories(element); //new Dictionary<string, SubCategory>();

                    foreach (var k in SubCategories)
                    {
                        DBHelper.Insert(k.Value);
                    }

                }
                else
                {

                    foreach (var p in dictionary)
                    {
                        Product prod = p.Value;
                        prod.SubCategoryID = element.ID;
                        prod.ProductUrl = p.Key;
                        DBHelper.Insert(prod);
                    }
                }
                DBHelper.ExecuteQuery($"UPDATE SubCategory Set Processed = 1 Where ID = ${element.ID}");
            }
        }

        private async Task ExtractProductsFromSubCategories()
        {
            List<SubCategory> subcategories = DBHelper.GetList<SubCategory>();
            foreach (var s in subcategories)
            {
                Dictionary<string, Product> ProductsToBeProcessed = await ProductsPage(s.SubCategoryURL);
                List<Product> ProcessedProducts = new List<Product>();
                foreach (var element in ProductsToBeProcessed)
                {
                    Product p = element.Value;
                    p.SubCategoryID = s.ID;
                    p.ProductUrl = element.Key;
                    DBHelper.Insert(p);
                }
            }
        }

        private void ExtractProductInformation()
        {
            List<Product> products = DBHelper.GetList<Product>().Where(x => x.Processed == false).ToList();

            ChromeOptions options = new ChromeOptions();
            options.AddArguments("--headless");
            webDriver = new ChromeDriver(driversDir);
            webDriver.Manage().Timeouts().PageLoad = TimeSpan.FromSeconds(120);
            webDriver.Manage().Timeouts().AsynchronousJavaScript = TimeSpan.FromSeconds(30);

            foreach (var element in products)
            {
                try
                {
                    ProductDetailPage(element, element.ProductUrl);
                    foreach (var e in element.SKU_PackSize)
                    {
                        string query = $"INSERT INTO Product_SKU (ProductID, SKU, Price) VALUES ({element.ID}, '{e.SKU}', '{e.Price}');";
                        DBHelper.ExecuteQuery(query);
                    }
                    foreach (var e in element.Packaging)
                    {
                        string query = $"INSERT INTO Product_Packaging (ProductID , Packaging) VALUES ({element.ID}, '{e}');";
                        DBHelper.ExecuteQuery(query);
                    }
                    element.Processed = true;
                    DBHelper.Update(element, $"WHERE ID = {element.ID}", null);

                }
                catch (Exception ex)
                {
                }
            }
            webDriver.Quit();
        }

        private static void UpdateProductsPrices()
        {
            string query = $@"
            SELECT SKU.*, PCK.Packaging FROM Product P 
            INNER JOIN  Product_SKU SKU ON SKU.ProductID = P.ID
            LEFT JOIN  Product_Packaging PCK ON PCK.Packaging like  '%' + SKU.SKU + '%'
            ";
            List<SKUPackagingPrice> PackagingList = DBHelper.GetList<SKUPackagingPrice>(query);
            //PackagingList = PackagingList.Where(x => x.ProductID == 7).ToList();


            foreach (var element in PackagingList)
            {
                string PackagingString = element.Packaging;
                if (!string.IsNullOrWhiteSpace(PackagingString))
                {
                    List<string> PackagingStringList = PackagingString.Split(' ').ToList();
                    if (PackagingStringList[1].ToLower() == "kg")
                    {
                        double.TryParse(PackagingStringList[0], out double KGAmount);
                        element.AmountInKG = KGAmount;
                        element.PricePerKG = (element.Price * KGAmount);
                    }
                    else if (PackagingStringList[1].ToLower() == "g")
                    {
                        double.TryParse(PackagingStringList[0], out double GAmount);
                        element.AmountInKG = GAmount / 1000;
                        element.PricePerKG = (element.Price * (GAmount / 1000));

                    }
                    else if (PackagingStringList[1].ToLower() == "x")
                    {

                        if (PackagingStringList[3].ToLower() == "kg")
                        {
                            double.TryParse(PackagingStringList[0], out double FirstAmount);
                            double.TryParse(PackagingStringList[2], out double SecondAmount);
                            if (FirstAmount != 0 && SecondAmount != 0)
                            {
                                element.AmountInKG = FirstAmount * SecondAmount;
                                element.PricePerKG = (element.Price * (FirstAmount * SecondAmount));
                            }
                        }
                        else if (PackagingStringList[3].ToLower() == "g" || PackagingStringList[3].ToLower() == "gm")
                        {
                            double.TryParse(PackagingStringList[0], out double FirstAmount);
                            double.TryParse(PackagingStringList[2], out double SecondAmount);
                            if (FirstAmount != 0 && SecondAmount != 0)
                            {
                                element.AmountInKG = FirstAmount * SecondAmount;
                                element.PricePerKG = (element.Price * (FirstAmount * SecondAmount / 1000));
                            }
                        }
                    }

                }
                else
                {
                    List<string> SkuInfo = element.SKU.Split('-').ToList();
                    if (SkuInfo.Count > 1)
                    {
                        string PackageSize = SkuInfo[1].Trim();

                        if (PackageSize.ToLower().EndsWith("kg"))
                        {
                            var AmountINKG = PackageSize.Substring(0, PackageSize.Length - 2).ToString();
                            element.AmountInKG = double.Parse(AmountINKG);
                            element.PricePerKG = element.Price / (double)element.AmountInKG;
                        }
                        else if (PackageSize.ToLower().EndsWith("mg"))
                        {
                            var AmountINMG = PackageSize.Substring(0, PackageSize.Length - 2).ToString();
                            element.AmountInKG =  double.Parse(AmountINMG) / ( 1000 * 1000 )  ;
                            element.PricePerKG = element.Price / (double)element.AmountInKG;

                        }
                        else if (PackageSize.ToLower().EndsWith("g"))
                        {
                            try
                            {
                                var AmountING = PackageSize.Substring(0, PackageSize.Length - 1).ToString();
                                element.AmountInKG = double.Parse(AmountING) / 1000;
                                element.PricePerKG = element.Price / (double)element.AmountInKG;

                            }
                            catch (Exception ex)
                            {
                            }
                        }

                    }
                }

                
            }


            

            foreach (var element in PackagingList.Where(x=>x.PricePerKG != null && x.AmountInKG != null))
            {
                DBHelper.ExecuteQuery($@"UPDATE Product_SKU SET PricePerKG = {element.PricePerKG}, AmountInKG = {element.AmountInKG} where ID = {element.ID}");

            }
        }

        public void InsertProduct(Product p)
        {
            string query = QueryMaker.InsertQuery(p) + ";DECLARE @ID INT = ( SELECT SCOPE_IDENTITY() );";
            foreach (var element in p.Packaging)
            {
                query += $"INSERT INTO Product_Packaging (ProductID , Packaging) VALUES (@ID, '{element}');";
            }
            foreach (var element in p.SKU_PackSize)
            {
                query += $"INSERT INTO Product_SKU (ProductID, SKU, Price) VALUES (@ID, '{element.SKU}', '{element.Price}');";
            }

            DBHelper.ExecuteQuery(query);

        }


        public async Task<Dictionary<string, ProductCategory>> CategoryPage()
        {
            string url = "https://www.sigmaaldrich.com/life-science/life-science-catalog.html";
            string html = await GetHtml(url);
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
            var document = htmlDoc.DocumentNode;
            var list = document.QuerySelectorAll(".parbase").ToList();
            Dictionary<string, ProductCategory> CategoryList = new Dictionary<string, ProductCategory>();
            foreach (var element in list)
            {
                var listFor = element.QuerySelectorAll("ul").FirstOrDefault();
                if (listFor != null)
                {
                    var ul = element.QuerySelectorAll("li").ToList();
                    foreach (var li in ul)
                    {
                        var a = li.QuerySelectorAll("a").FirstOrDefault();
                        if (a != null)
                        {
                            string CategoryName = a.InnerHtml;
                            string PageUrl = a.Attributes.Where(x => x.Name == "href").First().Value;
                            string newUrl = DefaultLink + PageUrl;
                            CategoryList.Add(newUrl, new ProductCategory { CategoryName = CategoryName });
                        }
                        else
                        {
                            CategoryList.Add($"No-Link{li.InnerText}", new ProductCategory { CategoryName = li.InnerText });
                        }
                    }
                }
            }
            return CategoryList;
        }




        public async Task<Dictionary<string, ProductSubCategory>> SubCategoryPage(string url)
        {
            string html = await GetHtml(url);
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
            var document = htmlDoc.DocumentNode;
            var opcmain = document.QuerySelectorAll("#opcmaintable").FirstOrDefault();
            Dictionary<string, ProductSubCategory> SubCategories = new Dictionary<string, ProductSubCategory>();

            if (opcmain != null)
            {
                var table = opcmain.QuerySelectorAll("table").FirstOrDefault();
                if(table != null)
                {
                    var ul = table.QuerySelectorAll("ul").FirstOrDefault();
                    if (ul != null)
                    {
                        foreach (var li in ul.QuerySelectorAll("li"))
                        {
                            var a = li.QuerySelectorAll("a").First();
                            string ProductSubCategory = a.InnerText;
                            var newUrl = DefaultLink + a.Attributes.Where(x => x.Name == "href").First().Value;
                            SubCategories.Add(newUrl, new ProductSubCategory { SubCategoryName = ProductSubCategory });
                        }
                        
                    }

                }
            }
            return SubCategories;
        }

        public async Task<Dictionary<string, Product>> ProductsPage(string url)
        {
            string html = await GetHtml(url);
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
            var document = htmlDoc.DocumentNode;
            var opctable = document.QuerySelectorAll(".opcTable").FirstOrDefault();

            Dictionary<string, Product> ProductList = new Dictionary<string, Product>();
            if (opctable != null)
            {
                var table = opctable.QuerySelectorAll("tbody").FirstOrDefault();
                if (table != null)
                {
                    foreach (var element in table.QuerySelectorAll("tr"))
                    {
                        var td = element.QuerySelectorAll("td").FirstOrDefault();
                        if (td != null)
                        {
                            var a = td.QuerySelectorAll("a").FirstOrDefault();
                            if (a != null)
                            {
                                string ProductUrl = a.Attributes.Where(x => x.Name == "href").First().Value;
                                string ProductLink = element.QuerySelectorAll("td").First().QuerySelectorAll("a").First().InnerHtml;
                                ProductList.Add(DefaultLink + ProductUrl, new Product { ID_Link = ProductLink });
                            }
                        }
 
                    }
                }
            }
            return ProductList;
        }



        public async Task<Dictionary<string, SubCategory>> ProductPageSubCategories(SubCategory subCategory)
        {
            string html = await GetHtml(subCategory.SubCategoryURL);
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
            var document = htmlDoc.DocumentNode;
            var opctable = document.QuerySelectorAll(".opcsectionlist li").ToList();

            Dictionary<string, SubCategory> SubCategoryList = new Dictionary<string, SubCategory>();
            
            if (opctable != null)
            {
                foreach (var element in opctable)
                {
                    var a = element.QuerySelectorAll("a").FirstOrDefault();
                    if (a != null)
                    {
                        if (a != null)
                        {
                            string SubCategoryLink = a.Attributes.Where(x => x.Name == "href").First().Value;
                            string SubCategoryName = a.InnerText;
                            SubCategoryList.Add(DefaultLink + SubCategoryLink, new SubCategory
                            {
                                SubCategoryName = SubCategoryName,
                                SubCategoryURL = DefaultLink +  SubCategoryLink,
                                CategoryID = subCategory.CategoryID,
                                Processed = false,
                                SubCategoryID = subCategory.ID
                            });
                        }
                    }
                }
                
            }
            return SubCategoryList;
        }






        public async void ProductDetailPage(Product p, string url)
        {
            //ChromeDriverService service = ChromeDriverService.CreateDefaultService();
            //service.HideCommandPromptWindow = true;
            //var options = new ChromeOptions();
            //options.AddArgument("--window-position=-32000,-32000");
            try
            {

                webDriver.Navigate().GoToUrl(url);
                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(webDriver.PageSource);
              
                var document = htmlDoc.DocumentNode;

                var brand = document.QuerySelectorAll(".productInfo").FirstOrDefault();
                if (brand != null)
                {
                    var span = brand.QuerySelectorAll("span").FirstOrDefault();
                    if (span != null)
                    {
                        p.ID_Link += " " + span.InnerText.Trim();
                    }

                    var h1 = brand.QuerySelectorAll("h1").FirstOrDefault();
                    if (h1 != null)
                    {
                        p.name = h1.InnerText.Trim();
                    }

                    var h2s = brand.QuerySelectorAll("h2").ToList();
                    if (h2s != null)
                    {
                        var descriptionh2 = h2s.Where(x => x.Attributes.Where(y => y.Name == "itemprop" && y.Value == "description").ToList().Count > 0).FirstOrDefault();
                        if (descriptionh2 != null)
                        {
                            p.Description = descriptionh2.InnerText.Trim();
                        }
                    }

                    var synonym = brand.QuerySelectorAll(".synonym").FirstOrDefault();
                    if (synonym != null)
                    {
                        var synlist = synonym.QuerySelectorAll("strong").FirstOrDefault();
                        if (synlist != null)
                        {
                            p.Synonyms = synlist.InnerText.Trim();
                        }
                    }

                    var ul = brand.QuerySelectorAll(".clearfix").FirstOrDefault();
                    if (ul != null)
                    {
                        foreach (var ul_p in ul.QuerySelectorAll("p"))
                        {
                            if (ul_p.InnerText.Contains("CAS Number"))
                            {
                                var a = ul_p.QuerySelectorAll("a").FirstOrDefault();
                                if (a != null)
                                {
                                    p.CASnumber = a.InnerText.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("Linear Formula"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Linearformula = a.InnerText.Trim();
                                }
                            }
                            else if (ul_p.InnerHtml.Contains("Molecular Weight"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Molecularweight = a.InnerText.Trim();
                                }
                            }
                            else if (ul_p.InnerHtml.Contains("EC Number"))
                            {
                                var a = ul_p.QuerySelectorAll("a").FirstOrDefault();
                                if (a != null)
                                {
                                    p.ECnumber = a.InnerText.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("Beilstein"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Beilsteinnumber = a.InnerText.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("PubChem"))
                            {
                                var a = ul_p.QuerySelectorAll("a").FirstOrDefault();
                                if (a != null)
                                {
                                    p.PubChemID = a.InnerText.Trim();
                                }

                            }
                        }
                    }

                }


                p.SKU_PackSize = new List<SKU_PackSize>();
                var SKUDiv = document.QuerySelectorAll("#pricingContainerMessage").FirstOrDefault();
                if (SKUDiv != null)
                {
                    var trWithInfo = SKUDiv.QuerySelectorAll("tr.backordered").ToList();
                    trWithInfo.AddRange(SKUDiv.QuerySelectorAll("tr.available").ToList());

                    if (trWithInfo != null)
                    {
                        foreach (var element in trWithInfo)
                        {
                            string sku = string.Empty;
                            string price = string.Empty;
                            var skuElement = element.QuerySelectorAll(".sku").FirstOrDefault();
                            if (skuElement != null)
                            {
                                var sku_p = skuElement.QuerySelectorAll("p").FirstOrDefault();
                                if (sku_p != null)
                                {
                                    sku = sku_p.InnerText.Trim();
                                }
                            }

                            var priceElement = element.QuerySelectorAll(".price").FirstOrDefault();
                            if (priceElement != null)
                            {
                                var price_p = priceElement.QuerySelectorAll("p").FirstOrDefault();
                                if (price_p != null)
                                {
                                    price = price_p.InnerText.Trim();
                                }

                            }

                            p.SKU_PackSize.Add(new SKU_PackSize { SKU = sku, Price = price });
                        }
                    }
                }


                p.Packaging = new List<string>();
                var PackagingDiv = document.QuerySelectorAll("#productDetailProperties").FirstOrDefault();
                if (PackagingDiv != null)
                {
                    var table = PackagingDiv.QuerySelectorAll("table").FirstOrDefault();
                    if (table != null)
                    {
                        var tbody = table.QuerySelectorAll("tbody").FirstOrDefault();
                        if (tbody != null)
                        {
                            int i = 0;
                            var trs = tbody.QuerySelectorAll("tr").ToList();
                            while (i < trs.Count)
                            {
                                var firstTd = trs[i].QuerySelectorAll("td").FirstOrDefault();
                                if (firstTd != null)
                                {
                                    string html = firstTd.InnerHtml;
                                    if (html.ToLower().Contains("packaging"))
                                    {
                                        break;
                                    }
                                }
                                i++;
                            }


                            trs = trs.Skip(i).ToList();

                            foreach (var tr in trs)
                            {
                                var firstTd = tr.QuerySelectorAll("td").FirstOrDefault();
                                if (firstTd != null)
                                {
                                    string html = firstTd.InnerHtml.Trim();
                                    if (html.ToLower().Contains("packaging") || string.IsNullOrWhiteSpace(html))
                                    {
                                        var righttd = tr.QuerySelectorAll("td").Last();
                                        if (righttd != null)
                                        {
                                            string innertext = righttd.InnerText.Trim();
                                            p.Packaging.Add(innertext);
                                        }
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }


                            i = 0;
                            trs = tbody.QuerySelectorAll("tr").ToList();
                            while (i < trs.Count)
                            {
                                var firstTd = trs[i].QuerySelectorAll("td").FirstOrDefault();
                                if (firstTd != null)
                                {
                                    string html = firstTd.InnerHtml;
                                    if (html.ToLower().Contains("specification"))
                                    {
                                        break;
                                    }
                                }
                                i++;
                            }


                            trs = trs.Skip(i).ToList();

                            foreach (var tr in trs)
                            {
                                var firstTd = tr.QuerySelectorAll("td").FirstOrDefault();
                                if (firstTd != null)
                                {
                                    string html = firstTd.InnerHtml.Trim();
                                    if (html.ToLower().Contains("specification") || string.IsNullOrWhiteSpace(html))
                                    {
                                        var righttd = tr.QuerySelectorAll("td").Last();
                                        if (righttd != null)
                                        {
                                            string innertext = righttd.InnerHtml.Trim();
                                            if (innertext.Contains("Assay"))
                                            {
                                                p.Assay = innertext;
                                                break;
                                            }

                                        }
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }


                        }

                    }

                }

                //var div = webDriver.FindElement(By.Id("pricingContainerMessage"));
                //var innerHtml = div.GetAttribute("innerHTML");
            }
            catch (Exception ex)
            {

            }
            

        }

        
        public async Task<string> GetHtml(string element)
        {
            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(element)))
            {
                request.Headers.TryAddWithoutValidation("Accept", "text/html,application/xhtml+xml,application/xml");
                request.Headers.TryAddWithoutValidation("Accept-Encoding", "gzip, deflate");
                request.Headers.TryAddWithoutValidation("User-Agent", "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0");
                request.Headers.TryAddWithoutValidation("Accept-Charset", "ISO-8859-1");

                using (var response = await _HttpClient.SendAsync(request).ConfigureAwait(false))
                {
                    response.EnsureSuccessStatusCode();
                    using (var responseStream = await response.Content.ReadAsStreamAsync().ConfigureAwait(false))
                    using (var decompressedStream = new GZipStream(responseStream, CompressionMode.Decompress))
                    using (var streamReader = new StreamReader(decompressedStream))
                    {
                        return await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }
        }





        public static IWebElement FindElement(By by)
        {
            try
            {
                WaitForAjax();
                var wait = new WebDriverWait(webDriver, defaultWait);
                return wait.Until(driver => driver.FindElement(by));
            }
            catch
            {
                return null;
            }
        }

        public static void WaitForAjax()
        {
            var wait = new WebDriverWait(webDriver, defaultWait);
            wait.Until(d => (bool)(d as IJavaScriptExecutor).ExecuteScript("return jQuery.active == 0"));
        }

    }
}