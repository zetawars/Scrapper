using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataExtractor.Models
{

    public class CompanyLogo
    {
        public string url { get; set; }
        public string path { get; set; }
        public int width { get; set; }
        public int height { get; set; }
    }

    public class Category
    {
        public string name { get; set; }
        public string localized_name { get; set; }
        public string localized_menu_name { get; set; }
        public string rss { get; set; }
        public string feedburner_id { get; set; }
        public string twitter_url { get; set; }
        public string twitter_screen_name { get; set; }
    }

    public class ShortUrl
    {
        public string short_url { get; set; }
    }

    public class Company
    {
        public string city { get; set; }
        public int company_count_employees { get; set; }
        public int type { get; set; }
        public string description { get; set; }
        public string id { get; set; }
        public int plainId { get; set; }
        public List<object> thumbnails { get; set; }
        public List<object> pictures { get; set; }
    }

    public class Www
    {
        public string href { get; set; }
    }

    public class Links
    {
        public Www www { get; set; }
    }

    public class RemixJob
    {
        public int id { get; set; }
        public string title { get; set; }
        public string contract_type { get; set; }
        public string description { get; set; }
        public string other_infos { get; set; }
        public string company_description { get; set; }
        public string candidate_description { get; set; }
        public int paycheck { get; set; }
        public string paycheck_period { get; set; }
        public string listTitle { get; set; }
        public string secondary_email { get; set; }
        public string experience { get; set; }
        public string study { get; set; }
        public string company_website { get; set; }
        public string company_name { get; set; }
        public CompanyLogo company_logo { get; set; }
        public object company_pitch { get; set; }
        public List<object> tags { get; set; }
        public List<string> technologies { get; set; }
        public string status { get; set; }
        public bool soldout { get; set; }
        public DateTime validation_time { get; set; }
        public DateTime creation_time { get; set; }
        public DateTime update_time { get; set; }
        public bool telecommute { get; set; }
        public List<Category> categories { get; set; }
        public ShortUrl short_url { get; set; }
        public object geolocation { get; set; }
        public bool highlight { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string zipcode { get; set; }
        public string countrycode { get; set; }
        public Company company { get; set; }
        public string package_type { get; set; }
        public int applications_number { get; set; }
        public bool allow_non_eu_applications { get; set; }
        public object apply_url { get; set; }
        public int views { get; set; }
        public Links _links { get; set; }
    }

}