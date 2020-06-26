using System;
using System.Web;

public partial class Auth_SignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie reqCookie = Response.Cookies["cinfo"];
        reqCookie.Expires = DateTime.Now.AddSeconds(-1);
        Response.Cookies.Add(reqCookie);
        Response.Redirect("Login.aspx");
    }
}