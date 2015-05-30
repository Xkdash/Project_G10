using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class Default3 : System.Web.UI.Page
{
    private int numOfRows = 0;
    private int numOfColumns = 0;
    private void GenerateTable(int colsCount, int rowsCount)
    {
        String search = "SELECT * FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        //Creat the Table and Add it to the Page
        Table table = new Table();
        table.ID = "Table1";
        Page.Form.Controls.Add(table);

        // Now iterate through the table and add your controls 
        for (int i = 0; i < rowsCount; i++)
        {
            reader.Read();
            TableRow row = new TableRow();
            for (int j = 0; j < colsCount; j++)
            {
                TableCell cell = new TableCell();
                TextBox tb = new TextBox();

                // Set a unique ID for each TextBox added
                tb.ID = "TextBoxRow_" + i + "Col_" + j;
                Label l = new Label();
                l.ID = "lebel_" + i + "Col_" + j;
                String temp = reader["studentid"].ToString();
                temp = temp + "  ";
                l.Text = temp;
                cell.Controls.Add(l);
                // Add the control to the TableCell
                cell.Controls.Add(tb);
                // Add the TableCell to the TableRow
                row.Cells.Add(cell);
            }

            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
        reader.Close();
    }
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        // the two paramters are declared globally
        GenerateTable(numOfColumns, numOfRows);
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into exam values('" + Session["id"] + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + TextBox3.Text + "')", conn);
        cmd.ExecuteScalar();
        cmd = new SqlCommand("SELECT examid FROM exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "' and exam_name='" + TextBox3.Text + "' and max_marks='" + TextBox1.Text + "'", conn);
        int examid = (int)cmd.ExecuteScalar();
        String search = "SELECT * FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        cmd = new SqlCommand(search, conn);
        SqlDataReader reader1 = cmd.ExecuteReader();
        String[] student = new String[100];
        int n = 0;
        while (reader1.Read())
        {
            //string[] fields = new string[1];
            student[n] = reader1["studentid"].ToString();
            //fields[1] = reader["EmpName"].ToString();
            n++;
        }
        reader1.Close();
        // Now you have a list of arrays that you can iterate over
        Response.Write("succesfull entry");
        if (ViewState["cols"] != null && ViewState["rows"] != null)
        {
            //Find the Table in the page
            // Response.Write("succesfull entry");
            Table table = (Table)Page.FindControl("Table1");
            if (table != null)
            {
                //   Response.Write("succesfull entry");
                //Re create the Table with the current rows and columns
                GenerateTable(int.Parse(ViewState["cols"].ToString()), int.Parse(ViewState["rows"].ToString()));

                // Now we can loop through the rows and columns of the Table and get the values from the TextBoxes
                for (int i = 0; i < int.Parse(ViewState["rows"].ToString()); i++)
                {
                    //     Response.Write("succesfull entry");
                    // reader1.Read();
                    for (int j = 0; j < int.Parse(ViewState["cols"].ToString()); j++)
                    {
                        //Print the values entered
                        if (Request.Form["TextBoxRow_" + i + "Col_" + j] != string.Empty)
                        {
                            SqlCommand cmd1 = new SqlCommand("insert into marks values('" + student[i] + "','" + examid + "','" + Request.Form["TextBoxRow_" + i + "Col_" + j] + "')", conn);
                            cmd1.ExecuteScalar();
                            Response.Write(Request.Form["TextBoxRow_" + i + "Col_" + j] + "<BR/>");
                        }
                    }
                }
            }
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["id"] = "phoenix";
        Session["groupid"] = "g1";
        Session["courseid"] = "CS241";
        String search = "SELECT COUNT(*) FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        int temp = (int)cmd.ExecuteScalar();
        numOfRows = temp;
        numOfColumns = 1;
        ViewState["cols"] = numOfColumns;
        ViewState["rows"] = numOfRows;
        GenerateTable(numOfColumns, numOfRows);
    }
}