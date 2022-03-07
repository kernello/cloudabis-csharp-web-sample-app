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
            try
            {
                CloudABISAPICredentials cloudABISCredentials = new CloudABISAPICredentials();
                cloudABISCredentials.AppKey = AppKey();
                cloudABISCredentials.SecretKey = SecretKey(); //AppSettingsReader.CloudABISSecretKey;
                cloudABISCredentials.BaseAPIURL = BaseURL(); //AppSettingsReader.CloudABIS_API_URL;
                cloudABISCredentials.CustomerKey = CustomerKey(); //AppSettingsReader.CloudABISCustomerKey;
                cloudABISCredentials.EngineName = EngineName();

                if (!string.IsNullOrEmpty(cloudABISCredentials.BaseAPIURL)
                   && !string.IsNullOrEmpty(cloudABISCredentials.SecretKey)
                   && !string.IsNullOrEmpty(cloudABISCredentials.CustomerKey))
                {
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
                        lblStatus.Text = "CloudABIS Not Authorized!. Please check credentails in the config file";
                    }
                }
                else
                {
                    lblStatus.Text = "CloudABIS Not Authorized!. Please check credentails in the config file";
                }
            }
            catch (Exception)
            {
                lblStatus.Text = "CloudABIS Not Authorized!. Please check credentails in the config file";
            }

        }

        #region Configuration
        
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private string BaseURL()
        {
            try
            {
                return Request.Cookies["CABBaseURLv10"].Value.ToString();
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
        private string AppKey()
        {
            try
            {
                return Request.Cookies["CABAppKeyv10"].Value.ToString();
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
        private string SecretKey()
        {
            try
            {
                return Request.Cookies["CABSecretKeyv10"].Value.ToString();
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
        private string CustomerKey()
        {
            try
            {
                return Request.Cookies["CABCustomerKeyv10"].Value.ToString();
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
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private string DeviceName()
        {
            try
            {
                return Request.Cookies["CSDeviceNamev10"].Value.ToString();
            }
            catch (Exception)
            {
                return null;
            }
        }
        #endregion
        

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
            Response.Redirect("AppConfiguration.aspx");
        }
    }
}