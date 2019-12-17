using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CloudABISSampleWebApp.Utilities
{
    public class AppSettingsReader
    {

        /// <summary>
        /// 
        /// </summary>
        public static string CloudABIS_API_URL
        {
            get { return ReadMyConfig("CloudABIS_API_URL"); }
        }
     

        /// <summary>
        /// 
        /// </summary>
        public static string CloudABISCustomerKey
        {
            get { return ReadMyConfig("CloudABISCustomerKey"); }
        }
        /// <summary>
        /// 
        /// </summary>
        public static string CloudABISAppKey
        {
            get { return ReadMyConfig("CloudABISAppKey"); }
        }
        /// <summary>
        /// 
        /// </summary>
        public static string CloudABISSecretKey
        {
            get { return ReadMyConfig("CloudABISSecretKey"); }
        }

        /// <summary>
        /// Read application cofig value using the key
        /// </summary>
        /// <param name="strKey"></param>
        /// <returns></returns>
        internal static string ReadMyConfig(string strKey)
        {
            try
            {
                return !string.IsNullOrEmpty(ConfigurationSettings.AppSettings[strKey]) ? ConfigurationSettings.AppSettings[strKey] : string.Empty;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}