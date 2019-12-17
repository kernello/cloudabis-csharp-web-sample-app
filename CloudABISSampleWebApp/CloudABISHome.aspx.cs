using cloudabis_sdk.Models;
using CloudABISSampleWebApp.CloudABIS;
using CloudABISSampleWebApp.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudABISSampleWebApp
{
    public partial class CloudABISHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Set key value in the session
                LoadCloudABISToken();
                //
                lblStatus.Text = "Device: " + DeviceName() + ", Engine: " + EngineName();

            }
        }

        private void LoadCloudABISToken()
        {
            CloudABISAPICredentials cloudABISCredentials = new CloudABISAPICredentials();
            cloudABISCredentials.AppKey = AppSettingsReader.CloudABISAppKey;
            cloudABISCredentials.SecretKey = AppSettingsReader.CloudABISSecretKey;
            cloudABISCredentials.BaseAPIURL = AppSettingsReader.CloudABIS_API_URL;
            cloudABISCredentials.CustomerKey = AppSettingsReader.CloudABISCustomerKey;
            cloudABISCredentials.EngineName = EngineName();

            //Read token from CloudABIS Server
            CloudABISConnector cloudABISConnector = new CloudABISConnector(cloudABISCredentials.AppKey, cloudABISCredentials.SecretKey,
                cloudABISCredentials.BaseAPIURL, cloudABISCredentials.CustomerKey, cloudABISCredentials.EngineName);

            CloudABISToken token = cloudABISConnector.GetCloudABISToken();
            if (!string.IsNullOrEmpty(token.AccessToken))
            {
                SessionManager.CloudABISAPIToken = token.AccessToken;
                SessionManager.CloudABISCredentials = cloudABISCredentials;
            }
            else
            {
                lblStatus.Text = "CloudABIS Not Authorized!. Please check credentails";
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private string DeviceName()
        {
            try
            {
                return Request.Cookies["CSDeviceName"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }

        protected void lnkIsRegistered_Click(object sender, EventArgs e)
        {
            Response.Redirect("IsRegistered.aspx");
        }

        protected void lnkChangeID_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeID.aspx");
        }

        protected void lnkDeleteID_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteID.aspx");
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void lnkIdentify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Identify.aspx");
        }

        protected void lnkVerify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Verify.aspx");
        }
        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update.aspx");
        }
        protected void lnkChangeActiveDevice_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiveDevice.aspx");
        }
    }
}