using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace NWACMS
{
    public partial class AddComplaint : System.Web.UI.UserControl
    {
        BOL bl = new BOL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
             
             
            
         }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int res;

            string submitted_By=null;
            if (Page.User.Identity.Name == "")
            {

                submitted_By = txtEmail.Text;
            }
            else
            {
                submitted_By =  Membership.GetUser().Email;
            }
            

            res = bl.acceptComplaint(txtFName.Text, txtLName.Text, txtEmail.Text, txtContact.Text, Convert.ToInt32(drpCategory.Text), Convert.ToInt32(drpSubcategory.Text), Convert.ToInt32(drpParish.Text), txtStreet.Text, txtAreaDesc.Value.ToString(), bl.GetNISTDate(true).ToString(), submitted_By);
          if (res == -1)
          {
              Label1.Visible=true;
              Label1.Text = "Complaint not saved try again";
          }
          else
          {
              Label1.Visible=true;
              Label1.Text = "Complaint Saved"+"Use this tracking number ("+res+") to track the progress of this complaint";
          }

        }

       
    }
}