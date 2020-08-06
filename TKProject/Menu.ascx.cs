using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie CompanyCookies = Request.Cookies["cinfo"];
        HttpCookie EmployeeCookies = Request.Cookies["empinfo"];
        if (CompanyCookies==null && EmployeeCookies == null)
        {
            Response.Redirect("/Auth/Login.aspx");
        }
        else
        {
            if (CompanyCookies != null)
            {
                ShowCompanyName();
            }
            else if (EmployeeCookies != null)
            {
                ShowEmployeeName();
            }
        }

    }
    private void ShowCompanyName()
    {
        string name, cid;
        string email = String.Empty;
        string pass = String.Empty;
        HttpCookie CompanyCookies = Request.Cookies["cinfo"];
        if (CompanyCookies != null)
        {
            cid = CompanyCookies["Cid"].ToString();
            email = CompanyCookies["CEmail"].ToString();
            pass = CompanyCookies["CPass"].ToString();
        }
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "select CName from CompanyMaster where CEmail='" + email + "' and CPassword='" + pass + "'";
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
    private void ShowEmployeeName()
    {
        string name, eid;
        string email = String.Empty;
        string pass = String.Empty;
        HttpCookie EmployeeCookies = Request.Cookies["empinfo"];
        if (EmployeeCookies != null)
        {
            eid = EmployeeCookies["Eid"].ToString();
            email = EmployeeCookies["UEmail"].ToString();
            pass = EmployeeCookies["UPass"].ToString();
        }
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "select UName from UserMaster where UEmail='" + email + "' and UPass='" + pass + "'";
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