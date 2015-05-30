using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Leave_Mediator : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabMedId.Text = Session["Id"].ToString();
        LabMedUserName.Text = Session["username"].ToString();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            
            GridView1.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;
            Label11.Visible = true;
            Label12.Visible = true;
            Label13.Visible = true;
            Button2.Visible = true;
            Button3.Visible = true;
            Button5.Visible = true;
            Label2.Text = GridView1.SelectedRow.Cells[1].Text;
            Label8.Text = GridView1.SelectedRow.Cells[4].Text;
            Label9.Text = GridView1.SelectedRow.Cells[5].Text;
            Label11.Text = GridView1.SelectedRow.Cells[3].Text;
            Label13.Text = GridView1.SelectedRow.Cells[6].Text;
            String empUserid = "SELECT name from faculty where facid='" + GridView1.SelectedRow.Cells[1].Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            Label4.Text = com.ExecuteScalar().ToString();
            GridView2.DataBind();
            Label14.Visible = true;
            GridView2.Visible = true;
            GridView3.DataBind();
            Label15.Visible = true;
            GridView3.Visible = true;
            Label16.Visible = true;
            GridView4.DataBind();
            Label17.Visible = true;
            GridView4.Visible = true;
        }
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String empUserid = "UPDATE leave_details SET confirmflag = 2 where facid='" + Label2.Text + "' AND startdate='" + Label8.Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            com.ExecuteScalar();
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Accepted Successfully </h2></font>");
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            Label14.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label15.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label16.Visible = false;
            Label17.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            int totalday_previous1;
            int totalday_previous2;
            String leave_type = Label11.Text;
            String date1_previous = DateTime.Parse(Label8.Text).ToString("MM/dd/yyyy");
            int total_remain1 = 0;
            int total_remain2 = 0;
            String date2_previous = DateTime.Parse(Label9.Text).ToString("MM/dd/yyyy");
            String date = DateTime.Today.ToString("MM/dd/yyyy");
            if (DateTime.Parse(date1_previous).ToString("yyyy").Equals(DateTime.Parse(date2_previous).ToString("yyyy")))
            {
                TimeSpan span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse(date1_previous));
                totalday_previous1 = (int)(span.TotalDays + 1);
                totalday_previous2 = 0;
                String putleave = "SELECT remain from leave_remain where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
                SqlCommand cmd10 = new SqlCommand(putleave, conn);
                int temp = (int)cmd10.ExecuteScalar();
                total_remain1 = temp;
                temp = temp + totalday_previous1;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();


            }
            else
            {
                TimeSpan span = DateTime.Parse("12/31/" + DateTime.Parse(date1_previous).ToString("yyyy")).Subtract(DateTime.Parse(date1_previous));
                totalday_previous1 = (int)(span.TotalDays + 1);
                String putleave = "SELECT remain from leave_remain where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ";
                SqlCommand cmd10 = new SqlCommand(putleave, conn);
                int temp = (int)cmd10.ExecuteScalar();
                total_remain1 = temp;
                temp = temp + totalday_previous1;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date1_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();


                span = DateTime.Parse(date2_previous).Subtract(DateTime.Parse("01/01/" + DateTime.Parse(date2_previous).ToString("yyyy")));
                totalday_previous2 = (int)(span.TotalDays + 1);
                putleave = "SELECT remain from leave_remain where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ";
                cmd10 = new SqlCommand(putleave, conn);
                temp = (int)cmd10.ExecuteScalar();
                total_remain2 = temp;
                temp = temp + totalday_previous2;
                cmd10 = new SqlCommand("update leave_remain SET remain='" + temp + "' where facid='" + Label2.Text + "' AND type='" + leave_type + "' AND year='" + DateTime.Parse(date2_previous).ToString("yyyy") + "' ", conn);
                cmd10.ExecuteScalar();
            }



            String empUserid = "UPDATE leave_details SET confirmflag = -2 where facid='" + Label2.Text + "' AND startdate='" + Label8.Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            com.ExecuteScalar();
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Rejected Successfully </h2></font>");
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            Label14.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label15.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label16.Visible = false;
            Label17.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
        }
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
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
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button5.Visible = false;
            GridView1.DataBind();
            GridView1.Visible = true;
            Label14.Visible = false;
            GridView2.Visible = false;
            GridView2.DataBind();
            Label15.Visible = false;
            GridView3.Visible = false;
            GridView3.DataBind();
            Label16.Visible = false;
            Label17.Visible = false;
            GridView4.Visible = false;
            GridView4.DataBind();
        }
        conn.Close();
    }
}