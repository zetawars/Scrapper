using System.Collections.Generic;

namespace DataExtractor.Controllers
{
    public class ProductSubCategory
    {
        public string SubCategoryName { get; set; }
        public List<Product> Products { get; set; }
    }
}