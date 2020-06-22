using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Issue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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