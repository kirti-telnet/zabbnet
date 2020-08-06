using System;
using System.Web;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookieCompany = Request.Cookies["cinfo"];
        HttpCookie cookieEmployee = Request.Cookies["empinfo"];
        if (cookieCompany == null && cookieEmployee == null)
        {
            Response.Redirect("/Auth/Login.aspx");
        }

    }
}