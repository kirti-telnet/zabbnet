using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Auth_SignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie reqCookie = Response.Cookies["cinfo"];
        reqCookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(reqCookie);
        Response.Redirect("Login.aspx");
    }
}