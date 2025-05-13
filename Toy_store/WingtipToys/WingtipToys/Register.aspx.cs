using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Web.Security;

namespace WingtipToys
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ما في داعي نحط كود التسجيل هون
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            using (ProductContext db = new ProductContext())
            {
                string email = Email.Text.Trim();
                string password = Password.Text.Trim();

                var existingUser = db.user.FirstOrDefault(u => u.Email == email);
                if (existingUser != null)
                {
                    Literal1.Text = "This email is already registered.";
                    ErrorMessage.Visible = true;
                    return;
                }

                User newUser = new User
                {
                    Email = email,
                    Password = password, // 🔒 يفضل نعمل تشفير لاحقًا
                    //FirstName = FirstName.Text.Trim()
                };

                db.user.Add(newUser);
                db.SaveChanges();

                Session["User"] = newUser;
                Response.Redirect("~/Home.aspx");
            }
        }



    }
}
