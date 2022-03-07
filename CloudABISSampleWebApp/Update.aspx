<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="CloudABISSampleWebApp.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Update</title>
    <link rel="Stylesheet" type="text/css" href="Script/Style.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script src="Script/CloudABIS-ScanR.js"></script>
    <script src="Script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Script/bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript">

        var engineName = EnumEngines.FingerPrint;
        /*
         * Biometric Capture
         */
        function captureBiometric() {
            debugger
            document.getElementById('templateXML').value = '';
            document.getElementById('templateXML').style.display = 'none';
            document.getElementById('<%= serverResult.ClientID %>').innerHTML = '';

            var deviceName = getCookieValue("CSDeviceNamev10");
            var templateFormat = getCookieValue("CSTempalteFormatv10");
            engineName = getCookieValue("CABEngineNamev10");
            document.getElementById('<%=lblCurrentDeviceName.ClientID%>').innerHTML = deviceName;

            var apiPath = "http://localhost:15896/";

            //Init CloudABIS Scanr
            CloudABISScanrInit(apiPath);
            var captureType = document.getElementById("captureType");
            captureType = captureType.options[captureType.selectedIndex].value;
            var quickScan = EnumFeatureMode.Disable;

            /*API Call*/
            if (engineName == EnumEngines.FingerPrint)
                FingerPrintCapture(deviceName, quickScan, templateFormat, captureType, EnumCaptureMode.ImageOnly, EnumBiometricImageFormat.WSQ,
                    EnumSingleCaptureMode.LeftFingerCapture, 180.0, EnumCaptureOperationName.IDENTIFY, CaptureResult);
            else if (engineName == EnumEngines.FingerVein)
                FingerVeinCapture(deviceName, quickScan, captureType, 180.0, EnumCaptureOperationName.UPDATE, CaptureResult);
            else if (engineName == EnumEngines.Iris)
                IrisCapture(deviceName, 180.0, EnumFeatureMode.Disable, CaptureResult);
            else if (engineName == EnumEngines.Face)
                FaceCapture(quickScan, 180.0, EnumFeatureMode.Disable, EnumFaceImageFormat.Jpeg, EnumCaptureOperationName.UPDATE, CaptureResult);
        }

        function getCookieValue(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        /*
         * Hnadle capture data
         */
        function CaptureResult(captureResponse) {

            debugger
            if (captureResponse.CloudScanrStatus != null && captureResponse.CloudScanrStatus.Success) {

                if (captureResponse.TemplateData != null && captureResponse.TemplateData.length > 0) {
                    document.getElementById('templateXML').value = captureResponse.TemplateData;
                }
                else if (engineName == 'IRIS01' && captureResponse.BioImageData != null && captureResponse.BioImageData.length > 0) {
                    document.getElementById('templateXML').value = captureResponse.BioImageData;
                }
                else {
                    document.getElementById('templateXML').style.display = 'none';
                }
                document.getElementById('<%= serverResult.ClientID %>').innerHTML = "Capture success. Please click on identify button";
            }
            else if (captureResponse.CloudScanrStatus != null) {
                document.getElementById('<%= serverResult.ClientID %>').innerHTML = captureResponse.CloudScanrStatus.Message;
            } else {
                document.getElementById('<%= serverResult.ClientID %>').innerHTML = captureResponse;
            }
        }

    </script>


</head>
<body style="background-color: ButtonHighlight">
    <div class="formWrapper">
        <form class="commonForm updateForm" id="form1" runat="server">
            <h1 class="headline">Update</h1>
            <div class="mt-10">
                <label>Capture Type:</label>
                <select name="captureType" id="captureType">
                    <option value="SingleCapture">Single Capture</option>
                    <option value="DoubleCapture">Double Capture</option>
                </select>
            </div>
            <div class="mt-10">
                <label for="updateID">Update ID</label>
                <asp:TextBox ID="txtUpdateID" runat="server"></asp:TextBox>
            </div>
            <div>
                <label id="lblCurrentDeviceTitle" class="currentDeviceCaption">Current Device Name:</label><asp:Label ID="lblCurrentDeviceName" runat="server" Text="..."></asp:Label>
                <input type="button" value="BioMetric Capture" onclick="captureBiometric()" />
                <asp:Button ID="btnSubmit" runat="server" Text="Update" Enabled="true" OnClick="btnUpdate_Click" Height="40px" />
                <asp:Button ID="Button1" runat="server" Text="Back" OnClick="BtnBack_Click" />
                &nbsp;<asp:Label ID="serverResult" runat="server" Text="..."></asp:Label>
            </div>
            <asp:TextBox Width="350px" ID="fileStaveStatus" runat="server" Visible="false" TextMode="MultiLine" Text="Captured Template save at"></asp:TextBox>
            <asp:TextBox ID="templateXML" runat="server" CssClass="pagetitleValue" Style="display: none;" TextMode="MultiLine" Text="" Height="263px" Width="663px"></asp:TextBox>
        </form>
    </div>
</body>
</html>