using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace NWACMS.Account
{
    public partial class ChangePassword : System.Web.UI.Page
    {
    

        BOL bl =new BOL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblChngpass.Visible = false;
            if (!IsPostBack)
            {
                
                if (Convert.ToBoolean(Session["changepass"]) == true)
                    lblChngpass.Visible = true;
            }

        }

        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);

            

            try
            {
                if (u.ChangePassword(CurrentPassword.Text, NewPassword.Text))
                {
                    FailureText.Text = "Password changed.";
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                    Session["changepass"] = false;
                    u.Comment = "0";
                    Membership.UpdateUser(u);

                    ChangePasswordPushButton.Visible = false;
                    CancelPushButton.Visible = false;
                    btnbktologin.Visible = true;

                }
                else
                {
                    FailureText.Text = "Password change failed. Please re-enter your values and try again.";
                }
            }
            catch (Exception ex)
            {
                FailureText.Text = "An exception occurred: " + Server.HtmlEncode(ex.Message) + ". Please re-enter your values and try again.";
            }
        }
    }

}