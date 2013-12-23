using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Linq;

namespace NWACMS
{
    public partial class Genworkorder : System.Web.UI.Page
    {
        
        NWACMSlinqDataContext dt = new NWACMSlinqDataContext();
        BOL bl = new BOL();
        int? track_no, workorder_Id, res ,appres;
        string email, title, woTitle, Manager_approved="Manager", Director_approved="Director", SrDirector_approved="Sr. Director", Ceo_approved="CEO", parish;
        DateTime ?date_recieved;
        Decimal? cost;
        bool? fullyApproved, completed;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            track_no = (int?)Session["track_no"];

            //TRY CATCH HERE
            if (track_no == null)
            {
                Response.Redirect("Complaints.aspx", true);

            }

            dt.getWoDetails(track_no, ref workorder_Id, ref email, ref title, ref woTitle, ref date_recieved, ref parish, ref cost,ref completed);
           

            if(completed.Value)//CHECK IF WORKORDER PROJECT IS FINISHED WHEN PAGE LOAD...TRUE IF YES
            {
                btnWOFinish.Visible=false;
            }

            if(!Roles.IsUserInRole("Field Personnel"))//cant generate workoder if not a field officer
            {
                btnGenWO.Visible = false;
            }





            if (workorder_Id == null)
            {
                UpdatePanel1.Visible = false;
                
                lblBan.Text = "ID:--";
            }

            else
            {
                lblBan.Text =  "ID: "+workorder_Id.Value.ToString();
               // lblTitle.Text = woTitle.ToString();
                lblParish.Text = parish.ToString();
                lblWoDate.Text = date_recieved.ToString();
                pnlNoWo.Visible = false;
                //GET WORK DEETS
                // lblTitle.Text=
                
            }

            //check  if approve empty
            dt.checkApproved_By(workorder_Id, ref res);

            //CHECK WHO APPOVED

            dt.getIfApproved_By(Membership.GetUser().Email,workorder_Id,ref appres);//This Wrong use othe One a swear
            dt.getApproved_By(workorder_Id, ref Manager_approved, ref Director_approved, ref SrDirector_approved, ref Ceo_approved,ref fullyApproved);

            
            //HIDE WO APPROVE BTN IF WO ALREADY FULLY APPROVED
            if (fullyApproved.Value)
            {
                btnAppvWo.Visible = false;
                if (email == Membership.GetUser().Email)//MAKE ITS THE SAME PERSON THAT CREATED THE WO
                {
                   btnWOFinish.Visible = true;//SHOW FINISH BUTTON ONLY IF WO FULLY APPROVED
                }
            }

            else
            {
                #region WO Approve control
		
                //not fully approved
                if (Manager_approved == null)//If not approved aredy by Manager 
                {
                    if (Roles.IsUserInRole("Manager"))
                    {
                        btnAppvWo.Visible = true;

                    }
                }

                if (Manager_approved != null && Director_approved == null)//Manager approved but not Director
                {
                    if (Roles.IsUserInRole("Director"))
                    {
                        btnAppvWo.Visible = true;

                    }
                }

                if (Manager_approved != null && Director_approved != null && SrDirector_approved == null)//Manager,Director but not Sr. Director Approved
                {
                    if (Roles.IsUserInRole("Sr. Director"))
                    {
                        btnAppvWo.Visible = true;

                    }
                }

                if (Manager_approved != null && Director_approved != null && SrDirector_approved != null && Ceo_approved == null)//Manager,Director,Sr. Director but not CEO Approved
                {
                    if (Roles.IsUserInRole("CEO"))
                    {
                        btnAppvWo.Visible = true;

                    }
                }


                #endregion
            } 
	


             
            

            //ROLE CHECK BEFORE APPROVE


            try
            {
                // SqlDataSource3.SelectParameters["workorder_Id"].DefaultValue = workorder_Id.Value.ToString();
                Session["workorder_Id"] = workorder_Id;
            }
            catch (Exception ex)
            {

                Response.Redirect("Complaints.aspx", true);
            }

            ////probly too soon to check
            //if (SqlDataSource2.Select(DataSourceSelectArguments.Empty).Equals(null))
            //{


            //    lblWrkOdertotal.Visible = true;
                
            //}
        }

