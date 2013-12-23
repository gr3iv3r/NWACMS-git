using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

namespace NWACMS
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        BOL bl = new BOL();
        protected void Page_Load(object sender, EventArgs e)
        {
           // Label1.Text = bl.GetNISTDate(true).ToString();
             
        }

        //protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        //{ 
            
        //   // string dsd = "dfds";
        //   //dsd= Login1.UserName;
        //   //string ik = "dfds";
        //   //ik = Login1.Password;

        //   //bool successfulLogin = false;
        //   //string userName = Membership.GetUserNameByEmail(Login1.UserName); //the email address
        //   //Login1.UserName = userName;
        //   //successfulLogin = Membership.ValidateUser(userName, Login1.Password);

        //   //if (successfulLogin)
        //   //    FormsAuthentication.SetAuthCookie(userName, true);

        //   //e.Authenticated = successfulLogin;
            
          
        //  // Login1.
          
        //}

         

        //protected override object SaveViewState()
        //{
        //    return null;// base.SaveViewState();
        //}

        //protected void Login1_LoginButton_Click(object sender, EventArgs e)
        //{
           
        //  Login1.DestinationPageUrl = "about.aspx";
        //}

        //protected void Login1_LoginError(object sender, EventArgs e)
        //{
        //      Login1.FailureText = "sdada";
        //}
    }
}
