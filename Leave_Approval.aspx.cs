using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Leave_Approval : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        Label1.Text = Session["Id"].ToString();
        Label2.Text = Session["username"].ToString();
    }
   
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            
            GridView1.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;
            Label11.Visible = true;
            Label12.Visible = true;
            Label13.Visible = true;
            Label14.Visible = true;
            Label15.Visible = true;
            Label16.Visible = true;
            Label17.Visible = true;
            Label18.Visible = true;
            Button3.Visible = true;
            Button4.Visible = true;
            Button5.Visible = true;
            Label8.Text = GridView1.SelectedRow.Cells[1].Text;
            Label11.Text = GridView1.SelectedRow.Cells[4].Text;
            Label14.Text = GridView1.SelectedRow.Cells[5].Text;
            Label16.Text = GridView1.SelectedRow.Cells[3].Text;
            Label18.Text = GridView1.SelectedRow.Cells[6].Text;
            String empUserid = "SELECT name from faculty where facid='" + GridView1.SelectedRow.Cells[1].Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            Label10.Text = com.ExecuteScalar().ToString();
            GridView2.DataBind();
            Label19.Visible = true;
            GridView2.Visible = true;
            GridView3.DataBind();
            Label20.Visible = true;
            GridView3.Visible = true;
            GridView4.DataBind();
            Label21.Visible = true;
            GridView4.Visible = true;
            Label22.Visible = true;
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String empUserid = "UPDATE leave_details SET confirmflag = 3 where facid='" + Label8.Text + "' AND startdate='" + Label11.Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            com.ExecuteScalar();
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Accepted Successfully </h2></font>");
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;
            Label15.Visible = false;
            Label16.Visible = false;
            Label17.Visible = false;
            Label18.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            Label19.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label20.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label21.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
            Label22.Visible = false;
        }
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            int totalday_previous1;
            int totalday_previous2;
            String leave_type = Label16.Text;
            String date1_previous = DateTime.Parse(Label11.Text).ToString("MM/dd/yyyy");
            int total_remain1 = 0;
            int total_remain2 = 0;
            String date2_previous = DateTime.Parse(Label14.Text).ToString("MM/dd/yyyy");
            String date = DateTime.Today.ToString("MM/dd/yyyy");
            if (DateTime.Parse(date1_previous).ToString("yyyy").Equals(DateTime.Parse(date2_previous).ToString("yyyy")))
            {
                TimeSpan span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse(date1_previous));
                totalday_previous1 = (int)(span.TotalDays + 1);
                totalday_previous2 = 0;
                String putleave = "SELECT remain from leave_remain where facid='" + Label8.Text + "' AND type='" + Label16.Text + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
                SqlCommand cmd10 = new SqlCommand(putleave, conn);
                int temp = (int)cmd10.ExecuteScalar();
                total_remain1 = temp;
                temp = temp + totalday_previous1;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label8.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();


            }
            else
            {
                TimeSpan span = DateTime.Parse("12/31/" + DateTime.Parse(date1_previous).ToString("yyyy")).Subtract(DateTime.Parse(date1_previous));
                totalday_previous1 = (int)(span.TotalDays + 1);
                String putleave = "SELECT remain from leave_remain where facid='" + Label8.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
                SqlCommand cmd10 = new SqlCommand(putleave, conn);
                int temp = (int)cmd10.ExecuteScalar();
                total_remain1 = temp;
                temp = temp + totalday_previous1;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label8.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();


                span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse("01/01/" + DateTime.Parse(date2_previous).ToString("yyyy")));
                totalday_previous2 = (int)(span.TotalDays + 1);
                putleave = "SELECT remain from leave_remain where facid='" + Label8.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ";
                cmd10 = new SqlCommand(putleave, conn);
                temp = (int)cmd10.ExecuteScalar();
                total_remain2 = temp;
                temp = temp + totalday_previous2;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label8.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();
            }
            


            String empUserid = "UPDATE leave_details SET confirmflag = -3 where facid='" + Label8.Text + "' AND startdate='" + Label11.Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            com.ExecuteScalar();
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Rejected Successfully </h2></font>");
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;
            Label15.Visible = false;
            Label16.Visible = false;
            Label17.Visible = false;
            Label18.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            Label19.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label20.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label21.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
            Label22.Visible = false;

        }
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Response.Redirect("Home.aspx");
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;
            Label15.Visible = false;
            Label16.Visible = false;
            Label17.Visible = false;
            Label18.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            GridView1.Visible = true;
            Label19.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label20.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label21.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
            Label22.Visible = false;
           
        }
        conn.Close();
    }
}