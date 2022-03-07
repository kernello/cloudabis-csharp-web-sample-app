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
    public partial class Identify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string.IsNullOrEmpty(SessionManager.CloudABISAPIToken) || SessionManager.CloudABISCredentials == null)) Response.Redirect("ActiveDevice.aspx");


            }
        }

        private string CSTempalteFormat()
        {
            try
            {
                return Request.Cookies["CSTempalteFormatv10"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }
        protected void btnIdentify_Click(object sender, EventArgs e)
        {

            try
            {
                serverResult.Text = "Start Identify...";
                string template = templateXML.Text.ToString();
                string templateFormat = "WSQ";//CSTempalteFormat();

                if (!string.IsNullOrEmpty(template))
                {
                    if (!string.IsNullOrEmpty(SessionManager.CloudABISAPIToken))
                    {
                        CloudABISConnector cloudABISConnector = new CloudABISConnector(SessionManager.CloudABISCredentials.AppKey, SessionManager.CloudABISCredentials.SecretKey
                            , SessionManager.CloudABISCredentials.BaseAPIURL, SessionManager.CloudABISCredentials.CustomerKey, SessionManager.CloudABISCredentials.EngineName);

                        serverResult.Text = cloudABISConnector.Identify(template, SessionManager.CloudABISAPIToken, templateFormat);
                    }
                    else
                    {
                        Response.Redirect("AppConfiguration.aspx");
                    }
                }
                else
                {
                    serverResult.Text = "Please biometric capture first";
                }

                //clear captured data
                //templateXML.Text = "";
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