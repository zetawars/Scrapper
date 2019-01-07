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
namespace DataExtractor.Controllers
{

    public class cadrempoli
    {
        public string nom_recruteur { get; set; }
        public string localisation { get; set; }
    }

    public class HomeController : Controller
    {
        public async Task<ActionResult> WineDetails()
        {
            List<WineDetail> Details = new List<WineDetail>() {
                new WineDetail{
                    WineryName = "Buena Vista Winery",
                    TableName = "Wine_BuenaVista",
                    FilePath = "~/Content/html/buenaVista.html"
                },
                new WineDetail{
                    WineryName = "Bouchard Aine & Fils",
        TableName = "Wine_BouchardAine",
        FilePath = "~/Content/html/Bouchard.html"
                },
                 new WineDetail{

        WineryName = "Deloach Vineyards",
        TableName = "Wine_Deloach",
        FilePath = "~/Content/html/Deloach.html"
                },/*skip*/
                new WineDetail{
                            WineryName = "Domaine De La Vougeraie",
        TableName = "Wine_Domaine",
        FilePath = "~/Content/html/Domaine.html"
                }, new WineDetail{
                    WineryName = "Frenchie winery",
        TableName = "Wine_Frenchie",
        FilePath = "~/Content/html/frenchie.html"

                }, new WineDetail{
                    WineryName = "JCB by Jean Charles Boisset",
        TableName = "Wine_JCB",
        FilePath = "~/Content/html/jcb.html"

                }, new WineDetail{
                    WineryName = "Jean-Claude Boisset",
        TableName = "Wine_JeanClaude",
        FilePath = "~/Content/html/JeanClaude.html"

                }, new WineDetail{
                    WineryName = "Lockwood Vineyard",
        TableName = "Wine_lockwood",
        FilePath = "~/Content/html/lockwood.html"

                }, new WineDetail{WineryName = "Louis Bouillot",
        TableName = "Wine_Bouillot",
        FilePath = "~/Content/html/Bouillot.html"
                }, new WineDetail{
                    WineryName = "LVE",
        TableName = "Wine_LVE",
        FilePath = "~/Content/html/LVE.html"

                },
                 new WineDetail{
                     WineryName = "Lyeth",
        TableName = "Wine_Lyeth",
        FilePath = "~/Content/html/Lyeth.html"

                },

         new WineDetail{

        WineryName = "Napa Valley Raymond",
        TableName = "Wine_Raymond",
        FilePath = "~/Content/html/Raymond.html"

                },
 new WineDetail{
     WineryName = "Wattle Creek Winery",
        TableName = "Wine_wattle",
        FilePath = "~/Content/html/wattle.html"

                },
 new WineDetail{WineryName = "Bouachon",
        TableName = "Wine_Bouachon",
        FilePath = "~/Content/html/Bouachon.html"


                },
            };
            foreach (var element in Details.Skip(3))
            {
                WineReader(element);
            }
            return View();
        }

        public async Task<ActionResult> Index()
        {

            Reader();
            return View();
        }

        public async void Reader()
        {
            using (StreamReader r = new StreamReader(Server.MapPath(Url.Content("~/Content/SearchJob.html"))))
            {
                string html = r.ReadToEnd();
                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(html);
                var document = htmlDoc.DocumentNode;

                var elements = document.QuerySelectorAll(".job-card").ToList();

                List<cadrempoli> cadrempolis = new List<cadrempoli>();
                foreach (var el in elements)
                {
                    cadrempoli cadrempoli = new cadrempoli();

                    try
                    {
                        string location = el.QuerySelectorAll("#location").First().InnerText;
                        cadrempoli.localisation = location;

                    }
                    catch (Exception ex)
                    {
                    }
                    
                    try
                    {
                        string CompanyName = el.QuerySelectorAll("#companyName").First().InnerText;
                        cadrempoli.nom_recruteur = CompanyName;
                    }
                    catch (Exception ex)
                    {
                    }

                    InsertToDB(cadrempoli);
                    

                }
               
            }

            return;
        }


        //public async void Cadremploi()
        //{
        //    string url = "https://www.cadremploi.fr/emploi/liste_offres";
        //    for (int i = 1; i <= 358; i++)
        //    {
        //        string newUrl = url + "?page=" + i;
        //        string html = await GetHtml(url);
        //        GetRequiredElementsFromHtml(html);
        //    }
        //    return;
        //}

