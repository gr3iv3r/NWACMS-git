using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace NWACMS
{
    public partial class Complaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                SqlDataSource1.SelectParameters["role"].DefaultValue = Roles.GetRolesForUser()[0];
                SqlDataSource2.SelectParameters["role"].DefaultValue = Roles.GetRolesForUser()[0];
                SqlDataSource3.SelectParameters["role"].DefaultValue = Roles.GetRolesForUser()[0];
            }
            catch (Exception)
            {
                //Redirect somewhere
                
            }
            
        }

        
       // int RowCount = 0;
        protected void grdVwUnread_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Hiding the Select Button Cell in Header Row.
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            // get the row index, add onclick attribute for javascript:__doPostBack('grdVwUnread','Select$0')
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // Hiding the Select Button Cells showing for each Data Row. 
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");

               // e.Row.Attributes.Add("onclick", "javascript:__doPostBack('" + ((GridView)sender).ClientID + "','Select$" + (RowCount - 1).ToString() + "')");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdVwUnread, "Select$" + e.Row.RowIndex); 
                e.Row.Attributes.Add("onmouseover", "JavaScript:this.style.cursor='pointer';");


            }
           // RowCount++;
        }

        protected void grdVwUnread_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string u= grdVwUnread.SelectedRow.Cells[2].Text;
            //Session["comp_ID"] =  Convert.ToInt32(grdVwUnread.SelectedDataKey.Value) ;
            //Session["parish"] = grdVwUnread.SelectedRow.Cells[0].Text;
            //Session["category"] = grdVwUnread.SelectedRow.Cells[1].Text;
            //Session["description"] = grdVwUnread.SelectedRow.Cells[2].Text;
            
           // DataView dv = new DataView();
            DataTable dt = new DataTable();
            DataRow[] drr = new DataRow[1];

            dt = (( DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty)).ToTable();
             
            DataColumn[] keyColumns = new DataColumn[1];
            keyColumns[0] = dt.Columns["comp_ID"];
            dt.PrimaryKey = keyColumns;
            //string s = grdVwUnread.SelectedDataKey.Value.ToString();
            drr[0] = dt.Rows.Find(grdVwUnread.SelectedDataKey.Value.ToString());
          //  DateTime date =drr[0].Field<DateTime>("date_recieved");

             
           // Session["date"] = drr[0].Field<DateTime>("date_recieved").ToLongDateString() + " " + drr[0].Field<DateTime>("date_recieved").ToShortTimeString(); ;
            Session["track_no"] = drr[0].Field<int>("track_no");


            Response.Redirect("ComplaintDetails.aspx", true);
        }


        protected void grdVwRead_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Hiding the Select Button Cell in Header Row.
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            // get the row index, add onclick attribute for javascript:__doPostBack('grdVwUnread','Select$0')
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Hiding the Select Button Cells showing for each Data Row. 
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");

                // e.Row.Attributes.Add("onclick", "javascript:__doPostBack('" + ((GridView)sender).ClientID + "','Select$" + (RowCount - 1).ToString() + "')");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdVwRead, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "JavaScript:this.style.cursor='pointer';");


            }
            // RowCount++;
        }

        protected void grdVwRead_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string u = grdVwRead.SelectedRow.Cells[2].Text;
            //Session["comp_ID"] = Convert.ToInt32(grdVwRead.SelectedDataKey.Value);
            //Session["parish"] = grdVwRead.SelectedRow.Cells[0].Text;
            //Session["category"] = grdVwRead.SelectedRow.Cells[1].Text;
            //Session["description"] = grdVwRead.SelectedRow.Cells[2].Text;

            // DataView dv = new DataView();
            DataTable dt = new DataTable();
            DataRow[] drr = new DataRow[1];

            dt = ((DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty)).ToTable();

            DataColumn[] keyColumns = new DataColumn[1];
            keyColumns[0] = dt.Columns["comp_ID"];
            dt.PrimaryKey = keyColumns;
            //string s = grdVwRead.SelectedDataKey.Value.ToString();
            drr[0] = dt.Rows.Find(grdVwRead.SelectedDataKey.Value.ToString());
            //  DateTime date =drr[0].Field<DateTime>("date_recieved");


            //Session["date"] = drr[0].Field<DateTime>("date_recieved").ToLongDateString() + " " + drr[0].Field<DateTime>("date_recieved").ToShortTimeString(); ;
            Session["track_no"] = drr[0].Field<int>("track_no");


            Response.Redirect("ComplaintDetails.aspx", true);
        }

         protected void grdVwUrgent_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Hiding the Select Button Cell in Header Row.
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            // get the row index, add onclick attribute for javascript:__doPostBack('grdVwUrgent','Select$0')
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // Hiding the Select Button Cells showing for each Data Row. 
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");

               // e.Row.Attributes.Add("onclick", "javascript:__doPostBack('" + ((GridView)sender).ClientID + "','Select$" + (RowCount - 1).ToString() + "')");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdVwUrgent, "Select$" + e.Row.RowIndex); 
                e.Row.Attributes.Add("onmouseover", "JavaScript:this.style.cursor='pointer';");


            }
           // RowCount++;
        }

        protected void grdVwUrgent_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string u= grdVwUrgent.SelectedRow.Cells[2].Text;
            //Session["comp_ID"] =  Convert.ToInt32(grdVwUrgent.SelectedDataKey.Value) ;
            //Session["parish"] = grdVwUrgent.SelectedRow.Cells[0].Text;
            //Session["category"] = grdVwUrgent.SelectedRow.Cells[1].Text;
            //Session["description"] = grdVwUrgent.SelectedRow.Cells[2].Text;
            
           // DataView dv = new DataView();
            DataTable dt = new DataTable();
            DataRow[] drr = new DataRow[1];

            dt = (( DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty)).ToTable();
             
            DataColumn[] keyColumns = new DataColumn[1];
            keyColumns[0] = dt.Columns["comp_ID"];
            dt.PrimaryKey = keyColumns;
            //string s = grdVwUrgent.SelectedDataKey.Value.ToString();
            drr[0] = dt.Rows.Find(grdVwUrgent.SelectedDataKey.Value.ToString());
          //  DateTime date =drr[0].Field<DateTime>("date_recieved");

             
           // Session["date"] = drr[0].Field<DateTime>("date_recieved").ToLongDateString() + " " + drr[0].Field<DateTime>("date_recieved").ToShortTimeString(); ;
            Session["track_no"] = drr[0].Field<int>("track_no");


            Response.Redirect("ComplaintDetails.aspx", true);
        }

       
      

         

        
        
    }
}