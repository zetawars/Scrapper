using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataExtractor.Models
{


    public class Wine
    {

        public string Key { get; set; }
        public string Winery_Number { get; set; }
        public string Winery { get; set; }
        public string Name { get; set; }
        public string Vintage { get; set; }
        public string Price_Public { get; set; }
        public string Price_WC { get; set; }
        public string Price_Case_Pub { get; set; }
        public string Price_Case_WC { get; set; }
        public string Price_Sale_Pub { get; set; }
        public string Price_Sale_WC { get; set; }
        public string Flavor_Notes { get; set; }
        public string Tasting_Notes { get; set; }
        public string Type { get; set; }
        public string Varietal { get; set; }
        public string Active { get; set; }
        public string Wine_Maker { get; set; }
        public string Region { get; set; }
        public string Country { get; set; }
        public string Website { get; set; }
        public string Reviewer { get; set; }
        public string Rating { get; set; }
        public string Image_Location { get; set; }
        public string Tasting_Date { get; set; }
        public string Food_Pairing { get; set; }
        public string Composition { get; set; }
        public string Alcohol { get; set; }
        public string Aging { get; set; }

    }



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


    public class RequiredFormatUnesco
    {
        public string Lat { get; set; }
        public string Long { get; set; }
        public string Ref { get; set; }
        public string Property { get; set; }
        public string Name { get; set; }
    }


    public class RootObject
    {
        public List<Place> places { get; set; }
    }



    public class CENTROIDRESULT
    {
        public double LONGITUDE { get; set; }
        public double LATITUDE { get; set; }
    }

    public class QUERYRESULT
    {
        public List<string> COLUMNS { get; set; }
        public List<List<object>> DATA { get; set; }
    }

    public class RootObject2
    {
        public CENTROIDRESULT CENTROIDRESULT { get; set; }
        public string HTMLRESULT { get; set; }
        public QUERYRESULT QUERYRESULT { get; set; }
    }

    public class WineDetail
    {
        public string WineryName = string.Empty;
        public string TableName = string.Empty;
        public string FilePath = string.Empty;
    }

}