        //public void GetRequiredElementsFromHtml(string html)
        //{
        //    var htmlDoc = new HtmlDocument();
        //    htmlDoc.LoadHtml(html);



        //    var document = htmlDoc.DocumentNode;
        //    try
        //    {
        //        var list = document.QuerySelectorAll(".offre-card").ToList();
        //        foreach (var element in list)
        //        {
        //            cadrempoli cadrempoli = new cadrempoli();
        //            try
        //            {
        //                var no_recruteur = element.QuerySelectorAll(".nom-recruteur").First().InnerText;
        //                cadrempoli.nom_recruteur = no_recruteur.ToString();


        //            }
        //            catch (Exception ex)
        //            {
        //            }
        //            try
        //            {
        //                var localisation= element.QuerySelectorAll(".localisation").First().InnerText;
        //                cadrempoli.localisation = localisation;
        //            }
        //            catch (Exception ex)
        //            {
        //            }
        //            InsertToDB(cadrempoli);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }


        //}

        public void InsertToDB(cadrempoli cadrempoli)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=Wines;Integrated Security=True"))
            {
                con.Open();
                string query = $@"INSERT INTO [dbo].[cadrempoli2] ([nom_recruteur] ,[localisation]) VALUES ('{cadrempoli.nom_recruteur.Replace("'", "''")}' ,'{cadrempoli.localisation.Replace("'", "''")}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }



        //        public async void GetRemixJobs()
        //        {

        //            string Url = "https://remixjobs.com/api/employers?company-visible=1&order=hired&page=";
        //            for (int i = 1; i <= 20; i++)
        //            {
        //                HttpClient _HttpClient = new HttpClient();
        //                using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(Url + i)))
        //                {
        //                    //request.Headers.TryAddWithoutValidation("Accept", "text/html,application/xhtml+xml,application/xml");
        //                    //request.Headers.TryAddWithoutValidation("Accept-Encoding", "gzip, deflate");
        //                    //request.Headers.TryAddWithoutValidation("User-Agent", "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0");
        //                    //request.Headers.TryAddWithoutValidation("Accept-Charset", "ISO-8859-1");

        //                    using (var response = await _HttpClient.SendAsync(request).ConfigureAwait(false))
        //                    {
        //                        var k = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
        //                        RemixCompany companies = JsonConvert.DeserializeObject<RemixCompany>(k);

        //                        foreach (var element in companies.employers)
        //                        {
        //                            InsertEmployer(element);
        //                        }

        //                    }
        //                }


        //            }
        //            //int id = 1;

        //            //using (StreamReader r = new StreamReader(Server.MapPath(Url.Content("~/Content/remixjobs.json"))))
        //            //{
        //            //    string html = r.ReadToEnd();
        //            //    List<RemixJob> Jobs = JsonConvert.DeserializeObject<List<RemixJob>>(html);
        //            //    foreach (var element in Jobs)
        //            //    {
        //            //        InsertJob(element);
        //            //    }
        //            //}
        //        }



        //        public void InsertEmployer(Employer employer)
        //        {
        //            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=Wines;Integrated Security=True"))
        //            {
        //                con.Open();
        //                string query = $@"
        //INSERT INTO [dbo].[RemixCompanies]
        //           ([CompanyName]
        //           ,[JobsOuverts]
        //           ,[Salaraies])
        //     VALUES
        //           ('{employer.company_name.Replace("'", "''")}' ,'{employer.jobs_count}' ,'{employer.company_count_employees}')";
        //                SqlCommand cmd = new SqlCommand(query, con);
        //                cmd.ExecuteNonQuery();
        //                con.Close();
        //            }


        //        }

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
        public async Task<Wine> ReadFromHtml(WineDetail details, string result)
        {
            Wine wine = new Wine();
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(result);
            wine.Winery_Number = "44";
            wine.Winery = details.WineryName;
            var document = htmlDoc.DocumentNode;
            try
            {
                var list = document.QuerySelectorAll("h2").Where(x => x.FirstChild.Name == "div").First();
                wine.Name = list.InnerText.Trim();
                wine.Vintage = list.FirstChild.InnerText.Trim();
            }
            catch (Exception ex)
            {
            }

            try
            {
                wine.Price_Public = document.QuerySelectorAll(".price--retail").First().InnerText;
                double price = double.Parse(wine.Price_Public.Split('$')[1].Trim());
                wine.Price_WC = (price - (price * 0.1)).ToString();
                wine.Price_Case_Pub = (price * 12).ToString();
                wine.Price_Case_WC = ((double.Parse(wine.Price_WC) * 12)).ToString();
                wine.Price_WC = "$" + wine.Price_WC;
                wine.Price_Case_Pub = "$" + wine.Price_Case_Pub;
                wine.Price_Case_WC = "$" + wine.Price_Case_WC;
                wine.Price_Sale_Pub = string.Empty;
                wine.Price_Sale_WC = string.Empty;
            }
            catch (Exception ex)
            {
            }

            try
            {
                var description = document.QuerySelectorAll(".field-wrapper").Where(x => x.FirstChild.Name == "p").First().FirstChild.InnerText.Trim();
                wine.Flavor_Notes = description;
            }
            catch (Exception ex)
            {

            }


            try
            {
                var Testing_Notes_Element = document.QuerySelectorAll("#panel1").First();
                string Testing_Notes = string.Empty;
                foreach (var k in Testing_Notes_Element.ChildNodes.Where(x => x.Name.Trim() == "div"))
                {
                    Testing_Notes += k.QuerySelectorAll(".field-label").First().InnerText.Trim();

                    try
                    {
                        Testing_Notes += "   " + k.QuerySelectorAll("p").First().InnerText.Trim() + ";";
                    }
                    catch (Exception ex)
                    {
                        Testing_Notes += "   " + k.QuerySelectorAll("div").Last().InnerText.Trim() + ";";
                    }

                }
                wine.Tasting_Notes = Testing_Notes;
            }
            catch (Exception ex)
            {
            }

            wine.Type = "Red";

            try
            {
                var Veriatal = document.QuerySelectorAll(".descriptors").First().InnerText.Trim();
                wine.Varietal = Veriatal;
            }
            catch (Exception ex)
            {

            }

            wine.Active = "Yes";
            wine.Wine_Maker = string.Empty;
            wine.Region = "River";
            wine.Country = "USA";
            wine.Website = "www.boissetcollection.com";
            wine.Reviewer = string.Empty;
            wine.Rating = string.Empty;


            try
            {
                var winery_Image = document.QuerySelectorAll(".field-wrapper").Where(x => x.FirstChild.Name == "img").First().FirstChild.Attributes["src"].Value;//.First().Attributes["src"].ToString();
                wine.Image_Location = winery_Image;

            }
            catch (Exception ex)
            {
            }


            wine.Tasting_Date = string.Empty;

            try
            {
                var Food_Pairing_Element = document.QuerySelectorAll("#panel4").First().ChildNodes.Where(x => x.Name.Trim() == "div");
                string Food_Pairing = string.Empty;
                foreach (var k in Food_Pairing_Element)
                {
                    Food_Pairing += k.QuerySelectorAll(".field-label").First().InnerText.Trim();

                    Food_Pairing += "   " + k.QuerySelectorAll(".textformatter-list").First().InnerText.Trim() + ";";

                }
                wine.Food_Pairing = Food_Pairing;
            }
            catch (Exception ex)
            {
            }


            wine.Composition = $"100% {wine.Vintage}";

            try
            {
                string MonthInBarrel = string.Empty;
                string OriginOfOak = string.Empty;
                string Tech_Notes = string.Empty;
                string Alcohal = string.Empty;
                var Tech_Notes_Element = document.QuerySelectorAll("#panel3").First().ChildNodes.Where(x => x.Name.Trim() == "div").First().FirstChild.QuerySelectorAll("li").ToList();
                int age_check = 0;
                foreach (var k in Tech_Notes_Element)
                {
                    string[] SplitedString = k.InnerText.Trim().Split(':').Select(x => x.Trim()).ToArray();

                    if (SplitedString[0] == "Alcohol")
                    {
                        Alcohal = SplitedString[1];
                    }

                    if (SplitedString[0] == "Months in Barrel")
                    {
                        MonthInBarrel = SplitedString[1];
                        age_check = 1;
                    }

                    if (SplitedString[0] == "Origin of Oak")
                    {
                        OriginOfOak = SplitedString[1];
                        age_check = 1;
                    }

                    if (SplitedString[0] == "Aged")
                    {

                        OriginOfOak = SplitedString[1];
                        age_check = 2;
                    }

                    if (SplitedString[0] == "Aging")
                    {
                        age_check = 3;
                        foreach (var element in k.ChildNodes.Where(x => x.Name.Trim() == "ul").First().ChildNodes)
                        {
                            if (element.Name == "li")
                            {
                                OriginOfOak = element.InnerText.Trim() + ";";

                            }
                        }
                    }

                }

                string AgingString = string.Empty;
                if (age_check == 1)
                {
                    AgingString = $"{MonthInBarrel} months in {OriginOfOak} Oak";
                }
                else if (age_check == 2)
                {
                    AgingString = OriginOfOak;
                }
                else if (age_check == 3)
                {

                    AgingString = OriginOfOak;
                }

                wine.Alcohol = Alcohal;
                wine.Aging = AgingString;
            }
            catch (Exception ex)
            {

            }

            return wine;
        }
        public async void WineReader(WineDetail Details)
        {
            int id = 1;
            using (StreamReader r = new StreamReader(Server.MapPath(Details.FilePath)))
            {
                string html = r.ReadToEnd();
                List<string> Urls = html.Split(new string[] { "about=" }, StringSplitOptions.None).ToList().Skip(1).Select(x => "https://my.boissetcollection.com" + x.Split('\"')[1]).ToList();
                string result = string.Empty;
                foreach (var element in Urls)
                {
                    result = await GetHtml(element);
                    Wine wine = await ReadFromHtml(Details, result);
                    wine.Key = id.ToString();
                    id++;

                    foreach (var prop in wine.GetType().GetProperties())
                    {
                        if (prop.GetValue(wine) == null)
                        {
                            prop.SetValue(wine, "");
                        }
                    }

                    foreach (var prop in wine.GetType().GetProperties())
                    {
                        prop.SetValue(wine, prop.GetValue(wine).ToString().Replace("'", "''"));
                    }

                    InsertWine(Details, wine);
                }
            }
        }
        public void InsertWine(WineDetail details, Wine wine)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=Wines;Integrated Security=True"))
            {
                con.Open();

                string query = $@"
INSERT INTO [dbo].[{details.TableName}]
           ([Key]
           ,[Winery_Number]
           ,[Winery]
           ,[Name]
           ,[Vintage]
           ,[Price_Public]
           ,[Price_WC]
           ,[Price_Case_Pub]
           ,[Price_Case_WC]
           ,[Price_Sale_Pub]
           ,[Price_Sale_WC]
           ,[Flavor_Notes]
           ,[Tasting_Notes]
           ,[Type]
           ,[Varietal]
           ,[Active]
           ,[Wine_Maker]
           ,[Region]
           ,[Country]
           ,[Website]
           ,[Reviewer]
           ,[Rating]
           ,[Image_Location]
           ,[Tasting_Date]
           ,[Food_Pairing]
           ,[Composition]
           ,[Alcohol]
           ,[Aging])
     VALUES
           ('{wine.Key}'
           ,'{wine.Winery_Number}'
           ,'{wine.Winery}'
           ,'{wine.Name}'
           ,'{wine.Vintage}'
           ,'{wine.Price_Public}'
           ,'{wine.Price_WC}'
           ,'{wine.Price_Case_Pub}'
           ,'{wine.Price_Case_WC}'
           ,'{wine.Price_Sale_Pub}'
           ,'{wine.Price_Sale_WC}'
           ,'{wine.Flavor_Notes}'
           ,'{wine.Tasting_Notes}'
           ,'{wine.Type}'
           ,'{wine.Varietal}'
           ,'{wine.Active}'
           ,'{wine.Wine_Maker}'
           ,'{wine.Region}'
           ,'{wine.Country}'
           ,'{wine.Website}'
           ,'{wine.Reviewer}'
           ,'{wine.Rating}'
           ,'{wine.Image_Location}'
           ,'{wine.Tasting_Date}'
           ,'{wine.Food_Pairing}'
           ,'{wine.Composition}'
           ,'{wine.Alcohol}'
           ,'{wine.Aging}');

";



                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
    }
}







/*
 
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

        public async Task<Wine> ReadFromHtml(string result)
        {
            Wine wine = new Wine();
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(result);
            wine.Winery_Number = "44";
            wine.Winery = "Deloach Vineyards";
            var document = htmlDoc.DocumentNode;
            try
            {
                var list = document.QuerySelectorAll("h2").Where(x => x.FirstChild.Name == "div").First();
                wine.Name = list.InnerText.Trim();
                wine.Vintage = list.FirstChild.InnerText.Trim();
            }
            catch (Exception ex)
            {
            }

            try
            {
                wine.Price_Public = document.QuerySelectorAll(".price--retail").First().InnerText;
                double price = double.Parse(wine.Price_Public.Split('$')[1].Trim());
                wine.Price_WC = (price - (price * 0.1)).ToString();
                wine.Price_Case_Pub = (price * 12).ToString();
                wine.Price_Case_WC = ((double.Parse(wine.Price_WC) * 12)).ToString();
                wine.Price_WC = "$" + wine.Price_WC;
                wine.Price_Case_Pub = "$" + wine.Price_Case_Pub;
                wine.Price_Case_WC = "$" + wine.Price_Case_WC;
                wine.Price_Sale_Pub = string.Empty;
                wine.Price_Sale_WC = string.Empty;
            }
            catch (Exception ex)
            {
            }

            try
            {
                var description = document.QuerySelectorAll(".field-wrapper").Where(x => x.FirstChild.Name == "p").First().FirstChild.InnerText.Trim();
                wine.Flavor_Notes = description;
            }
            catch (Exception ex)
            {

            }


            try
            {
                var Testing_Notes_Element = document.QuerySelectorAll("#panel1").First();
                string Testing_Notes = string.Empty;
                foreach (var k in Testing_Notes_Element.ChildNodes.Where(x => x.Name.Trim() == "div"))
                {
                    Testing_Notes += k.QuerySelectorAll(".field-label").First().InnerText.Trim() + System.Environment.NewLine;

                    try
                    {
                        Testing_Notes += k.QuerySelectorAll("p").First().InnerText.Trim() + ";" + System.Environment.NewLine;
                    }
                    catch (Exception ex)
                    {
                        Testing_Notes += k.QuerySelectorAll("div").Last().InnerText.Trim() + ";" + System.Environment.NewLine;
                    }
                    
                }
                wine.Tasting_Notes = Testing_Notes;
            }
            catch (Exception ex)
            {
            }

            wine.Type = "Red";

            try
            {
                var Veriatal = document.QuerySelectorAll(".descriptors").First().InnerText.Trim();
                wine.Varietal = Veriatal;
            }
            catch (Exception ex)
            {

            }
          
            wine.Active = "Yes";
            wine.Wine_Maker = string.Empty;
            wine.Region = "River";
            wine.Country = "USA";
            wine.Website = "www.boissetcollection.com";
            wine.Reviewer = string.Empty;
            wine.Rating = string.Empty;


            try {
                var winery_Image = document.QuerySelectorAll(".field-wrapper").Where(x => x.FirstChild.Name == "img").First().FirstChild.Attributes["src"].Value;//.First().Attributes["src"].ToString();
                wine.Image_Location = winery_Image;

            }
            catch (Exception ex)
            {
            }

            
            wine.Tasting_Date = string.Empty;

            try
            {
                var Food_Pairing_Element = document.QuerySelectorAll("#panel4").First().ChildNodes.Where(x => x.Name.Trim() == "div");
                string Food_Pairing = string.Empty;
                foreach (var k in Food_Pairing_Element)
                {
                    Food_Pairing += k.QuerySelectorAll(".field-label").First().InnerText.Trim() + System.Environment.NewLine;

                    Food_Pairing += k.QuerySelectorAll(".textformatter-list").First().InnerText.Trim() + ";" + System.Environment.NewLine;

                }
                wine.Food_Pairing = Food_Pairing;
            }
            catch (Exception ex)
            {
            }

           
            wine.Composition = $"100% {wine.Vintage}";

            try
            {
                string MonthInBarrel = string.Empty;
                string OriginOfOak = string.Empty;
                string Tech_Notes = string.Empty;
                string Alcohal = string.Empty;
                var Tech_Notes_Element = document.QuerySelectorAll("#panel3").First().ChildNodes.Where(x => x.Name.Trim() == "div").First().FirstChild.QuerySelectorAll("li").ToList();
                foreach (var k in Tech_Notes_Element)
                {
                    string[] SplitedString = k.InnerText.Trim().Split(':').Select(x => x.Trim()).ToArray();

                    if (SplitedString[0] == "Alcohol")
                    {
                        Alcohal = SplitedString[1];
                    }

                    if (SplitedString[0] == "Months in Barrel")
                    {
                        MonthInBarrel = SplitedString[1];
                    }

                    if (SplitedString[0] == "Origin of Oak")
                    {
                        OriginOfOak = SplitedString[1];
                    }

                }

                string AgingString = $"{MonthInBarrel} months in {OriginOfOak} Oak";
                //Aging String Format = 15 months in French and Hungarian Oak
                wine.Alcohol = Alcohal;
                wine.Aging = AgingString;
            }
            catch (Exception ex)
            {

            }
            
            return wine;
        }

        public async void WineReader()
        {
            int id = 1;
            using (StreamReader r = new StreamReader(Server.MapPath("~/Content/html/deloach.html")))
            {
                string html = r.ReadToEnd();
                List<string> Urls = html.Split(new string[] { "about=" }, StringSplitOptions.None).ToList().Skip(1).Select(x=> "https://my.boissetcollection.com" + x.Split('\"')[1] ).ToList();
                string result = string.Empty;
                foreach (var element in Urls)
                {
                    result = await GetHtml(element);
                    Wine wine = await ReadFromHtml(result);
                    wine.Key= id.ToString();
                    id++;

                    foreach (var prop in wine.GetType().GetProperties())
                    {
                        if (prop.GetValue(wine) == null)
                        {
                            prop.SetValue(wine, "");
                        }
                    }

                    foreach (var prop in wine.GetType().GetProperties())
                    {
                        prop.SetValue(wine, prop.GetValue(wine).ToString().Replace("'", "''"));
                    }

                    InsertWine(wine);
                }
            }
        }


        public void InsertWine(Wine wine)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=Wines;Integrated Security=True"))
            {
                con.Open();

                string query = $@"
INSERT INTO [dbo].[Wine_Deloach]
           ([Key]
           ,[Winery_Number]
           ,[Winery]
           ,[Name]
           ,[Vintage]
           ,[Price_Public]
           ,[Price_WC]
           ,[Price_Case_Pub]
           ,[Price_Case_WC]
           ,[Price_Sale_Pub]
           ,[Price_Sale_WC]
           ,[Flavor_Notes]
           ,[Tasting_Notes]
           ,[Type]
           ,[Varietal]
           ,[Active]
           ,[Wine_Maker]
           ,[Region]
           ,[Country]
           ,[Website]
           ,[Reviewer]
           ,[Rating]
           ,[Image_Location]
           ,[Tasting_Date]
           ,[Food_Pairing]
           ,[Composition]
           ,[Alcohol]
           ,[Aging])
     VALUES
           ('{wine.Key}'
           ,'{wine.Winery_Number}'
           ,'{wine.Winery}'
           ,'{wine.Name}'
           ,'{wine.Vintage}'
           ,'{wine.Price_Public}'
           ,'{wine.Price_WC}'
           ,'{wine.Price_Case_Pub}'
           ,'{wine.Price_Case_WC}'
           ,'{wine.Price_Sale_Pub}'
           ,'{wine.Price_Sale_WC}'
           ,'{wine.Flavor_Notes}'
           ,'{wine.Tasting_Notes}'
           ,'{wine.Type}'
           ,'{wine.Varietal}'
           ,'{wine.Active}'
           ,'{wine.Wine_Maker}'
           ,'{wine.Region}'
           ,'{wine.Country}'
           ,'{wine.Website}'
           ,'{wine.Reviewer}'
           ,'{wine.Rating}'
           ,'{wine.Image_Location}'
           ,'{wine.Tasting_Date}'
           ,'{wine.Food_Pairing}'
           ,'{wine.Composition}'
           ,'{wine.Alcohol}'
           ,'{wine.Aging}');

";



                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }

     */





/*

    public async void Hydro()
    {
        string result = string.Empty;
        List<string> HtmlLinks = new List<string>();
        List<string> Links = new List<string>();
        List<RequiredFormat> format = new List<RequiredFormat>();

        RootObject items = new RootObject();

        using (StreamReader r = new StreamReader(Server.MapPath("~/Content/hydro.json")))
        {
            string json = r.ReadToEnd();
            items = JsonConvert.DeserializeObject<RootObject>(json);
        }
        //3045 - duplicate
        items.places = items.places.Skip(4783).ToList();
        foreach (var element in items.places)
        {
            RequiredFormat Obj = new RequiredFormat();
            Obj.Name = element.title;
            Obj.Lat = element.latitude.ToString();
            Obj.Lon = element.longitude.ToString();

            string URL = "http://www.industryabout.com/" + element.html.Split('"')[1];

            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                        result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }

            result = result.Split(new string[] { "Power Capacity" }, StringSplitOptions.None).Last();

            var index = result.IndexOf("<");
            result = result.Substring(1, index - 1).Trim();
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=AnnualProduction;Integrated Security=True"))
            {
                con.Open();
                string query = $"INSERT INTO HydroEnergyCamp (Title, Lat,Long, PowerCapacity) VALUES ('{Obj.Name.Replace("'", "''")}','{Obj.Lat.Replace("'", "''")}','{Obj.Lon.Replace("'", "''")}','{result.Replace("'", "''")}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            //Thread.Sleep(3000);
        }
    }




    public async void Aluminum()
    {
        string result = string.Empty;
        List<string> HtmlLinks = new List<string>();
        List<string> Links = new List<string>();
        List<RequiredFormat> format = new List<RequiredFormat>();

        RootObject items = new RootObject();

        using (StreamReader r = new StreamReader(Server.MapPath("~/Content/aluminum.json")))
        {
            string json = r.ReadToEnd();
            items = JsonConvert.DeserializeObject<RootObject>(json);
        }

        foreach (var element in items.places)
        {
            RequiredFormat Obj = new RequiredFormat();
            Obj.Name = element.title;
            Obj.Lat = element.latitude.ToString();
            Obj.Lon = element.longitude.ToString();

            string URL = "http://www.industryabout.com/" + element.html.Split('"')[1];

            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                        result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }

            result = result.Split(new string[] { "Annual Production" }, StringSplitOptions.None).Last();

            var index = result.IndexOf("<");
            result = result.Substring(1, index - 1).Trim();
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=AnnualProduction;Integrated Security=True"))
            {
                con.Open();
                string query = $"INSERT INTO AluminumMiningCamp (Title, Lat,Long, AnnualProduction) VALUES ('{Obj.Name.Replace("'", "''")}','{Obj.Lat.Replace("'", "''")}','{Obj.Lon.Replace("'", "''")}','{result.Replace("'", "''")}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            //Thread.Sleep(3000);
        }
    }




    public async void Platinum()
    {
        string result = string.Empty;
        List<string> HtmlLinks = new List<string>();
        List<string> Links = new List<string>();
        List<RequiredFormat> format = new List<RequiredFormat>();

        RootObject items = new RootObject();

        using (StreamReader r = new StreamReader(Server.MapPath("~/Content/Platinum.json")))
        {
            string json = r.ReadToEnd();
            items = JsonConvert.DeserializeObject<RootObject>(json);
        }

        foreach (var element in items.places)
        {
            RequiredFormat Obj = new RequiredFormat();
            Obj.Name = element.title;
            Obj.Lat = element.latitude.ToString();
            Obj.Lon = element.longitude.ToString();

            string URL = "http://www.industryabout.com/" + element.html.Split('"')[1];

            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                        result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }

            result = result.Split(new string[] { "Annual Production" }, StringSplitOptions.None).Last();

            var index = result.IndexOf("<");
            result = result.Substring(1, index - 1).Trim();
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=AnnualProduction;Integrated Security=True"))
            {
                con.Open();
                string query = $"INSERT INTO PlatinumMiningCamp (Title, Lat,Long, AnnualProduction) VALUES ('{Obj.Name.Replace("'", "''")}','{Obj.Lat.Replace("'", "''")}','{Obj.Lon.Replace("'", "''")}','{result.Replace("'", "''")}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            //Thread.Sleep(3000);
        }
    }




    public async void WorldOilRefineries()
    {
        string result = string.Empty;
        List<string> HtmlLinks = new List<string>();
        List<string> Links = new List<string>();
        List<RequiredFormat> format = new List<RequiredFormat>();

        RootObject items = new RootObject();

        using (StreamReader r = new StreamReader(Server.MapPath("~/Content/Oil.json")))
        {
            string json = r.ReadToEnd();
            items = JsonConvert.DeserializeObject<RootObject>(json);
        }

        foreach (var element in items.places)
        {
            RequiredFormat Obj = new RequiredFormat();
            Obj.Name = element.title;
            Obj.Lat = element.latitude.ToString();
            Obj.Lon = element.longitude.ToString();

            string URL = "http://www.industryabout.com/" + element.html.Split('"')[1];

            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                        result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }

            result = result.Split(new string[] { "Installed Capacity" }, StringSplitOptions.None).Last();

            var index = result.IndexOf("<");
            result = result.Substring(1, index - 1).Trim();
            using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=AnnualProduction;Integrated Security=True"))
            {
                con.Open();
                string query = $"INSERT INTO WorldOilRefineriesMap (Title, Lat,Long, InstalledCapacity) VALUES ('{Obj.Name.Replace("'", "''")}','{Obj.Lat.Replace("'", "''")}','{Obj.Lon.Replace("'", "''")}','{result.Replace("'", "''")}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Thread.Sleep(3000);
        }
    }






    public async void WorldCopperMiningCamp()
    {
        string result = string.Empty;
        List<string> HtmlLinks = new List<string>();
        List<string> Links = new List<string>();
        List<RequiredFormat> format = new List<RequiredFormat>();

        RootObject items = new RootObject();

        using (StreamReader r = new StreamReader(Server.MapPath("~/Content/jsondata.json")))
        {
            string json = r.ReadToEnd();
            items = JsonConvert.DeserializeObject<RootObject>(json);
        }

        foreach (var element in items.places)
        {
            RequiredFormat Obj = new RequiredFormat();
            Obj.Name = element.title;
            Obj.Lat = element.latitude.ToString();
            Obj.Lon = element.longitude.ToString();

            string URL = "http://www.industryabout.com/" + element.html.Split('"')[1];

            HttpClient _HttpClient = new HttpClient();
            using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                        result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                    }
                }
            }

            result = result.Split(new string[] { "Annual Production" }, StringSplitOptions.None).Last();

            var index = result.IndexOf("<");
            result = result.Substring(1, index - 1).Trim();
            using (SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-ROUF\LOCAL2016;Initial Catalog=AnnualProduction;Integrated Security=True"))
            {
                con.Open();
                string query = $"INSERT INTO Records (Title, Lat,Long, AnnualProduction) VALUES ('{Obj.Name}','{Obj.Lat}','{Obj.Lon}','{result}')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Thread.Sleep(5000);
        }
    }



    public async void unesco()
        {
            string result = string.Empty;
            List<string> HtmlLinks = new List<string>();
            List<string> Links = new List<string>();
            List<RequiredFormat> format = new List<RequiredFormat>();

            RootObject2 items = new RootObject2();

            using (StreamReader r = new StreamReader(Server.MapPath("~/Content/unesco.json")))
            {
                string json = r.ReadToEnd();
                items = JsonConvert.DeserializeObject<RootObject2>(json);
            }
            //3045 - duplicate
            //items.places = items.places.Skip(4783).ToList();
            var k = items.QUERYRESULT.DATA.Select(x => x[4]).ToList();
            foreach (var element in items.QUERYRESULT.DATA)
            {
                var ElementID = element[4];

                RequiredFormatUnesco Obj = new RequiredFormatUnesco();
                //[-54.5947222200,158.8955556000,0,2,629,"Macquarie Island"]
                Obj.Lat = element[0].ToString();
                Obj.Long = element[1].ToString();
                Obj.Name = element[5].ToString();
                Obj.Ref = element[4].ToString();
                string URL = "https://whc.unesco.org/en/list/" + ElementID;// + element.html.Split('"')[1];

                HttpClient _HttpClient = new HttpClient();
                using (var request = new HttpRequestMessage(HttpMethod.Get, new Uri(URL)))
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
                            result = await streamReader.ReadToEndAsync().ConfigureAwait(false);
                        }
                    }
                }


                string Property = string.Empty;
                try
                {
                    Property = result.Split(new string[] { "<strong>Property :</strong>" }, StringSplitOptions.None).Last();
                    var index = Property.IndexOf("<");
                    Property = Property.Substring(1, index - 1).Trim();

                }
                catch (Exception ex)
                {
                    Property = "";
                }

                using (SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=AnnualProduction;Integrated Security=True"))
                {
                    con.Open();
                    string query = $"INSERT INTO Unesco (Name,Property, Lat, Long, Ref) VALUES ('{Obj.Name.Replace("'", "''")}','{Property.Replace("'", "''")}','{Obj.Lat.Replace("'", "''")}','{Obj.Long.Replace("'", "''")}','{Obj.Ref.Replace("'", "''")}')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                //Thread.Sleep(3000);
            }
        }


 */
