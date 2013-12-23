using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NWACMS
{
    public partial class Trackcomplaint : System.Web.UI.Page
    {
       NWACMSlinqDataContext dt = new NWACMSlinqDataContext();
       int? res;
        protected void Page_Load(object sender, EventArgs e)
        { 
          
            
         
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            
          
            if (!String.IsNullOrEmpty(txtTrackno.Text))
            { 
                dt.getIfCompExist(Convert.ToInt32(txtTrackno.Text), ref res);

                if (res == 1)
                {
                    Session["track_no"] = Convert.ToInt32(txtTrackno.Text);
                    Response.Redirect("ComplaintDetails.aspx");
                }
                else
                {
                    lblError.Visible = true;
                    //null dnt exist
                }
                
            }
        }
    }
}