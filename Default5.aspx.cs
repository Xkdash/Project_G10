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

public partial class Default5 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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

                // Connection String to Excel Workbook
                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);
                connection.Open();
                // Create DbDataReader to Data Worksheet
                DbDataReader dr = command.ExecuteReader();

                // SQL Server Connection String
                //string sqlConnectionString = @"Data Source=data";

                // Bulk Copy to SQL Server 
                SqlBulkCopy bulkInsert = new SqlBulkCopy(conn);
                bulkInsert.DestinationTableName = "Student_Record";
                bulkInsert.WriteToServer(dr);
                Label1.Text = "Ho Gaya";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}