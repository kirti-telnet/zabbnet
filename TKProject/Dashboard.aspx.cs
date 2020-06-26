using System;
using System.Web;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie coookie = Request.Cookies["cinfo"];
        if (coookie == null)
        {
            Response.Redirect("/Auth/Login.aspx");
        }
    }
}