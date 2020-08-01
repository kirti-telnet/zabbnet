using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Team : System.Web.UI.Page
{
    string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            HttpCookie coookie = Request.Cookies["cinfo"];
            if (coookie != null)
            {
                BindDropDown();
                BindData();
            }
            else
            {
                Response.Redirect("/Auth/Login.aspx");
            }
        }
       
    }
    private void BindData()
    {
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string query = " Select UEid,UName,UEmail,UPass,UAccess from UserMaster";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string UnreadText = "";
        Int32 i = 0;
        while (dr.Read())
        {
            UnreadText += "<tr>";
            UnreadText += "<td>" + dr["UEid"] + "</td>";
            UnreadText += "<td>" + dr["UName"] + "</td>";
            UnreadText += "<td>" + dr["UEmail"] + "</td>";
            UnreadText += "<td>" + dr["UPass"] + "</td>";
            UnreadText += "<td>" + dr["UAccess"] + "</td>";
            UnreadText += "<td>" + "<button><i class='ion ion-android-delete'></i></button>" + "</td>";
            UnreadText += "</tr>";
            tlist.InnerHtml = UnreadText;
            i++;
        }
        con.Close();
    }
    private void BindDropDown()
    {
        SqlConnection conn = new SqlConnection(strcon);
        conn.Open();
        string query = "Select * from RoleMaster";
        SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        emprole.DataSource = dt;
        emprole.DataBind();
    }
    private void AddData()
    {
        string id, access;
        int cid;
        HttpCookie cookie = Request.Cookies["cinfo"];
        id = cookie["Cid"];
        cid = int.Parse(id);
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        SqlCommand qry = new SqlCommand("SELECT * FROM RoleMaster WHERE Rid = " + emprole.SelectedValue, con);
        qry.CommandType = CommandType.Text;
        using(SqlDataReader sdr = qry.ExecuteReader())
        {
            sdr.Read();
            access = sdr["Rid"].ToString();
        }
        SqlCommand cmd = new SqlCommand("insert into UserMaster(Cid,UEid,UName,UEmail,UPass,UAccess) values(@cid,@ueid,@uname,@uemail,@upasswd,@uaccess)", con);
        cmd.Parameters.AddWithValue("cid", cid);
        cmd.Parameters.AddWithValue("ueid", empid.Text);
        cmd.Parameters.AddWithValue("uname", empname.Text);
        cmd.Parameters.AddWithValue("uemail", empemail.Text);
        cmd.Parameters.AddWithValue("upasswd", emppass.Text);
        cmd.Parameters.AddWithValue("uaccess",access);
        cmd.ExecuteNonQuery();
        con.Close();
        ClearControls(this);
    }
    public void ClearControls(Control parent)
    {
        foreach(Control c in parent.Controls)
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
        emprole.ClearSelection();
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        string cmpemail;
        string eemail = empemail.Text;
        HttpCookie cookie = Request.Cookies["cinfo"];
        cmpemail = cookie["CEmail"];
        if (cmpemail != eemail)
        {
            AddData();
            BindData();
        }
    }
}