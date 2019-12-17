using CloudABISSampleWebApp.CloudABIS;
using CloudABISSampleWebApp.Utilities;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudABISSampleWebApp
{
    public partial class ChangeID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if ((string.IsNullOrEmpty(SessionManager.CloudABISAPIToken) || SessionManager.CloudABISCredentials == null)) Response.Redirect("Authenticate.aspx");

            }
        }

        protected void btnChangeID_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Text = "Start Change ID operation...";
                if (!string.IsNullOrEmpty(txtOldID.Text.Trim().ToString()) && !string.IsNullOrEmpty(txtNewID.Text.Trim().ToString()))
                {
                    string newID = txtNewID.Text.Trim().ToString();
                    string oldID = txtOldID.Text.Trim().ToString();

                    if (!string.IsNullOrEmpty(SessionManager.CloudABISAPIToken))
                    {
                        CloudABISConnector cloudABISConnector = new CloudABISConnector(SessionManager.CloudABISCredentials.AppKey, SessionManager.CloudABISCredentials.SecretKey
                            , SessionManager.CloudABISCredentials.BaseAPIURL, SessionManager.CloudABISCredentials.CustomerKey, SessionManager.CloudABISCredentials.EngineName);

                        lblMessage.Text = cloudABISConnector.ChangeID(oldID, newID, SessionManager.CloudABISAPIToken);
                    }
                    else
                    {
                        Response.Redirect("Authenticate.aspx");
                    }
                }
                else if (string.IsNullOrEmpty(txtNewID.Text.Trim())) lblMessage.Text = "Please give New ID";
                else if (string.IsNullOrEmpty(txtOldID.Text.Trim())) lblMessage.Text = "Please give Old ID";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CloudABISHome.aspx");
        }
    }
}