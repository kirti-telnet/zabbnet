using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Auth_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        string email = cemail.Text;
        string pass = cpass.Text;
        string id = string.Empty;
        HttpCookie cinfo = new HttpCookie("cinfo");
        cinfo.Values["CEmail"] = cemail.Text;
        cinfo.Values["CPass"] = cpass.Text;
        Response.Cookies.Add(cinfo);
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "select * from CompanyMaster where CEmail='" + email + "' and CPassword='" + pass + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            id = sdr[0].ToString();
            cinfo["Cid"] = id;
            Response.Redirect("../Dashboard.aspx");
        }
        else
        {
            Response.Redirect("Registration.aspx");
        }
        con.Close();
    }
}