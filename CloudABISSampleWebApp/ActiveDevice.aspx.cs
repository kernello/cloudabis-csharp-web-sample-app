using CloudABISSampleWebApp.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudABISSampleWebApp
{
    public partial class ActiveDevice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //Clear session
                SessionManager.CloudABISCredentials = null;
                SessionManager.CloudABISAPIToken = string.Empty;

            }
         

        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CloudABISHome.aspx");
        }
       
    }
}