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

namespace DataExtractor.Controllers
{

    public class Tag
    {
        public string title { get; set; }
        public int lft { get; set; }
    }

    public class Place
    {
        public string title { get; set; }
        public string category { get; set; }
        public string category_lft { get; set; }
        public string language { get; set; }
        public List<Tag> tags { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
        public object image { get; set; }
        public string html { get; set; }
        public string article_url { get; set; }
        public string marker { get; set; }
    }

    public class RequiredFormat
    {
        public string Name { get; set; }
        public string Lat { get; set; }
        public string Lon { get; set; }
        public string AnnualProduction { get; set; }

    }

    public class RootObject
    {
        public List<Place> places { get; set; }
    }


    public class HomeController : Controller
    {
        // GET: Home
        public async Task<ActionResult> Index()
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

                string URL = "http://www.industryabout.com/"  + element.html.Split('"')[1];

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
                result = result.Substring(1, index-1).Trim();
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

          //return Content(result);
            
            return View();


        }
    }
}