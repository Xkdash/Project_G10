using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkuser = "SELECT count(*) from loginDB where username='" + Textusername.Text + "' ";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = (int)com.ExecuteScalar();
            if (temp == 1)
            {
                //String pass = Textpassword.Text;
                String pass1 = "SELECT count(*) from loginDB where username='" + Textusername.Text + "' and password='" + Textpassword.Text + "'";
                SqlCommand com1= new SqlCommand(pass1, conn);
               // String temp1=com1.
                //Response.Write("password=" + com1);
                int temp1 = (int)com1.ExecuteScalar();
                if(temp1==1)
                {
                    String getid = "SELECT * from loginDB where username='" + Textusername.Text + "' and password='" + Textpassword.Text + "'";
                    SqlCommand com2 = new SqlCommand(getid, conn);
                    SqlDataReader data = com2.ExecuteReader();
                    while (data.Read())
                    {
                        string[] fields = new string[1];
                        fields[0] = data["id"].ToString();
                        Session["id"] = fields[0];
                        //Response.Write(fields[0]);
                        //fields[1] = reader["EmpName"].ToString();
                        
                    }

                    Session["user"] = Textusername.Text;
                    String date = DateTime.Today.ToString("yyyy");
                    Session["date"] = date;
                  //  Session["id"] = "f1011";
                    Response.Redirect("leave.aspx");
                    
                   // Response.Write("Welcomne " + Textusername.Text);
                }
                else
                {
                    {
                        Response.Write("<script type='text/javascript'>");
                        Response.Write("window.alert('Invalid Password');");
                        Response.Write("</script>");
                    }
                }
            }
            else
            {
                {
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("window.alert('Invalid User Name');");
                    Response.Write("</script>");
                }
            }
        }
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String check = Textusername.Text;
            if (check.Length == 0)
            {
                Response.Write("<script type='text/javascript'>");
                Response.Write("window.alert('Please enter a valid User name');");
                Response.Write("</script>");
            }
            else
            {
                String checkuser = "SELECT count(*) from LoginDB where username ='" + Textusername.Text + "' ";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = (int)com.ExecuteScalar();
                if (temp == 1)
                {
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("window.alert('User name already exist..Try another one');");
                    Response.Write("</script>");

                }
                else
                {
                    String pass = Textpassword.Text;
                    if (pass.Length == 5 || pass.Length == 0)
                    {
                        SqlCommand cmd = new SqlCommand("insert into LoginDB values('" + Textusername.Text + "','" + Textpassword.Text + "','" +1 + "')", conn);
                        cmd.ExecuteNonQuery();
                        Session["User"] = Textusername.Text;
                        conn.Close();
                        Response.Redirect("login1.aspx");
                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>");
                        Response.Write("window.alert('Please Enter a valid Password....(password must be empty or 5 charectar..)');");
                        Response.Write("</script>");
                    }
                    conn.Close();
                }
            }
            conn.Close();
        }
    }
}