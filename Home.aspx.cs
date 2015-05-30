using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class Home : System.Web.UI.Page
{
    SqlConnection conn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn3.Open();
        LabNoti.Text = "";
        LabNews.Text = "";
        int a = 1;
        SqlCommand com2 = new SqlCommand("SELECT count(*) from notifications WHERE flag= '" + a + "'", conn3);
        int temp2 = (int)com2.ExecuteScalar();
        SqlCommand com = new SqlCommand("SELECT * from notifications WHERE flag= '" + a + "'", conn3);
        SqlDataReader reader = com.ExecuteReader();
        int n = 0;
        string[] fields = new string[temp2];
        while (reader.Read())
        {
            fields[n] = reader["notice"].ToString();
            LabNoti.Text = LabNoti.Text + fields[n] + "    |    ";
            n++;
        }
        reader.Close();
        a = 2;
        com2 = new SqlCommand("SELECT count(*) from notifications WHERE flag= '" + a + "'", conn3);
        temp2 = (int)com2.ExecuteScalar();
        com = new SqlCommand("SELECT * from notifications WHERE flag= '" + a + "'", conn3);
        reader = com.ExecuteReader();
        n = 0;
        string[] fields_2 = new string[temp2];
        while (reader.Read())
        {
            fields_2[n] = reader["notice"].ToString();
            LabNews.Text = LabNews.Text + "</br></br>" + fields_2[n];
            n++;
        }
        reader.Close(); 
    }
    public String ComputeHash(String input, HashAlgorithm algrithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedbytes = algrithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedbytes);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Marks.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Employee.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
                String inj = TextBox1.Text;
                int tdr = 0;
                for (int i = 0; i < inj.Length; i++)
                {
                    if (inj.Substring(i, 1).Equals("'") || inj.Substring(i, 1).Equals("=") || inj.Substring(i, 1).Equals("+") || inj.Substring(i, 1).Equals("\"") || inj.Substring(i, 1).Equals("-") || inj.Substring(i, 1).Equals("(") || inj.Substring(i, 1).Equals(")"))
                        tdr++;
                }
                inj = TextBox2.Text;
                for (int i = 0; i < inj.Length; i++)
                {
                    if (inj.Substring(i, 1).Equals("'") || inj.Substring(i, 1).Equals("=") || inj.Substring(i, 1).Equals("+") || inj.Substring(i, 1).Equals("\"") || inj.Substring(i, 1).Equals("-") || inj.Substring(i, 1).Equals("(") || inj.Substring(i, 1).Equals(")"))
                        tdr++;
                }
                if (tdr != 0)
                    Response.Write("<font color = " + '"' + "red" + '"' + "><h2>Site is SQL Injection Proof !!!</h2></font>");
                else
                {
                    String checkEmpUserName = TextBox1.Text;
                    String empUserName = "SELECT count(*) from loginDB where username='" + TextBox1.Text + "'";
                    SqlCommand com1 = new SqlCommand(empUserName, conn3);
                    int temp1 = (int)com1.ExecuteScalar();
                    if (temp1 == 1)
                    {
                        String password = ComputeHash(TextBox2.Text, new SHA256CryptoServiceProvider());
                        String pass1 = "SELECT count(*) from loginDB where username='" + TextBox1.Text + "' and Password='" + password + "'";
                        SqlCommand com2 = new SqlCommand(pass1, conn3);
                        int temp2 = (int)com2.ExecuteScalar();
                        if (temp2 == 1)
                        {
                            String pass2 = "SELECT usertype from loginDB where username='" + TextBox1.Text + "' and Password='" + password + "'";
                            SqlCommand com3 = new SqlCommand(pass2, conn3);
                            int temp3 = (int)com3.ExecuteScalar();
                            String get_id = "SELECT Id from loginDB where username='" + TextBox1.Text + "' and Password='" + password + "'";
                            com2 = new SqlCommand(get_id, conn3);
                            Session["id"] = com2.ExecuteScalar().ToString();
                            String get_username = "SELECT username from loginDB where username='" + TextBox1.Text + "' and Password='" + password + "'";
                            com2 = new SqlCommand(get_username, conn3);
                            Session["username"] = com2.ExecuteScalar().ToString();
                            String date = DateTime.Today.ToString("yyyy");
                            Session["date"] = date;
                            Session["today"] = DateTime.Today;
                            LabEmpUserName.Text = "";
                            LabEmpPwd.Text = "";
                            if (temp3 == 0)                                                  //  For Admin
                            {
                                Response.Redirect("Admin_Home.aspx");
                            }
                            else if (temp3 == 1)                                             //  For Employees
                            {
                                Response.Redirect("leave.aspx");
                            }
                            else if (temp3 == 2)                                             //  For Students
                            {
                                
                            }
                            else if (temp3 == 3)                                             //  For Leave Mediator
                            {
                                Response.Redirect("Leave_Mediator.aspx");
                            }
                            else if (temp3 == 4)                                             //  For Leave Issuer
                            {
                                Response.Redirect("Leave_Approval.aspx");
                            }
                        }
                        else
                        {
                            String clr = "red";
                            LabEmpUserName.Text = "";
                            LabEmpPwd.Text = "! Invalid Password";
                        }
                    }
                    else
                    {
                        LabEmpUserName.Text = "! Invalid Employee Username";
                    }
                }
        }
        conn3.Close();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
    }
}