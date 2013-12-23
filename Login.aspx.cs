using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace NWACMS.Account
{
    public partial class Login : System.Web.UI.Page
    {
        BOL bl = new BOL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
            else
            {
                //((System.Web.UI.HtmlControls.HtmlInputText)LoginUser.FindControl("UserName1")).Value = "";
                //((System.Web.UI.HtmlControls.HtmlInputText)LoginUser.FindControl("Password1")).Value = "";
                //((RequiredFieldValidator)LoginUser.FindControl("RequiredFieldValidator1")).Visible = false;
                //((RequiredFieldValidator)LoginUser.FindControl("RequiredFieldValidator2")).Visible = false;
            }
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string email;
            
            string password;

           

            email=((System.Web.UI.HtmlControls.HtmlInputText)LoginUser.FindControl("UserName1")).Value;
            password=((System.Web.UI.HtmlControls.HtmlInputText)LoginUser.FindControl("Password1")).Value;
            

            bool successfulLogin = false;
            string userName = Membership.GetUserNameByEmail(email); //the email address
           
            

                LoginUser.UserName = userName;
                successfulLogin = Membership.ValidateUser(userName, (password));

                if (successfulLogin)
                {
                    FormsAuthentication.SetAuthCookie(userName, true);
                    e.Authenticated = successfulLogin;

                    if (Membership.GetUser(userName).Comment == "1")
                    {
                        Session["changepass"] = true;
                        Response.Redirect("~/Account/ChangePassword.aspx", true);
                    }
                    else
                    {
                        //LOGIN SUCCESS REDIRECT
                        Response.Redirect("Default.aspx", true);
                    }

                }
             
            
        }
    }
}