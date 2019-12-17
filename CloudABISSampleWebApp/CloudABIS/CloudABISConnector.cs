using cloudabis_sdk.APIManager;
using cloudabis_sdk.Models;
using cloudabis_sdk.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CloudABISSampleWebApp.CloudABIS
{
    public class CloudABISConnector
    {
        /// <summary>
        /// Given App Key
        /// </summary>
        private string _appkey = string.Empty;
        /// <summary>
        /// Given Secret Key
        /// </summary>
        private string _secretKey = string.Empty;
        /// <summary>
        /// Given Base API URL
        /// </summary>
        private string _apiBaseUrl = string.Empty;
        private string _customerKey = string.Empty;
        private string _engineName = string.Empty;

        /// <summary>
        /// Initialize CloudABIS API
        /// </summary>
        /// <param name="appKey"></param>
        /// <param name="secretKey"></param>
        /// <param name="apiBaseUrl"></param>
        /// <param name="customerKey"></param>
        /// <param name="engineName"></param>
        public CloudABISConnector(string appKey, string secretKey, string apiBaseUrl, string customerKey, string engineName)
        {
            this._appkey = appKey;
            this._secretKey = secretKey;
            this._apiBaseUrl = apiBaseUrl;
            this._customerKey = customerKey;
            this._engineName = engineName;

            if (string.IsNullOrEmpty(this._apiBaseUrl))
                throw new Exception("Please provide the api base url.");

            if (!this._apiBaseUrl.EndsWith("/"))
                this._apiBaseUrl = this._apiBaseUrl + "/";
        }
        /// <summary>
        /// Returns api token if given credentails is correct
        /// </summary>
        /// <returns></returns>
        public CloudABISToken GetCloudABISToken()
        {
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            return cloudABISAPI.GetToken();
        }
        #region Without Biometric Operation
        /// <summary>
        /// Is Registered
        /// </summary>
        /// <param name="id"></param>
        /// <param name="token"></param>
        /// <returns></returns>
        public string IsRegister(string id, string token)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = id,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.IsRegistered(biometricRequest);
            if (matchingResponse != null) return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            else return "Something went wrong!";
        }
        /// <summary>
        /// Change existing id
        /// </summary>
        /// <param name="oldID"></param>
        /// <param name="newID"></param>
        /// <param name="token"></param>
        public string ChangeID(string oldID, string newID, string token)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = oldID,
                NewRegistrationID = newID,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.ChangeID(biometricRequest);
            if (matchingResponse != null) return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            else return "Something went wrong!";
        }
        /// <summary>
        /// Delete existing biometric records against an id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="token"></param>
        public string DeleteID(string id, string token)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = id,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.RemoveID(biometricRequest);
            if (matchingResponse != null) return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            else return "Something went wrong!";
        }
        #endregion
        #region With Biometric Operation
        /// <summary>
        /// Register an employee/person
        /// </summary>
        /// <param name="template">Templte or image</param>
        /// <param name="registrationid"></param>
        /// <param name="token"></param>
        /// <param name="format">Format value needs only for FingerPrint operation</param>
        public string Register(string template, string registrationid, string token, string format = CloudABISConstant.CLOUDABIS_ISO)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = registrationid,
                BiometricXml = template,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Format = format,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.Register(biometricRequest);
            if (matchingResponse != null)
            {
                if (matchingResponse.OperationName.Equals(EnumOperationName.Register) && matchingResponse.OperationResult.Equals(CloudABISConstant.SUCCESS)) return "Registration Success!";
                else return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            }
            else return "Something went wrong!";
        }
        /// <summary>
        /// Update existing employee/person biometric data
        /// </summary>
        /// <param name="template">Templte or image</param>
        /// <param name="registrationid"></param>
        /// <param name="token"></param>
        /// <param name="format">Format value needs only for FingerPrint operation</param>
        public string Update(string template, string registrationid, string token, string format = CloudABISConstant.CLOUDABIS_ISO)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = registrationid,
                BiometricXml = template,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Format = format,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.Update(biometricRequest);
            if (matchingResponse != null)
            {
                if (matchingResponse.OperationName.Equals(EnumOperationName.Register) && matchingResponse.OperationResult.Equals(CloudABISConstant.SUCCESS)) return "Update Biometric Success!";
                else return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            }
            else return "Something went wrong!";
        }

        /// <summary>
        /// Identify biometric
        /// </summary>
        /// <param name="template">Templte or image</param>
        /// <param name="token"></param>
        /// <param name="format">Format value needs only for FingerPrint operation</param>
        public string Identify(string template, string token, string format = CloudABISConstant.CLOUDABIS_ISO)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                BiometricXml = template,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Format = format,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.Identify(biometricRequest);
            if (matchingResponse != null)
            {
                if (matchingResponse.OperationName.Equals(EnumOperationName.Identify) && matchingResponse.OperationResult.Equals(CloudABISConstant.MATCH_FOUND))
                {
                    return (CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult) + ": " + matchingResponse.BestResult.ID);
                }
                else return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);

            }
            else return "Something went wrong!";
        }
        /// <summary>
        /// Verify existing employee/person biometric data
        /// </summary>
        /// <param name="template">Templte or image</param>
        /// <param name="verifyID"></param>
        /// <param name="token"></param>
        /// <param name="format">Format value needs only for FingerPrint operation</param>
        public string Verify(string template, string verifyID, string token, string format = CloudABISConstant.CLOUDABIS_ISO)
        {
            CloudABISBiometricRequest biometricRequest = new CloudABISBiometricRequest
            {
                RegistrationID = verifyID,
                BiometricXml = template,
                CustomerKey = _customerKey,
                EngineName = _engineName,
                Format = format,
                Token = token
            };
            CloudABISAPI cloudABISAPI = new CloudABISAPI(_appkey, _secretKey, _apiBaseUrl);
            CloudABISResponse matchingResponse = cloudABISAPI.Verify(biometricRequest);
            if (matchingResponse != null)
                return CloudABISResponseParser.GetResponseMessage(matchingResponse.OperationResult);
            else return "Something went wrong!";
        }
        #endregion
    }
}