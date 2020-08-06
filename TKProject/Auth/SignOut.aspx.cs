using System;
using System.Web;

public partial class Auth_SignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie CompanyCookies = Request.Cookies["cinfo"];
        HttpCookie EmployeeCookies = Request.Cookies["empinfo"];
        if (CompanyCookies == null && EmployeeCookies == null)
        {
            Response.Redirect("/Auth/Login.aspx");
        }
        else
        {
            if (CompanyCookies != null)
            {
                HttpCookie CompCookie = Request.Cookies["cinfo"];
                CompCookie.Expires = DateTime.Now.AddMinutes(-1);
                Response.Cookies.Add(CompCookie);
                Response.Redirect("Login.aspx");
            }
            else if (EmployeeCookies != null)
            {
                EmployeeCookies.Expires = DateTime.Now.AddMinutes(-1);
                Response.Cookies.Add(EmployeeCookies);
                Response.Redirect("Login.aspx");
            }
        }

    }
}