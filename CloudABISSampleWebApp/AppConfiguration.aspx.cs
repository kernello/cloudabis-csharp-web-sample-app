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
    public partial class AppConfiguration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadConfiguration();
                //Clear session
                SessionManager.CloudABISCredentials = null;
                SessionManager.CloudABISAPIToken = string.Empty;

            }


        }
        #region Configuration
        private void LoadConfiguration()
        {
            try
            {
                txtAPIBaseURL.Text = BaseURL();
                txtAppKey.Text = AppKey();
                txtSecretKey.Text = SecretKey();
                txtCustomerKey.Text = CustomerKey();
            }
            catch (Exception)
            {
            }
        }
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
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CloudABISHome.aspx");
        }

    }
}