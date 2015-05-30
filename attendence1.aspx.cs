using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class attendence1 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Course : " + Session["courseid"] + "<br/>" + "Groupid : " + Session["groupid"];
        conn.Open();
        conn1.Open();

        // the two paramters are declared globally
        //GenerateTable(numOfColumns, numOfRows);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1;
        cmd1 = new SqlCommand("select count(*) from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
        int temp=(int)cmd1.ExecuteScalar();
        if(temp==0)
        {
            cmd1 = new SqlCommand("insert into fac_attendence values('" + Session["id"] + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + DateTime.Today.ToString("MM/dd/yyyy") + "')", conn);
            cmd1.ExecuteScalar();
            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
            Session["attid"] = (int)cmd1.ExecuteScalar();
            cmd1 = new SqlCommand("select * from student_course where courseid ='" + Session["courseid"] + "' and groupid ='" + Session["groupid"] +  "'", conn);
            SqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                SqlCommand cmd = new SqlCommand("insert into attendence values('" + reader["studentid"] + "','" + -1 + "','" + Session["attid"] + "')", conn1);
                cmd.ExecuteScalar();
            }
            reader.Close();
        }
        else
        {
            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
            Session["attid"]=(int)cmd1.ExecuteScalar();
        }
        

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //System.Web.UI.WebControls.GridViewCommandEventArgs e1 = null;
       // e = System.Web.UI.WebControls.GridViewCommandEventArgs;
        //Response.Write(e1.CommandName);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "p")
        {
             int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            
            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att='1' where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
        }
        else 
        {
            //Response.Write("a");
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];


            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att=0 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];


            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att=0 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GridView3.Rows[index];


        //Response.Write(row.Cells[0].Text);
        SqlCommand cmd = new SqlCommand("update attendence set att=1 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
        cmd.ExecuteScalar();
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}