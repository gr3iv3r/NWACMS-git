using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace NWACMS
{
    public class DAL
    {
        NWACMSlinqDataContext linq = new NWACMSlinqDataContext();

        public int saveComplaint(string fname,string lname,string email, string contact,int category, int subcategory,int parish,string street,string description,string date,string submitted_By)
        {

            //TRY catch HEAR!!!!!!!!!!!!!!!!!!!!!!
            int? comp_ID=null,track_no=null;
            int res=0;
            try
            {
                linq.addComplaint(fname, lname, email, contact, subcategory, parish, street, description, Convert.ToDateTime(date), ref comp_ID, ref track_no, "Not Resolved", submitted_By);

                //foreach (var user in Roles.GetUsersInRole("Complaints Manager"))
                //{
                   
                    //Mite have to fix role
                    linq.addInbox(comp_ID, Convert.ToDateTime(date), /*user*/Roles.GetRolesForUser()[0]);
                //}

                res= Convert.ToInt32(track_no);

            }
            catch (Exception )
            {

                res = -1;
            }
            return res;
        }


        public SqlConnection connectionstring()
        {
            string connStr = ConfigurationManager.ConnectionStrings["NWACMSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            //
            // TODO: Add constructor logic here
            return con;
        }

        public DataSet dalGetDepartments()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("getDeparments", connectionstring());

            da.SelectCommand.CommandType = CommandType.StoredProcedure;

 
            da.Fill(ds);

            return ds;

        }

       public string addEmployee(string fName,string lName,string contact,string email,string title,int dept ,string role)
        {
            
            try
            {
                linq.addUser(fName, lName, contact, email, title, dept,role);
                return "The user account was successfully created!";
               
            }
            catch (Exception e)
            {

                return "Somthing went wrong while creating the user, please try again";
            }
              
        }

    }
}