  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class grading2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        conn1.Open();
        if (!IsPostBack)
        {
            //BindGridviewData();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         ///Session["id"] = "phoenix";
         //Session["groupid"] = "g1";
         //Session["courseid"] = "CS241";
        //String search = "SELECT COUNT(*) FROM exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        //SqlCommand cmd = new SqlCommand(search, conn);
        //int temp = (int)cmd.ExecuteScalar();
        BindGridviewData();
        
    }
    protected void BindGridviewData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Roll No", typeof(string));
        String search = "SELECT * from exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] examid = new String[10];
        String[] examname = new String[10];
        int numofexam = 0;
        int par = 0;
        while (reader.Read())
        {
            dt.Columns.Add(reader["exam_name"].ToString(), typeof(string));
            examname[numofexam] = reader["exam_name"].ToString();
            examid[numofexam] = reader["examid"].ToString();
            par = par + Convert.ToInt32(reader["max_marks"].ToString());
            numofexam++;
        }
        dt.Columns.Add("Tatal Marks", typeof(string));
        dt.Columns.Add("Pacentage", typeof(string));
        reader.Close();
        search = "SELECT * from student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        cmd = new SqlCommand(search, conn);
        reader = cmd.ExecuteReader();
        DataRow dtrow;
        while(reader.Read())
        {
            dtrow = dt.NewRow();
            dtrow["Roll No"] = reader["studentid"].ToString();
            int total_marks = 0;
            for (int i = 0; i < numofexam ; i++ )
            {
                String temp = "SELECT marks from marks where studentid='" + reader["studentid"].ToString() + "' and examid='" + examid[i] + "'";
                SqlCommand cmd1 = new SqlCommand(temp,conn1);
                dtrow[examname[i]] = cmd1.ExecuteScalar().ToString();
                total_marks = total_marks + (int)cmd1.ExecuteScalar();
            }
            dtrow["Tatal Marks"] = total_marks;
            double pas=total_marks*100 ;
            pas = pas / par;
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
                    //Bind Data to Columns
    

        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        TextBox1.Visible = true;
        Button3.Visible = true;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void BindGridviewData_single()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Roll No", typeof(string));
        String search = "SELECT * from exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] examid = new String[10];
        String[] examname = new String[10];
        int numofexam = 0;
        int par = 0;
        while (reader.Read())
        {
            dt.Columns.Add(reader["exam_name"].ToString(), typeof(string));
            examname[numofexam] = reader["exam_name"].ToString();
            examid[numofexam] = reader["examid"].ToString();
            par = par + Convert.ToInt32(reader["max_marks"].ToString());
            numofexam++;
        }
        dt.Columns.Add("Tatal Marks", typeof(string));
        dt.Columns.Add("Pacentage", typeof(string));
        reader.Close();
        search = "SELECT * from student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        cmd = new SqlCommand(search, conn);
        reader = cmd.ExecuteReader();
        DataRow dtrow;
        while (reader.Read())
        {
            dtrow = dt.NewRow();
            dtrow["Roll No"] = reader["studentid"].ToString();
            int total_marks = 0;
            for (int i = 0; i < numofexam; i++)
            {
                String temp = "SELECT marks from marks where studentid='" + reader["studentid"].ToString() + "' and examid='" + examid[i] + "'";
                SqlCommand cmd1 = new SqlCommand(temp, conn1);
                dtrow[examname[i]] = cmd1.ExecuteScalar().ToString();
                total_marks = total_marks + (int)cmd1.ExecuteScalar();
            }
            dtrow["Tatal Marks"] = total_marks;
            double pas = total_marks * 100;
            pas = pas / par;
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
        //Bind Data to Columns


        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
}