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
    public partial class Update : System.Web.UI.Page
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
                return Request.Cookies["CABEngineNamev10"].Value.ToString();
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
                return Request.Cookies["CSTempalteFormatv10"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                serverResult.Text = "Start updating...";
                string template = templateXML.Text.ToString();
                string templateFormat = "WSQ";//CSTempalteFormat();
                string updateID = txtUpdateID.Text.ToString();

                if (!string.IsNullOrEmpty(template) && !string.IsNullOrEmpty(updateID))
                {

                    if (!string.IsNullOrEmpty(SessionManager.CloudABISAPIToken))
                    {
                        CloudABISConnector cloudABISConnector = new CloudABISConnector(SessionManager.CloudABISCredentials.AppKey, SessionManager.CloudABISCredentials.SecretKey
                           , SessionManager.CloudABISCredentials.BaseAPIURL, SessionManager.CloudABISCredentials.CustomerKey, SessionManager.CloudABISCredentials.EngineName);

                        serverResult.Text = cloudABISConnector.Update(template, updateID, SessionManager.CloudABISAPIToken, templateFormat);
                    }
                    else
                    {
                        Response.Redirect("AppConfiguration.aspx");
                    }
                }
                else if (string.IsNullOrEmpty(updateID))
                {
                    serverResult.Text = "Please put update id first";
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