using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Services;

namespace NWACMS
{
    public partial class complaintDetails : System.Web.UI.UserControl  
    {
        NWACMSlinqDataContext dt = new NWACMSlinqDataContext();
        BOL bl = new BOL();
        int? comp_ID = null, track_no, ResolvedConfirmed=null, ResolvedConfirmed_BY=null,inbox_ID;
        string descrip = null, address1 = null, isResolved = null, priority = null, firstName = null, lastName = null, email = null, contact_No = null, cat_Name = null, sub_Name = null, parish = null, submitted_By = null, @submit_Title=null,submit_Dept = null, emp_fName = null, emp_lName = null;
        DateTime? date_resolved = null, inboxDate_recieved = null, date_seen = null;
                
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //try
            //{

                 track_no = (int?)Session["track_no"];
               

                dt.complaintDetails(track_no, ref comp_ID, ref date_resolved, ref descrip, ref address1, ref isResolved, ref priority, ref firstName, ref lastName, ref email, ref contact_No, ref inboxDate_recieved, ref cat_Name, ref sub_Name, ref parish, ref date_seen, ref submitted_By, ref submit_Title, ref submit_Dept, ref emp_fName, ref emp_lName,ref ResolvedConfirmed, ref ResolvedConfirmed_BY,ref inbox_ID);
               // dt.seen_By(Membership.GetUser().Email, inbox_ID, bl.GetNISTDate(true));

                
                Session["parish"] = parish;

               // ()FindControl("banner")
                if (priority == "Urgent")
                {
                    banner.Style.Add("background-color", "Red");
                    //finish banner
                }



                if (ResolvedConfirmed.HasValue)
                if (int.Parse(ResolvedConfirmed.Value.ToString())==0)
                {
                    if (!Roles.GetRolesForUser().Contains("Manager") || !Roles.GetRolesForUser().Contains("Director"))
                    {
                       // btnResConfirm.Text = "Confirm Resolve Request";
                        btnResConfirm.Visible = false;
                        btnCancelRes.Visible = false;
                        btnResolve.Visible = false;
                        spnConfirmStat.Visible = true;
                    }
                    else
                    {
                        spnConfirmStat.Visible = true;
                        btnResolve.Visible = true;
                    }
                     
                }

                lblBan.Text = "ID:"+comp_ID.ToString()+":"+priority;

                lblcompName.Text = firstName + " " + lastName;
                lblEmail.Text = email;
                lblContact.Text = contact_No;
                lblID.Text = comp_ID.ToString();
                lblTrack.Text = track_no.ToString();
                lblCat.Text = cat_Name;
                lblSub.Text = sub_Name;
                lblParish.Text = parish;
                lblStreet.Text = address1;
                lblSubmit.Text = submitted_By;
                lbltitle.Text = "-(" + submit_Title + " - " + submit_Dept + ")";

                lblDate.Text = ((DateTime)inboxDate_recieved).ToLongDateString() + " " + ((DateTime)inboxDate_recieved).ToShortTimeString();
                lblpriority.Text = priority;
                
                if (!IsPostBack)
                {
                    if (date_resolved == null)
                    {
                        TimeSpan newdate = bl.GetNISTDate(true).Subtract(((DateTime)inboxDate_recieved));
                        lblLife.Text = Convert.ToUInt32(newdate.TotalDays).ToString() + " Days";
                        lblResDate.Text = "--";
                    }
                    else
                    {
                        TimeSpan newdate = ((DateTime)date_resolved).Subtract(((DateTime)inboxDate_recieved));
                        lblLife.Text = Convert.ToUInt32(newdate.TotalDays).ToString() + " Days";
                        lblResDate.Text = ((DateTime)date_resolved).ToLongDateString() + " " + ((DateTime)date_resolved).ToShortTimeString();
                    }
                }

               

                lblStat.Text = isResolved;
                lblDesc.Text = descrip;
                lblRes.Text = emp_fName + " " + emp_lName;


                
                //lnkBtnChgPrty.Visible = true;
                //lnkBtnConfirm.Visible = false;
                //FIX DATE RESOLVED & RESOLVED BY IN SP TOO AND TABLES

                //GET RESOLVED
               // dt.resolved_Who((int?)Int32.Parse(lblTrack.Text),;


            //}
            //catch (Exception ex)
            //{
                
            //    Response.Redirect("Complaints.aspx",true);
            //}

        }

        [WebMethod()]
        protected void lnkBtnAddRmrk_Click(object sender, EventArgs e)
        {
            grdVwRmk.Visible = false;
            lnkBtnAddRmrk.Visible = false;

            txtAreaRemark.Visible = true;
            btnDone.Visible = true;


        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtAreaRemark.Value))
            dt.addRemark(txtAreaRemark.Value, comp_ID, Membership.GetUser().Email, bl.GetNISTDate(true));


            grdVwRmk.Visible = true;
            lnkBtnAddRmrk.Visible = true;

            txtAreaRemark.Visible = false;
            btnDone.Visible = false;

           

        }

        protected void lnkBtnChgPrty_Click(object sender, EventArgs e)
        {
            lnkBtnChgPrty.Visible = false;
            lnkBtnConfirm.Visible = true;
            lnkBtnCancel.Visible = true;

        }

        protected void lnkBtnConfirm_Click(object sender, EventArgs e)
        {
            lnkBtnChgPrty.Visible = true;
            lnkBtnConfirm.Visible = false;
            lnkBtnCancel.Visible = false;
           
                dt.setPriority((int?)Int32.Parse(lblTrack.Text), lblpriority.Text);
                Response.Redirect("ComplaintDetails.aspx", true);
           
            
        }

        protected void lnkBtnCancel_Click(object sender, EventArgs e)
        {
            lnkBtnCancel.Visible = false;
            lnkBtnChgPrty.Visible = true;
            lnkBtnConfirm.Visible = false;
        }

        protected void grdVwRmk_PreRender(object sender, EventArgs e)
        {  
            GridView gv = (GridView)sender;
            GridViewRow gvr = (GridViewRow)gv.BottomPagerRow;
            if (gvr != null)
            {
                gvr.Visible = true;
            }   
        }

        protected void btnResolve_Click(object sender, EventArgs e)
        {
            btnResolve.Visible = false;
            if (!Roles.GetRolesForUser().Contains("Manager") || !Roles.GetRolesForUser().Contains("Director"))
            {
                
                btnCancelRes.Visible = true;
                spnConfirmStat.Visible = true;
                btnResConfirm.Visible = false;

                //RESOLVE REQUEST
               dt.confirm_Request(Int32.Parse(lblTrack.Text), 0);
            }
            else
            {
                 btnCancelRes.Text = "Cancel";
                 btnResConfirm.Visible = true;
                 btnCancelRes.Visible = true;
            }
        }

        protected void btnCancelRes_Click(object sender, EventArgs e)
        {
            btnCancelRes.Visible = false;
            btnResolve.Visible = true; 
            spnConfirmStat.Visible = false;
            btnResConfirm.Visible = false;


            //CANCEL RESOLVE REQUEST
            dt.confirm_Request(Int32.Parse(lblTrack.Text), null);
        }

        protected void btnResConfirm_Click(object sender, EventArgs e)
        {
            btnCancelRes.Visible = false;
            btnResolve.Visible = false;
            spnConfirmStat.Visible = false;
            btnResConfirm.Visible = false;

            //RESOLVE THE COMPLAINT
            dt.resovle_This(Int32.Parse(lblTrack.Text), Membership.GetUser().Email, bl.GetNISTDate(true), "Resolved");
            dt.confirm_Request(Int32.Parse(lblTrack.Text), 1);

        }
    }
}