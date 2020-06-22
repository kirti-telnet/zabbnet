using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Auth_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Click(object sender, EventArgs e)
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into CompanyMaster(CName,CNumber,CEmail,CPassword,CSubscrip) values(@cname,@num,@email,@passwd,1)", con);
        cmd.Parameters.AddWithValue("cname", cname.Text);
        cmd.Parameters.AddWithValue("num", cnum.Text);
        cmd.Parameters.AddWithValue("email", cemail.Text);
        cmd.Parameters.AddWithValue("passwd", cpass.Text);
        int x = cmd.ExecuteNonQuery();
        con.Close();
        if (x != 0)
        {
            Response.Redirect("Login.aspx");
        }
    }


}