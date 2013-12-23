using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NWACMS
{
    public partial class AddUser : System.Web.UI.Page
    {
        BOL bl = new BOL();
        bool IsPageRefresh;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblCreateErr.Visible = false;

            //drpDept.DataTextField = "Name";
            //drpDept.DataValueField = "dep_Id";


            if (!IsPostBack)
            {
                //drpDept.DataSource = bl.bolGetDeparments();
                //drpDept.DataBind();


                ViewState["postids"] = System.Guid.NewGuid().ToString();
                Session["postid"] = ViewState["postids"].ToString();
            }
            else
            {
                if (ViewState["postids"].ToString() != Session["postid"].ToString() || Session["postid"].ToString() == null)
                {
                    IsPageRefresh = true;
                }
                Session["postid"] = System.Guid.NewGuid().ToString();
                ViewState["postids"] = Session["postid"].ToString();
            }




        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {

            if (IsPageRefresh)
                this.Page.Response.Redirect("ManageUsers.aspx");
            //else
            //    IsPageRefresh = false;

            lblCreateErr.Visible = true;
            lblCreateErr.Text = bl.createUser(txtfName.Value.ToString(), txtlName.Value.ToString(), txtEmail.Value.ToString(), txtContact.Value.ToString(), txtTitle.Value.ToString(), Convert.ToInt32(drpDept.SelectedValue), drpRole.SelectedItem.ToString());

            //Extensions ex =new Exception()
            //ex.
            //this.Page.Reload(); 


        }
    }
}