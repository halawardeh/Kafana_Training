using System;
using System.Linq;
using System.Web.UI;
using WingtipToys.Models;

namespace WingtipToys
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // رابط التسجيل
                RegisterHyperLink.NavigateUrl = "Register.aspx";

                // التحقق من أن ReturnUrl لا يعيد توجيه المستخدم إلى Login.aspx
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    string decodedUrl = Server.UrlDecode(returnUrl);
                    if (!string.IsNullOrEmpty(decodedUrl) && decodedUrl.IndexOf("Login.aspx", StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string email = Email.Text.Trim();
                string password = Password.Text.Trim();

                using (var context = new ProductContext())
                {
                    var user = context.user.FirstOrDefault(u => u.Email == email && u.Password == password);

                    if (user != null)
                    {
                        // تسجيل الدخول الناجح
                        Session["UserEmail"] = user.Email;
                        Session["UserID"] = user.Id;

                        string returnUrl = Request.QueryString["ReturnUrl"];
                        if (!string.IsNullOrEmpty(returnUrl) && Server.UrlDecode(returnUrl).IndexOf("Login.aspx", StringComparison.OrdinalIgnoreCase) < 0)
                        {
                            Response.Redirect(Server.UrlDecode(returnUrl));
                        }
                        else
                        {
                            Response.Redirect("~/Default.aspx");
                        }
                    }
                    else
                    {
                        FailureText.Text = "Invalid email or password.";
                        ErrorMessage.Visible = true;
                    }
                }
            }
        }
    }
}