        protected void btnAddTitle_Click(object sender, EventArgs e)
        {
            
                dt.addWrkTitle(track_no, txtWoTitle.Text, bl.GetNISTDate(true), Membership.GetUser().Email, Session["parish"].ToString(), ref workorder_Id);

                if (workorder_Id != null)
                {
                    Response.Redirect("Genworkorder.aspx", true);
                }
                else
                {
                    //DELETE RECENT INSERT FROM WO IF ID NULL--REVERT CHANGES
                    var count = (from workorder in dt.Workorders select workorder).Last<Workorder>();
                    dt.Workorders.DeleteOnSubmit(count);
                    dt.SubmitChanges();
                }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            //if (Session["total"]!=null)
            //Session["total"] = (Convert.ToDecimal(lblWrkOdertotal.Text)) + Convert.ToDecimal(lblAmt.Text);
            dt.addWrkItem(workorder_Id, txtItem.Text, txtDesc.Value, Convert.ToInt32(txtQuan.Text), Convert.ToDecimal(txtRate.Text), Convert.ToDecimal(lblAmt.Text), Convert.ToInt32(drpUnit.Text),Convert.ToBoolean(chkBxInStr.SelectedValue));
            dt.calcWoCost(workorder_Id);
            Response.Redirect("Genworkorder.aspx", true);

        }


        protected void txtQuan_TextChanged(object sender, EventArgs e)
        {
            lblAmt.Text = (Convert.ToDecimal(txtQuan.Text) * Convert.ToDecimal(txtRate.Text)).ToString();
        }

        protected void txtRate_TextChanged(object sender, EventArgs e)
        {
            lblAmt.Text = (Convert.ToDecimal(txtQuan.Text) * Convert.ToDecimal(txtRate.Text)).ToString();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            decimal g, total = 0;

            if (GridView1.Rows.Count > 0)
            {
                // lblWrkOdertotal.Text = "Total: " +/*(Convert.ToDecimal(lblWrkOdertotal.Text) + */Convert.ToDecimal(GridView1.Rows[0].Cells[10].Text)/*)*/.ToString(); //Convert.ToDecimal(Session["total"].ToString()).ToString();

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {

                    try
                    {
                        //  g=Convert.ToDecimal(GridView1.Rows[i].Cells[5].Text.Trim(new Char[] {'$'} ));
                        total += Convert.ToDecimal(GridView1.Rows[i].Cells[6].Text.Trim(new Char[] { '$' }).ToString());
                    }
                    catch (Exception)
                    {
                        total += Convert.ToDecimal(((TextBox)GridView1.Rows[i].Cells[6].Controls[0]).Text.Trim(new Char[] { '$' }).ToString());


                    }
                }
                lblWrkOdertotal.Visible = true;
                lblWrkOdertotal.Text = "Total: $" + total.ToString();

                //FOOTER NOW ENABLED

                GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                GridView1.FooterRow.Cells[5].Text = "Total: ";
                GridView1.FooterRow.Cells[6].Text = "$" + total.ToString();

                dt.calcWoCost(workorder_Id);//CALC COST OF WORKORDER
            }
            
        }

        protected void btnGenWO_Click(object sender, EventArgs e)
        {
            pnlNoWo.Visible = false;
            UpdatePanel1.Visible = true;
           

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //change the value of the subtotal here
           // GridView1.Rows[i].Cells[6].Text=

           // ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text = Convert.ToString(Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text) * Convert.ToDecimal(((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text));
           
             
        }

        

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            //prevent workorder delete if already approved
            if (res == 1)
            {
                GridView2.Columns[1].Visible = false;
            }
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            //if (GridView1.Columns.Count > 0)
            //{
            //    decimal g, total = 0;

            //    //CONSIDER LINQ AND FOR EACH OR CHECK IF GRIDVIEW IN EDIT MODE
            //    for (int i = 0; i < GridView1.Rows.Count; i++)
            //    {
            //        //  g=Convert.ToDecimal(GridView1.Rows[i].Cells[5].Text.Trim(new Char[] {'$'} ));
            //        total += Convert.ToDecimal(GridView1.Rows[i].Cells[6].Text.Trim(new Char[] { '$' }).ToString());
            //    }
            //    lblWrkOdertotal.Visible = true;
            //    lblWrkOdertotal.Text = "Total: $" + total.ToString();

               
                    if (Membership.GetUser().Email != email)//ONLY CREATOR OF WRK ORDER CAN MODIFY
                        GridView1.Columns[GridView1.Columns.Count - 1].Visible = false;
              
