using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cemail = string.Empty;
        string pass = string.Empty;
        string name = string.Empty;
        string id = string.Empty;
        HttpCookie reqCookies = Request.Cookies["cinfo"];
        if (reqCookies != null)
        {
            id = reqCookies["Cid"].ToString();
            cemail = reqCookies["CEmail"].ToString();
            pass = reqCookies["CPass"].ToString();
        }
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "select CName from CompanyMaster where CEmail='" + cemail + "' and CPassword='" + pass + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            name = sdr[0].ToString();
            lbl.Text = name;
        }
        else
        {
            lbl.Text = "Name not found";
        }
        con.Close();
    }
}