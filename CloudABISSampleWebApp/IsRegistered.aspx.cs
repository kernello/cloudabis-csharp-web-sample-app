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
    public partial class IsRegistered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if ((string.IsNullOrEmpty(SessionManager.CloudABISAPIToken) || SessionManager.CloudABISCredentials == null)) Response.Redirect("ActiveDevice.aspx");

            }
        }

        protected void btnIsRegistered_Click(object sender, EventArgs e)
        {

            try
            {
                lblMessage.Text = "Start IsRegister operation...";
                if (!string.IsNullOrEmpty(txtRegisterID.Text.Trim().ToString()))
                {

                    string regID = txtRegisterID.Text.Trim().ToString();

                    if (!string.IsNullOrEmpty(SessionManager.CloudABISAPIToken))
                    {
                        CloudABISConnector cloudABISConnector = new CloudABISConnector(SessionManager.CloudABISCredentials.AppKey, SessionManager.CloudABISCredentials.SecretKey
                            , SessionManager.CloudABISCredentials.BaseAPIURL, SessionManager.CloudABISCredentials.CustomerKey, SessionManager.CloudABISCredentials.EngineName);

                        lblMessage.Text = cloudABISConnector.IsRegister(regID, SessionManager.CloudABISAPIToken);
                    }
                    else
                    {
                        Response.Redirect("AppConfiguration.aspx");
                    }
                }
                else lblMessage.Text = "Please give an ID";
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