           // }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            int count = (from item in dt.Items select item).Count();
            for (int i = 1; i <= count; i++)
            {
                var row = dt.Items.Single(x => x.Item_ID == i);  // Getting the row

                try
                {
                    row.Amount = Convert.ToDecimal(Convert.ToInt32(((TextBox)GridView1.Rows[i - 1].Cells[3].Controls[0]).Text) *
                            Convert.ToDecimal(((TextBox)GridView1.Rows[i - 1].Cells[5].Controls[0]).Text));  // Assign the new value


                }
                catch (ArgumentOutOfRangeException)
                {
                    Decimal quan = Convert.ToInt32(GridView1.Rows[i - 1].Cells[3].Text), rate = Convert.ToDecimal(GridView1.Rows[i - 1].Cells[5].Text.Trim(new Char[] { '$' }).ToString());
                    row.Amount = quan * rate; // Assign the new value
                    
                }
            }

            //try
            //{
            //    dt.SubmitChanges();
            //}
            //catch (ChangeConflictException)
            //{
            //    dt.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
            //    dt.SubmitChanges();
            //}

            //UNDO APPROVE IF WORK ORDER GETS MODIFIED--MAKE TO FUNCTION
            var undoapprv = from appv in dt.approved_Bies where workorder_Id.Value==workorder_Id select appv;
            dt.approved_Bies.DeleteAllOnSubmit(undoapprv); 
            try
            {
                dt.SubmitChanges();
            }
            catch (ChangeConflictException)
            {
                dt.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
                dt.SubmitChanges();
            }


        }

        protected void btnAppvWo_Click(object sender, EventArgs e)
        {
            var instore_ornot = (from item in dt.Items where item.inStore.Value == false select item);
            if (instore_ornot.Count() < 1)
            {
                //all in store
                if (Roles.IsUserInRole("Manager"))//All in storage and is the Manager
                {
                    dt.approveWO(Membership.GetUser().Email, workorder_Id);
                    dt.setFullyApproved(workorder_Id);//COMPLETE APPROVAL
                }



            }
            else
            {
                //not all in store
                
                dt.approveWO(Membership.GetUser().Email, workorder_Id);
                if (Roles.IsUserInRole("CEO"))//IF CEO THEN THAT MEANS ALL (SUB CEO) APPROVED ALREADY
                {

                    dt.setFullyApproved(workorder_Id);//COMPLETE APPROVAL
                }
            }
            
        }


        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //UNDO APPROVE IF WORK ORDER GETS MODIFIED--MAKE TO FUNCTION
            var undoapprv = from appv in dt.approved_Bies where workorder_Id.Value == workorder_Id select appv;
            dt.approved_Bies.DeleteAllOnSubmit(undoapprv);
            try
            {
                dt.SubmitChanges();
            }
            catch (ChangeConflictException)
            {
                dt.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
                dt.SubmitChanges();
            }

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //UNDO APPROVE IF WORK ORDER GETS MODIFIED--MAKE TO FUNCTION
            var undoapprv = from appv in dt.approved_Bies where workorder_Id.Value == workorder_Id select appv;
            dt.approved_Bies.DeleteAllOnSubmit(undoapprv);
            try
            {
                dt.SubmitChanges();
            }
            catch (ChangeConflictException)
            {
                dt.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
                dt.SubmitChanges();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //UNDO APPROVE IF WORK ORDER GETS MODIFIED--MAKE TO FUNCTION
            var undoapprv = from appv in dt.approved_Bies where workorder_Id.Value == workorder_Id select appv;
            dt.approved_Bies.DeleteAllOnSubmit(undoapprv);
            try
            {
                dt.SubmitChanges();
            }
            catch (ChangeConflictException)
            {
                dt.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
                dt.SubmitChanges();
            }

        }

        protected void btnWOFinish_Click(object sender, EventArgs e)
        {
            dt.setWoFinish(workorder_Id, true);
        }

       

       

        

       

      
    }
}