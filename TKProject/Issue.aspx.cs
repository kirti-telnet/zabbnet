using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Issue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie coookie = Request.Cookies["cinfo"];
        if (coookie != null)
        {
            BindData();
        }
    }
    private void BindData()
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = "Select Ttitle,Tdesc,IsSolved from TMaster";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string UnreadText = "";
        Int32 i = 0;
        while (dr.Read())
        {
            UnreadText += "<tr>";
            UnreadText += "<td>" + dr["Ttitle"] + "</td>";
            UnreadText += "<td>" + dr["Tdesc"] + "</td>";
            UnreadText += "<td>" + dr["IsSolved"] + "</td>";
            UnreadText += "</tr>";
            tlist.InnerHtml = UnreadText;
            i++;
        }
        con.Close();

    }
}