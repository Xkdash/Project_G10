using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private int numOfRows = 0;
    private int numOfColumns = 0;
    private void GenerateTable(int colsCount, int rowsCount)
    {

        //Creat the Table and Add it to the Page
        Table table = new Table();
        table.ID = "Table1";
        Panel2.Controls.Add(table);

        // Now iterate through the table and add your controls 
        for (int i = 0; i < rowsCount; i++)
        {
            TableRow row = new TableRow();
           
            for (int j = 0; j < colsCount; j++)
            {
                TableCell cell = new TableCell();
                TextBox tb = new TextBox();

                // Set a unique ID for each TextBox added
                tb.ID = "TextBoxRow_" + i + "Col_" + j;
                // Add the control to the TableCell
                Label l = new Label();
                l.ID = "lebel_" + i + "Col_" + j;
                l.Text = "aa";
                cell.Controls.Add(l);
                cell.Controls.Add(tb);
               // cell.Controls.Add("<hr>");
                // Add the TableCell to the TableRow
                row.Cells.Add(cell);
               // cell.Controls.Add(new Literal() { ID = "row", Text = "<hr/>" });
                
            }

            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // the two paramters are declared globally
        GenerateTable(numOfColumns, numOfRows);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Check if the inputs are numbers
        if (int.TryParse(TextBox1.Text.Trim(), out numOfColumns) && int.TryParse(TextBox2.Text.Trim(), out numOfRows))
        {
            //Generate the Table based from the inputs
            GenerateTable(numOfColumns, numOfRows);

            //Store the current Rows and Columns In ViewState as a reference value when it post backs
            ViewState["cols"] = numOfColumns;
            ViewState["rows"] = numOfRows;
        }
        else
        {
            Response.Write("Values are not numeric!");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Check if ViewState values are null
        if (ViewState["cols"] != null && ViewState["rows"] != null)
        {
            //Find the Table in the page
            Table table = (Table)Page.FindControl("Table1");
            if (table != null)
            {
                //Re create the Table with the current rows and columns
                GenerateTable(int.Parse(ViewState["cols"].ToString()), int.Parse(ViewState["rows"].ToString()));

                // Now we can loop through the rows and columns of the Table and get the values from the TextBoxes
                for (int i = 0; i < int.Parse(ViewState["rows"].ToString()); i++)
                {
                    for (int j = 0; j < int.Parse(ViewState["cols"].ToString()); j++)
                    {
                        //Print the values entered
                        if (Request.Form["TextBoxRow_" + i + "Col_" + j] != string.Empty)
                        {
                            Response.Write(Request.Form["TextBoxRow_" + i + "Col_" + j] + "<BR/>");
                        }
                    }
                }
            }
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        //Check if ViewState values are null
        if (ViewState["cols"] != null && ViewState["rows"] != null)
        {
            //Find the Table in the page
            Table table = (Table)Page.FindControl("Table1");
            if (table != null)
            {
                //Re create the Table with the current rows and columns
                GenerateTable(int.Parse(ViewState["cols"].ToString()), int.Parse(ViewState["rows"].ToString()));

                // Now we can loop through the rows and columns of the Table and get the values from the TextBoxes
                for (int i = 0; i < int.Parse(ViewState["rows"].ToString()); i++)
                {
                    for (int j = 0; j < int.Parse(ViewState["cols"].ToString()); j++)
                    {
                        //Print the values entered
                        if (Request.Form["TextBoxRow_" + i + "Col_" + j] != string.Empty)
                        {
                            Response.Write(Request.Form["TextBoxRow_" + i + "Col_" + j] + "<BR/>");
                        }
                    }
                }
            }
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //Check if the inputs are numbers
        if (int.TryParse(TextBox1.Text.Trim(), out numOfColumns) && int.TryParse(TextBox2.Text.Trim(), out numOfRows))
        {
            //Generate the Table based from the inputs
            GenerateTable(numOfColumns, numOfRows);

            //Store the current Rows and Columns In ViewState as a reference value when it post backs
            ViewState["cols"] = numOfColumns;
            ViewState["rows"] = numOfRows;
        }
        else
        {
            Response.Write("Values are not numeric!");
        }
    }
}