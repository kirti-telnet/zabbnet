using System;
<<<<<<< Updated upstream
=======
using System.Activities.Statements;
>>>>>>> Stashed changes
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Auth_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
<<<<<<< Updated upstream

=======
        
>>>>>>> Stashed changes
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
            ShowPopup();
        }
<<<<<<< Updated upstream
    }

=======
        
    }
>>>>>>> Stashed changes
    private void ShowPopup()
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
    }

    protected void btn_Close_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
}