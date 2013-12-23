using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Data;
using System.Web.UI;
namespace NWACMS
{
    
    public class BOL
    {
        DAL dl = new DAL();
        public bool chgPass { set; get; }


        public int acceptComplaint(string fname, string lname, string email, string contact, int category, int subcategory, int parish, string street, string description, string date, string submitted_By)
        {

            return dl.saveComplaint(fname, lname, email, contact, category, subcategory, parish, street, description, date, submitted_By);
        }

        public DataSet bolGetDeparments()
        {
             
            return dl.dalGetDepartments(); 
        }

        public string bladdEmployee(string fName, string lName, string contact, string email, string title, int dept, string role)
        {
            return dl.addEmployee(fName, lName, contact, email, title, dept,role);
        }





          public static void Reload(Page page)
            {
                page.Response.Redirect(page.Request.Url.AbsoluteUri);
            }
        
        public bool changepass(bool t_f)
        {
            return t_f;
        }

         public string createUser(string fname, string lname,  string email, string contact,string title,int dept,string role)
         {
             MembershipCreateStatus createstat;
             string res;

             //try
             //{
                MembershipUser newUser = Membership.CreateUser(fname + " " + lname, "_1234567", email, "null", "null", true, out createstat);
                
                 switch (createstat)
                 {
                     case MembershipCreateStatus.Success:
                         res = "";
                         newUser.Comment = "1";
                         Membership.UpdateUser(newUser);
                         res=bladdEmployee(fname, lname,  email,contact, title, dept,role);
                         Roles.AddUserToRole(newUser.UserName,role);
                         if (res == "Somthing went wrong while creating the user, please try again")
                             Membership.DeleteUser(newUser.UserName);
                         //if (Roles.RoleExists("cust") == false)
                         //    Roles.CreateRole("cust");
                         //if (Roles.RoleExists("admin") == false)
                         //    Roles.CreateRole("admin");
                         // Roles.AddUserToRole(newUser.UserName.ToString(), "cust");//add user to customer role

                          
                        //s assignrole(newUser.UserName.ToString(), role);

                        // mn.addCustomer(mn.connectionstring(), fname, lname, contact);

                         break;
                     case MembershipCreateStatus.DuplicateUserName:
                         res = "That username already exists.";
                         break;
                     case MembershipCreateStatus.DuplicateEmail:
                         res = "A user with that Email address already exists.";
                         break;
                     case MembershipCreateStatus.InvalidEmail:
                         res = "PLease enter a VALID email address.";
                         break;
                     case MembershipCreateStatus.InvalidAnswer:
                         res = "The security answer is not valid";
                         break;
                     case MembershipCreateStatus.InvalidPassword:
                         res = "The password entered is invalid. PLease enter a passoword with at least 7 characters and one non-alphanumeric.";
                         break;
                     default:
                         res = "Unknown Error: Account NOT created.";

                         break;
                 }
             //}
             //catch (Exception e)
             //{
             //    res = "Unknown Error: Account NOT created. Try Again";

             //}

             return res;
         }


         public string createrole(string role)
         {
             string res = "";
             if (Roles.RoleExists(role) == false)
             {
                 Roles.CreateRole(role);
                 res = "Role created sucessculy";
             }
             else
                 res = "Role already exist";
             return res;
         }

         public string assignrole(string user, string role)
         {
             string res = "";
             try
             {
                 Roles.AddUserToRole(user, role);
                 if (Roles.IsUserInRole(user, role))
                     res = "Role assigned sucessculy";
             }
             catch (Exception)
             {

                 res = "already in role";
             }

             return res;

         }







     public  DateTime GetNISTDate(bool convertToLocalTime)
        {
            Random ran = new Random(DateTime.Now.Millisecond);
            DateTime date = DateTime.Today;
            string serverResponse = string.Empty;

            // Represents the list of NIST servers
            string[] servers = new string[] {
                         "time.nist.gov",
                          "wwv.nist.gov",
                            "time-d.nist.gov",
                            "nist.expertsmi.com",
                          "time-nist.symmetricom.com",
                       "nist.time.nosc.us"

                          };

            // Try each server in random order to avoid blocked requests due to too frequent request
            foreach (string server in servers)
            {
                try
                {
                    // Open a StreamReader to a random time server
                    StreamReader reader = new StreamReader(new System.Net.Sockets.TcpClient(servers[ran.Next(0, servers.Length)], 13).GetStream());
                    serverResponse = reader.ReadToEnd();
                    reader.Close();

                    // Check to see that the signiture is there
                    if (serverResponse.Length > 47 && serverResponse.Substring(38, 9).Equals("UTC(NIST)"))
                    {
                        // Parse the date
                        int jd = int.Parse(serverResponse.Substring(1, 5));
                        int yr = int.Parse(serverResponse.Substring(7, 2));
                        int mo = int.Parse(serverResponse.Substring(10, 2));
                        int dy = int.Parse(serverResponse.Substring(13, 2));
                        int hr = int.Parse(serverResponse.Substring(16, 2));
                        int mm = int.Parse(serverResponse.Substring(19, 2));
                        int sc = int.Parse(serverResponse.Substring(22, 2));

                        if (jd > 51544)
                            yr += 2000;
                        else
                            yr += 1999;

                        date = new DateTime(yr, mo, dy, hr, mm, sc);

                        // Convert it to the current timezone if desired
                        if (convertToLocalTime)
                            date = date.ToLocalTime();

                        // Exit the loop
                        break;
                    }

                }
                catch (Exception ex)
                {
                    /* Do Nothing...try the next server */
                }
            }

            return date;
        }
    }
}