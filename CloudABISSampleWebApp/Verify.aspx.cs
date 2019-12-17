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
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(SessionManager.CloudABISAPIToken) || SessionManager.CloudABISCredentials == null) Response.Redirect("ActiveDevice.aspx");


            }
        }
        private string EngineName()
        {
            try
            {
                return Request.Cookies["CABEngineName"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }



        private string CSTempalteFormat()
        {
            try
            {
                return Request.Cookies["CSTempalteFormat"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }
        protected void btnVerify_Click(object sender, EventArgs e)
        {
            try
            {
                serverResult.Text = "Start verify...";
                string template = templateXML.Text.ToString();
                string templateFormat = "WSQ";//CSTempalteFormat();
                string verifyID = txtVerifyID.Text.ToString();

                if (!string.IsNullOrEmpty(template) && !string.IsNullOrEmpty(verifyID))
                {

                    if (!string.IsNullOrEmpty(SessionManager.CloudABISAPIToken))
                    {
                        CloudABISConnector cloudABISConnector = new CloudABISConnector(SessionManager.CloudABISCredentials.AppKey, SessionManager.CloudABISCredentials.SecretKey
                           , SessionManager.CloudABISCredentials.BaseAPIURL, SessionManager.CloudABISCredentials.CustomerKey, SessionManager.CloudABISCredentials.EngineName);

                        serverResult.Text = cloudABISConnector.Verify(template, verifyID, SessionManager.CloudABISAPIToken, templateFormat);
                    }
                    else
                    {
                        Response.Redirect("ActiveDevice.aspx");
                    }
                }
                else if (string.IsNullOrEmpty(verifyID))
                {
                    serverResult.Text = "Please put verify id first";
                }
                else
                    serverResult.Text = "Please biometric capture first";
            }
            catch (Exception ex)
            {
                serverResult.Visible = true;
                serverResult.Text = ex.Message;
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CloudABISHome.aspx");
        }
    }
}