using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class test : System.Web.UI.Page
{
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 1)
        {
            CreateDynamicTable();
        }
    }
private void CreateDynamicTable()
    {
        
        // Fetch the number of Rows and Columns for the table 
        // using the properties
        int tblRows = 5;
        int tblCols = 1;
        // Now iterate through the table and add your controls 
        for (int i = 0; i < tblRows; i++)
        {
            TableRow tr = new TableRow();
            for (int j = 0; j < tblCols; j++)
            {
                TableCell tc = new TableCell();
                TextBox txtBox = new TextBox();
                txtBox.ID = "txt-" + i.ToString() + "-" + j.ToString();  
               // txtBox.Text = "RowNo:" + i + " " + "ColumnNo:" + " " + j;
                // Add the control to the TableCell
                tc.Controls.Add(txtBox);
                // Add the TableCell to the TableRow
                tr.Cells.Add(tc);
                
            }
            // Add the TableRow to the Table
            tbl.Rows.Add(tr);
            tbl.EnableViewState = true;
            ViewState["tbl"] = true;
        }      
    }

    protected void btnSet_Click(object sender, EventArgs e)
    {
        foreach (TableRow tr in tbl.Controls )
        {
            foreach (TableCell tc in tr.Controls)
            {
 
                if (tc.Controls[0] is TextBox)
                { 
                    Response.Write(((TextBox)tc.Controls[0]).Text);         
                }
            }
            Response.Write("<br/>");  
        }
               
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        /*Session["id"] = "f1011";
        Session["date"]=

        Session["date"] = DateTime.Today;
        String date = DateTime.Today.ToString("yyyy");
        Response.Write(date);
        String delete = "DELETE from leave_details where facid='" + Session["id"] + "' AND startdate='" + "03/13/2015" + "' ";
        SqlCommand com = new SqlCommand(delete,conn);
        com.ExecuteScalar();*/

    }
    protected override object SaveViewState()
    {
        object[] newViewState = new object[2];

        List<string> txtValues = new List<string>();

        foreach (TableRow row in tbl.Controls)
        {
            foreach (TableCell cell in row.Controls)
            {
                if (cell.Controls[0] is TextBox)
                {
                    txtValues.Add(((TextBox)cell.Controls[0]).Text);
                }
            }
        }

        newViewState[0] = txtValues.ToArray();
        newViewState[1] = base.SaveViewState();
        return newViewState;
    }
    protected override void LoadViewState(object savedState)
    {
        //if we can identify the custom view state as defined in the override for SaveViewState
        if (savedState is object[] && ((object[])savedState).Length == 2 && ((object[])savedState)[0] is string[])
        {
            object[] newViewState = (object[])savedState;
            string[] txtValues = (string[])(newViewState[0]);
            if (txtValues.Length > 0)
            {
                //re-load tables
                CreateDynamicTable();
                int i = 0;
                foreach (TableRow row in tbl.Controls)
                {
                    foreach (TableCell cell in row.Controls)
                    {
                        if (cell.Controls[0] is TextBox && i < txtValues.Length)
                        {
                            ((TextBox)cell.Controls[0]).Text = txtValues[i++].ToString();

                        }
                    }
                }
            }
            //load the ViewState normally
            base.LoadViewState(newViewState[1]);
        }
        else
        {
            base.LoadViewState(savedState);
        }
    }
}