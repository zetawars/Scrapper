using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataExtractor.Models
{

    public class FullPicture
    {
        public string url { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class Picture1
    {
        public string url { get; set; }
        public string path { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class Picture2
    {
        public string url { get; set; }
        public string path { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class Picture3
    {
        public string url { get; set; }
        public string path { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class CompanyPage
    {
        public Picture1 picture1 { get; set; }
        public Picture2 picture2 { get; set; }
        public Picture3 picture3 { get; set; }
        public string video1 { get; set; }
        public string video2 { get; set; }
        public string video3 { get; set; }
    }

    public class FullCompanyLogo
    {
        public string url { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class Logo
    {
        public string url { get; set; }
        public string path { get; set; }
        public string width { get; set; }
        public string height { get; set; }
    }

    public class Www
    {
        public string href { get; set; }
    }

    public class Links
    {
        public Www www { get; set; }
    }

    public class Technology
    {
        public string id { get; set; }
        public string name { get; set; }
        public string logo_url { get; set; }
        public string category { get; set; }
    }

    public class Advantage
    {
        public string id { get; set; }
        public string name { get; set; }
        public string logo_url { get; set; }
    }

    public class Employer
    {
        public string id { get; set; }
        public string plainId { get; set; }
        public string employer { get; set; }
        public string name { get; set; }
        public FullPicture full_picture { get; set; }
        public string picture { get; set; }
        public string city { get; set; }
        public string description { get; set; }
        public string developer_count { get; set; }
        public string jobs_count { get; set; }
        public string company_average_age { get; set; }
        public string twitter { get; set; }
        public string year_create { get; set; }
        public List<string> roles { get; set; }
        public CompanyPage company_page { get; set; }
        public string company_address { get; set; }
        public string company_pitch { get; set; }
        public string company_name { get; set; }
        public string company_zipcode { get; set; }
        public string company_logo { get; set; }
        public FullCompanyLogo full_company_logo { get; set; }
        public string company_description { get; set; }
        public string company_city { get; set; }
        public string company_count_employees { get; set; }
        public string company_website { get; set; }
        public bool company_visible { get; set; }
        public string lat { get; set; }
        public string lng { get; set; }
        public Logo logo { get; set; }
        public bool search_by_located_city_allowed { get; set; }
        public Links _links { get; set; }
        public List<object> quotes { get; set; }
        public List<Technology> technologies { get; set; }
        public List<Advantage> advantages { get; set; }
        public List<object> pictures { get; set; }
    }

    public class Self
    {
        public string href { get; set; }
    }

    public class Next
    {
        public string href { get; set; }
    }

    public class Links2
    {
        public object prev { get; set; }
        public Self self { get; set; }
        public Next next { get; set; }
    }

    public class RemixCompany
    {
        public List<Employer> employers { get; set; }
        public Links2 _links { get; set; }
    }
}