using System.Collections.Generic;

namespace DataExtractor.Controllers
{
    public class ProductCategory
    {
        public string CategoryName { get; set; }
        public List<ProductSubCategory> SubCategories { get; set; }

    }
}