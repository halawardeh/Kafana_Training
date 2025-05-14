using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;
using System.Web.ModelBinding;
using Microsoft.Owin;

namespace WingtipToys
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryID)
        {
            var _DB = new WingtipToys.Models.ProductContext();

            IQueryable<Product> Products= _DB.Products.Where(p=>p.CategoryID==categoryID);

            if (Products.Count()>0)
                return Products;

            return _DB.Products;
        }
        
    }
}