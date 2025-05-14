using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;
using System.Web.ModelBinding;

namespace WingtipToys
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProduct([QueryString("productID")] int? ProductID)
        {
            var _DB = new WingtipToys.Models.ProductContext();
            IQueryable<Product> allproducts = _DB.Products;
            var product = _DB.Products.Where(p => p.ProductID == ProductID);
            if (product != null)
                return product;
            return allproducts;
        }
    }
}