using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        date1.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }


    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        date2.Text = Calendar2.SelectedDate.ToShortDateString();
        Calendar2.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int error = 0;
        if(IsPostBack)
        {
            String date = DateTime.Today.ToString("MM/dd/yyyy");
            if (DateTime.Parse(date1.Text) < DateTime.Parse(date))
                {
                    Label1.Text=" Start Date cannot precede Current Date";
                    error = 1;
                }
            else
                {
                    error = 0;
                    Label1.Text = "";
                }
            if (DateTime.Parse(date2.Text) < DateTime.Parse(date))
                {
                    if (DateTime.Parse(date2.Text) < DateTime.Parse(date1.Text))
                        Label2.Text=" End Date cannot precede Current Date and End Date cannot precede Start Date.";
                    else
                        Label2.Text = " End Date cannot precede Current Date.";
                    error = 1;
                }
            else if (DateTime.Parse(date2.Text) < DateTime.Parse(date1.Text))
                {
                    Label2.Text = " End Date cannot precede Start Date.";
                    error = 1;
                }
            else
                {
                    Label2.Text = "";
                    error = 0;
                }
            
            String checkuser = "SELECT * from leave_details where facid='" + Session["id"] + "' and confirmflag>0 ";
            SqlCommand com = new SqlCommand(checkuser, conn);
            SqlDataReader reader = com.ExecuteReader();
            //List<string[]> employees = new List<string[]>();
            while (reader.Read())
            {
                string[] fields = new string[2];
                fields[0] = reader["startdate"].ToString();
                fields[1] = reader["enddate"].ToString();
                if((DateTime.Parse(fields[0])<= DateTime.Parse(date1.Text))&& (DateTime.Parse(fields[1])>=DateTime.Parse(date1.Text)))
                    {
                        error = 1;
                        Label1.Text = " Start date is clashing with a previously taken leave.";
                    }
                if((DateTime.Parse(fields[0])<= DateTime.Parse(date2.Text))&& (DateTime.Parse(fields[1])>=DateTime.Parse(date2.Text)))
                    {
                        error = 1;
                        Label2.Text = " End date is clashing with a previously taken leave.";
                    }             
            }
            // Now you have a list of arrays that you can iterate over
            reader.Close();
            if(error==0)
            {
                String current_year = DateTime.Today.ToString("yyyy");
                String date2_year = DateTime.Parse(date2.Text).ToString("yyyy");
                if (date2_year.Equals(current_year))
                {
                    String leave = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + current_year + "' ";
                    SqlCommand cmd2 = new SqlCommand(leave, conn);
                    int temp = (int)cmd2.ExecuteScalar();
                    if (temp != 0)
                    {
                        TimeSpan span = DateTime.Parse(date2.Text).Subtract(DateTime.Parse(date1.Text));
                        int total_days = (int)(span.TotalDays + 1);
                        if (temp >= total_days)
                        {
                            int temp1 = temp - total_days;
                            SqlCommand cmd3 = new SqlCommand("update leave_remain SET remain='" + temp1 + "' where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + current_year + "' ", conn);
                            cmd3.ExecuteScalar();
                        }
                        else
                        {
                            error = 1;
                        }

                    }
                    else
                    {
                        error = 1;

                    }
                }
                else
                {
                    String thisyear = "12/31/" + current_year;
                    String nextyear = "01/01/" + date2_year;
                    String leave = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + current_year + "' ";
                    SqlCommand cmd2 = new SqlCommand(leave, conn);
                    int temp = (int)cmd2.ExecuteScalar();
                    if (temp != 0)
                    {
                        TimeSpan span = DateTime.Parse(thisyear).Subtract(DateTime.Parse(date1.Text));
                        int total_days = (int)(span.TotalDays + 1);
                        if (temp >= total_days)
                        {
                            int temp1 = temp - total_days;
                            SqlCommand cmd3 = new SqlCommand("update leave_remain SET remain='" + temp1 + "' where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + current_year + "' ", conn);
                            cmd3.ExecuteScalar();
                        }
                        else
                        {
                            error = 1;
                        }

                    }
                    else
                    {
                        error = 1;

                    }
                    String leave1 = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + date2_year + "' ";
                    SqlCommand cmd4 = new SqlCommand(leave1, conn);
                    int temp2 = (int)cmd4.ExecuteScalar();
                    if (temp2 != 0)
                    {
                        TimeSpan span = DateTime.Parse(date2.Text).Subtract(DateTime.Parse(nextyear));
                        int total_days = (int)(span.TotalDays + 1);
                        if (temp2 >= total_days)
                        {
                            int temp1 = temp2 - total_days;
                            SqlCommand cmd3 = new SqlCommand("update leave_remain SET remain='" + temp1 + "' where facid='" + Session["id"] + "' AND type='" + DropDownList1.SelectedValue + "' AND year='" + date2_year + "' ", conn);
                            cmd3.ExecuteScalar();
                        }
                        else
                        {
                            error = 1;
                        }

                    }
                    else
                    {
                        error = 1;

                    }
                }
            }
            

            

            if (error==0)
            {

                SqlCommand cmd1 = new SqlCommand("insert into leave_details values('" + Session["id"] + "','" + date1.Text + "','" + date2.Text + "','" + DropDownList1.SelectedValue + "','" + 1 + "','" + TextBox1.Text + "')", conn);
                cmd1.ExecuteScalar();
                Response.Write("succesfull entry");
            }
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Write(DropDownList1.SelectedValue);
    }
    protected void Button4_Click1(object sender, EventArgs e)
    {
        if (Button4.Text.Equals("Show"))
        {
            Button4.Text = "Hide";
            GridView2.Visible = true;
        }
        else
        {
            Button4.Text = "Show";
            GridView2.Visible = false;
        }
        
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (Button5.Text.Equals("Show"))
        {
            Button5.Text = "Hide";
            GridView1.Visible = true;
        }
        else
        {
            Button5.Text = "Show";
            GridView1.Visible = false;
        }
        
        
    }
    
    
    
    protected void Button8_Click(object sender, EventArgs e)
    {
        GridView4.Visible = true;
    }
    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        int totalday_previous1;
        int totalday_previous2;
        String leave_type = GridView4.SelectedRow.Cells[3].Text;
        String date1_previous = DateTime.Parse(GridView4.SelectedRow.Cells[1].Text).ToString("MM/dd/yyyy");
        int total_remain1 = 0;
        int total_remain2 = 0;
        String date2_previous = DateTime.Parse(GridView4.SelectedRow.Cells[2].Text).ToString("MM/dd/yyyy");
        String date = DateTime.Today.ToString("MM/dd/yyyy");

        if (DateTime.Parse(date1_previous).ToString("yyyy").Equals(DateTime.Parse(date2_previous).ToString("yyyy")))
        {
            TimeSpan span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse(date1_previous));
            totalday_previous1 = (int)(span.TotalDays + 1);
            totalday_previous2 = 0;
            String putleave = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
            SqlCommand cmd10 = new SqlCommand(putleave, conn);
            int temp = (int)cmd10.ExecuteScalar();
            total_remain1 = temp;
            temp = temp + totalday_previous1;
            cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
            cmd10.ExecuteScalar();


        }
        else
        {
            TimeSpan span = DateTime.Parse("12/31/" + DateTime.Parse(date1_previous).ToString("yyyy")).Subtract(DateTime.Parse(date1_previous));
            totalday_previous1 = (int)(span.TotalDays + 1);
            String putleave = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
            SqlCommand cmd10 = new SqlCommand(putleave, conn);
            int temp = (int)cmd10.ExecuteScalar();
            total_remain1 = temp;
            temp = temp + totalday_previous1;
            cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
            cmd10.ExecuteScalar();


            span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse("01/01/" + DateTime.Parse(date2_previous).ToString("yyyy")));
            totalday_previous2 = (int)(span.TotalDays + 1);
            putleave = "SELECT remain from leave_remain where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ";
            cmd10 = new SqlCommand(putleave, conn);
            temp = (int)cmd10.ExecuteScalar();
            total_remain2 = temp;
            temp = temp + totalday_previous2;
            cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Session["id"] + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ", conn);
            cmd10.ExecuteScalar();
        }
        String delete = "DELETE from leave_details where facid='" + Session["id"] + "' AND startdate='" + date1_previous + "' ";
        SqlCommand cmd = new SqlCommand(delete, conn);
        cmd.ExecuteScalar();
            
         //GridView3.SelectedRow.Cells[3].Text;
        // GridView3.SelectedRow.Cells[1].Text;
        //date2.Text = GridView3.SelectedRow.Cells[2].Text;

    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        GridView5.Visible = true;

    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        GridView6.Visible = true;
    }
}