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
   


    public class ProductCategory
    {
        public string CategoryName { get; set; }
        public List<ProductSubCategory> SubCategories { get; set; }

    }

    public class ProductSubCategory
    {
        public string SubCategoryName { get; set; }
        public List<Product> Products { get; set; }
    }

    [Table("Product")]
    public class Product
    {
        [DontInsert]
        [DontUpdate]
        public int ID { get; set; }

        public int SubCategoryID { get; set; }
        public string ID_Link { get; set; } 
        public string name { get; set; }
        [DontInsert]
        [DontUpdate]
        [DontLoad]
        public List<SKU_PackSize> SKU_PackSize { get; set; }
        [DontInsert]
        [DontUpdate]
        [DontLoad]
        public List<string> Packaging { get; set; }
        public string Volume { get; set; }
        public string Density { get; set; }
        public string AmountInKG { get; set; }
        public string PricePerKG { get; set; }
        public string Assay { get; set; }
        public string CASnumber { get; set; }
        public string InChlkey { get; set; }
        public string Description { get; set; }
        public string Biologicalsource { get; set; }
        public string Synonyms { get; set; }
        public string Linearformula { get; set; }
        public string Molecularweight { get; set; }
        public string ECnumber { get; set; }
        public string Beilsteinnumber { get; set; }
        public string PubChemID { get; set; }
        public bool Processed { get; set; }
        public string ProductUrl { get; set; }


    }


    public class SKU_PackSize
    {
        public string SKU { get; set; }
        public string Price { get; set; }
    }


    [Table("Category")]
    public class Category
    {
        [DontInsert][DontUpdate]
        public int ID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryURL { get; set; }
        public bool Processed { get; set; }
    }


    [Table("SubCategory")]
    public class SubCategory
    {
        [DontInsert]
        [DontUpdate]
        public int ID { get; set; }
        public int CategoryID { get; set; }
        public string SubCategoryName { get; set; }
        public string SubCategoryURL { get; set; }
        public bool Processed { get; set; }
    }



    public class HomeController : Controller
    {
        public const string DefaultLink = "https://www.sigmaaldrich.com";
        private static IWebDriver webDriver;
        private static TimeSpan defaultWait = TimeSpan.FromSeconds(10);
        private static String targetUrl = "https://www.sigmaaldrich.com/catalog/product/mm/100126?lang=en&region=PK";
        private static String driversDir = @"C:\Users\Zawar\source\repos\DataExtraction\Scrapper\DataExtractor\Drivers\";
        public async Task<ActionResult> Categories()
        {
            List<ProductCategory> ProductCategories = new List<ProductCategory>();
            Dictionary<string, ProductCategory> ProductCategoriesToBeProcessed = await CategoryPage();
            return View();
        }

        public async Task<ActionResult> Index()
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
                        string query = $"INSERT INTO Product_Packaging (ProductID , Packaging) VALUES ({element.ID}, '{element}');";
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


            //List<SubCategory> subcategories = DBHelper.GetList<SubCategory>();

            //foreach (var s in subcategories)
            //{
            //    Dictionary<string, Product> ProductsToBeProcessed = await ProductsPage(s.SubCategoryURL);
            //    List<Product> ProcessedProducts = new List<Product>();
            //    foreach (var element in ProductsToBeProcessed)
            //    {
            //        Product p = element.Value;
            //        p.SubCategoryID = s.ID;
            //        p.ProductUrl = element.Key;
            //        DBHelper.Insert(p);
            //    }


            //    //ProductDetailPage(p, element.Key);
            //    //InsertProduct(p);
            //    //ProcessedProducts.Add(p);

            //}


            //foreach (var Category in ProductCategoriesToBeProcessed)
            //{
            //    List<SubCategory> SubCategories = new List<SubCategory>();
            //    Dictionary<string, SubCategory> SubCategoriesToBeProcessed = await SubCategoryPage(Category.Key);
            //    foreach (var SubCategory in SubCategoriesToBeProcessed)
            //    {

            //        Dictionary<string, Product> ProductsToBeProcessed = await ProductsPage(SubCategory.Key);
            //        List<Product> ProcessedProducts = new List<Product>();
            //        foreach (var element in ProductsToBeProcessed)
            //        {
            //            Product p = element.Value;
            //            ProductDetailPage(p, element.Key);
            //            ProcessedProducts.Add(p);
            //        }
            //        SubCategories.Add(new Controllers.SubCategory
            //        {
            //            Products = ProcessedProducts,
            //            SubCategoryName = SubCategory.Value.SubCategoryName

            //        });
            //    }
            //}


            //   string subCategoryPage = await GetHtml(newUrl);
            //   await ProcessSubCategoryPage(subCategoryPage, dich);
            return View();
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
                        p.ID_Link += " " + span.InnerHtml.Trim();
                    }

                    var h1 = brand.QuerySelectorAll("h1").FirstOrDefault();
                    if (h1 != null)
                    {
                        p.name = h1.InnerHtml.Trim();
                    }

                    var h2s = brand.QuerySelectorAll("h2").ToList();
                    if (h2s != null)
                    {
                        var descriptionh2 = h2s.Where(x => x.Attributes.Where(y => y.Name == "itemprop" && y.Value == "description").ToList().Count > 0).FirstOrDefault();
                        if (descriptionh2 != null)
                        {
                            p.Description = descriptionh2.InnerHtml.Trim();
                        }
                    }

                    var synonym = brand.QuerySelectorAll(".synonym").FirstOrDefault();
                    if (synonym != null)
                    {
                        var synlist = synonym.QuerySelectorAll("strong").FirstOrDefault();
                        if (synlist != null)
                        {
                            p.Synonyms = synlist.InnerHtml.Trim();
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
                                    p.CASnumber = a.InnerHtml.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("Linear Formula"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Linearformula = a.InnerHtml.Trim();
                                }
                            }
                            else if (ul_p.InnerHtml.Contains("Molecular Weight"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Molecularweight = a.InnerHtml.Trim();
                                }
                            }
                            else if (ul_p.InnerHtml.Contains("EC Number"))
                            {
                                var a = ul_p.QuerySelectorAll("a").FirstOrDefault();
                                if (a != null)
                                {
                                    p.ECnumber = a.InnerHtml.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("Beilstein"))
                            {
                                var a = ul_p.QuerySelectorAll("span").FirstOrDefault();
                                if (a != null)
                                {
                                    p.Beilsteinnumber = a.InnerHtml.Trim();
                                }

                            }
                            else if (ul_p.InnerHtml.Contains("PubChem"))
                            {
                                var a = ul_p.QuerySelectorAll("a").FirstOrDefault();
                                if (a != null)
                                {
                                    p.PubChemID = a.InnerHtml.Trim();
                                }

                            }
                        }
                    }

                }


                p.SKU_PackSize = new List<SKU_PackSize>();
                var SKUDiv = document.QuerySelectorAll("#pricingContainerMessage").FirstOrDefault();
                if (SKUDiv != null)
                {
                    var trWithInfo = SKUDiv.QuerySelectorAll(".backordered").ToList();
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
                                    sku = sku_p.InnerHtml.Trim();
                                }
                            }

                            var priceElement = element.QuerySelectorAll(".price").FirstOrDefault();
                            if (priceElement != null)
                            {
                                var price_p = priceElement.QuerySelectorAll("p").FirstOrDefault();
                                if (price_p != null)
                                {
                                    price = price_p.InnerHtml.Trim();
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
                                            string innertext = righttd.InnerHtml.Trim();
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








        //public static async Task<string> LoadAndWaitForSelector(String url, String selector)
        //{




        //    var browser = await Puppeteer.LaunchAsync(new LaunchOptions
        //    {
        //        Headless = true,
        //        ExecutablePath = @"c:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        //    });
        //    using (Page page = await browser.NewPageAsync())
        //    {
        //        await page.GoToAsync(url);
        //        await page.WaitForSelectorAsync(selector);
        //        return await page.GetContentAsync();
        //    }
        //}



    }
}