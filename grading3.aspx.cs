using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class grading3 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    String[] coloum_name = new String[10];
    String[,] excel;
    int n;
    
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string path = string.Concat(Server.MapPath("~/Uploaded Folder/" + FileUpload1.FileName));
                FileUpload1.SaveAs(path);
                String path1 = string.Concat(Server.MapPath("~/Uploaded Folder1/" + FileUpload1.FileName));
                FileUpload1.SaveAs(path1);
                filename = FileUpload1.FileName;
                // Connection String to Excel Workbook
                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);
                connection.Open();
                // Create DbDataReader to Data Worksheet
                DbDataReader dr1 = command.ExecuteReader();
                int numofrow = dr1.Cast<object>().Count();
                dr1.Close();
                DbDataReader dr = command.ExecuteReader();

               // String[] exam_name = new String[10];
                //int numofcoloum = 0;
                coloum_name[0] = dr.GetName(0).ToString();
                ViewState["0"] = coloum_name[0];
                excel = new String[numofrow, dr.FieldCount];
                
                    for (int col = 1; col < dr.FieldCount; col++)
                    {

                        coloum_name[col] = dr.GetName(col).ToString();
                        ViewState[col+""] = coloum_name[col];
                        DropDownList1.Items.Add(new ListItem(coloum_name[col], col + ""));
                        //add(new ListItem(coloum_name[col], coloum_name[col]));

                        // Gets the column name
                        // Console.Write(dr.GetFieldType(col).ToString());    // Gets the column type
                        //Console.Write(dr.GetDataTypeName(col).ToString()); // Gets the column database type
                    }
                 n=0;
                while(dr.Read())
                {
                    for(int col=0;col<dr.FieldCount;col++)
                    {
                        excel[n, col] = dr[coloum_name[col]].ToString();
                    }
                    n++;
                }
                ViewState["n"] = n;
                ViewState["m"] = dr.FieldCount;
                for (int i = 0; i < n;i++ )
                {
                    for(int j=0;j<dr.FieldCount;j++)
                    {
                        ViewState[i+","+j] = excel[i, j];
                       
                        Response.Write(excel[i, j]);
                        Response.Write(i + "," + j + "<br/>");
                    }
                }
                //ViewState["array"] = excel;
                    // SQL Server Connection String
                    //string sqlConnectionString = @"Data Source=data";

                    // Bulk Copy to SQL Server 
                    //SqlBulkCopy bulkInsert = new SqlBulkCopy(conn);
                    //bulkInsert.DestinationTableName = "Student_Record";
                    //bulkInsert.WriteToServer(dr);
                    //Label1.Text = "Ho Gaya";
                    dr.Close();
                connection.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            //conn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
                SqlCommand cmd = new SqlCommand("insert into exam values('" + Session["id"] + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + DropDownList1.SelectedItem.ToString() + "')", conn);
                cmd.ExecuteScalar();
                cmd = new SqlCommand("SELECT examid FROM exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "' and exam_name='" + DropDownList1.SelectedItem.ToString() + "' and max_marks='" + TextBox1.Text + "'", conn);
                int examid = (int)cmd.ExecuteScalar();
                for (int i = 0; i < int.Parse(ViewState["n"].ToString()); i++)
                {
                    SqlCommand cmd1 = new SqlCommand("insert into marks values('" + ViewState[i + "," + 0].ToString() + "','" + examid + "','" + ViewState[i+","+int.Parse(DropDownList1.SelectedValue.ToString())].ToString() + "')", conn);
                    cmd1.ExecuteScalar();
                }
                

                // SQL Server Connection String
                //string sqlConnectionString = @"Data Source=data";

                // Bulk Copy to SQL Server 
                //SqlBulkCopy bulkInsert = new SqlBulkCopy(conn);
                //bulkInsert.DestinationTableName = "Student_Record";
                //bulkInsert.WriteToServer(dr);
                Label1.Text = "Ho Gaya";
                
        
    }

}