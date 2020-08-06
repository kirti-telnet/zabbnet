using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Auth_Login : System.Web.UI.Page
{
    string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        string cid, email, pass;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "select Cid,CEmail,CPassword from CompanyMaster where CEmail='" + cemail.Text + "' and CPassword='" + cpass.Text + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            HttpCookie cinfo = new HttpCookie("cinfo");
            cinfo.Values["CEmail"] = cemail.Text;
            cinfo.Values["CPass"] = cpass.Text;
            Response.Cookies.Add(cinfo);
            cid = sdr[0].ToString();
            email = sdr[1].ToString();
            pass = sdr[2].ToString();
            if (cinfo["CEmail"] == email && cinfo["CPass"] == pass)
            {
                cinfo["Cid"] = cid;
                Response.Redirect("../Dashboard.aspx");
            }
            else
            {
                Response.Redirect("Registration.aspx");
            }

        }
        else
        {
            CheckEmployee();
        }
        con.Close();
    }
    private void CheckEmployee()
    {
        string eid, email, pass;
        SqlConnection conn = new SqlConnection(strcon);
        conn.Open();
        string query = "select Eid,UEmail,UPass from UserMaster where UEmail='" + cemail.Text + "' and UPass='" + cpass.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            HttpCookie empinfo = new HttpCookie("empinfo");
            empinfo.Values["UEmail"] = cemail.Text;
            empinfo.Values["UPass"] = cpass.Text;
            Response.Cookies.Add(empinfo);
            eid = sdr[0].ToString();
            email = sdr[1].ToString();
            pass = sdr[2].ToString();
            if (empinfo["UEmail"] == email && empinfo["UPass"] == pass)
            {
                empinfo["Eid"] = eid;
                Response.Redirect("/Dashboard.aspx");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "errorMessage();", true);
            ClearControls(this);
        }
    }
    public void ClearControls(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if ((c.GetType() == typeof(TextBox)))
            {
                ((TextBox)(c)).Text = "";
            }

            if (c.HasControls())
            {
                ClearControls(c);
            }
        }
    }
}