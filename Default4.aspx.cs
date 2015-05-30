using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridviewData();
        }
    }
    /// <summary>
    /// Dynamically create & bind data to datatable and bind datatable to gridview
    /// </summary>
    protected void BindGridviewData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("UserId", typeof(Int32));
        dt.Columns.Add("UserName", typeof(string));
        dt.Columns.Add("Education", typeof(string));
        dt.Columns.Add("Location", typeof(string));

        DataRow dtrow = dt.NewRow();    // Create New Row
        dtrow["UserId"] = 1;            //Bind Data to Columns
        dtrow["UserName"] = "SureshDasari";
        dtrow["Education"] = "B.Tech";
        dtrow["Location"] = "Chennai";
        dt.Rows.Add(dtrow);

        dtrow = dt.NewRow();               // Create New Row
        dtrow["UserId"] = 2;               //Bind Data to Columns
        dtrow["UserName"] = "MadhavSai";
        dtrow["Education"] = "MBA";
        dtrow["Location"] = "Nagpur";
        dt.Rows.Add(dtrow);

        dtrow = dt.NewRow();              // Create New Row
        dtrow["UserId"] = 3;              //Bind Data to Columns
        dtrow["UserName"] = "MaheshDasari";
        dtrow["Education"] = "B.Tech";
        dtrow["Location"] = "Nuzividu";
        dt.Rows.Add(dtrow);

        dtrow = dt.NewRow();              // Create New Row
        dtrow["UserId"] = 4;              //Bind Data to Columns
        dtrow["UserName"] = "Mahendra";
        dtrow["Education"] = "CA";
        dtrow["Location"] = "Guntur";
        dt.Rows.Add(dtrow);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
}