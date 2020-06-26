using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Team : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie coookie = Request.Cookies["cinfo"];
        if (coookie != null)
        {
            BindData();
        }
        else
        {
            Response.Redirect("/Auth/Login.aspx");
        }
    }
    private void BindData()
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "Select UName,UEmail,UPassword,UAccess from UserMaster";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string UnreadText = "";
        Int32 i = 0;
        while (dr.Read())
        {
            UnreadText += "<tr>";
            UnreadText += "<td>" + dr["UName"] + "</td>";
            UnreadText += "<td>" + dr["UEmail"] + "</td>";
            UnreadText += "<td>" + dr["UPassword"] + "</td>";
            UnreadText += "<td>" + dr["UAccess"] + "</td>";
            UnreadText += "</tr>";
            tlist.InnerHtml = UnreadText;
            i++;
        }
        con.Close();
    }
}