<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CloudABISSampleWebApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Register</title>
    <link rel="Stylesheet" type="text/css" href="style.css" />


    <style type="text/css">
        .auto-style1 {
            width: 157px;
        }

        .auto-style2 {
            width: 471px;
        }

        .auto-style3 {
            width: 376px;
        }

        .centerBlock {
            margin-left: auto;
            margin-right: auto;
            width: 576px;
        }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script src="Script/CloudABIS-ScanR.js"></script>
    <script src="Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>

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

            var deviceName = getCookieValue("CSDeviceName");
            var templateFormat = getCookieValue("CSTempalteFormat");
            engineName = getCookieValue("CABEngineName");
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
                    EnumSingleCaptureMode.LeftFingerCapture, 180.0, EnumCaptureOperationName.ENROLL, CaptureResult);
            else if (engineName == EnumEngines.FingerVein)
                FingerVeinCapture(deviceName, quickScan, captureType, 180.0, EnumCaptureOperationName.ENROLL, CaptureResult);
            else if (engineName == EnumEngines.Iris)
                IrisCapture(deviceName, quickScan, 180.0, EnumFeatureMode.Disable, CaptureResult);
            else if (engineName == EnumEngines.Face)
                FaceCapture(quickScan, 180.0, EnumFeatureMode.Disable, EnumFaceImageFormat.Jpeg, EnumCaptureOperationName.ENROLL, CaptureResult);
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

                if (captureResponse.BioImageData != null && captureResponse.BioImageData.length > 0) {
                    document.getElementById('templateXML').value = captureResponse.BioImageData;
                }
                else if (engineName == 'IRIS01' && captureResponse.BioImageData != null && captureResponse.BioImageData.length > 0) {
                    document.getElementById('templateXML').value = captureResponse.BioImageData;
                }
                else {
                    document.getElementById('lblTemplate').style.display = 'none';
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
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div>
            <table cellpadding="0px" cellspacing="0px" align="center">

                <tr>
                    <td class="auto-style3">
                        <fieldset style="width: 350px;">

                            <table cellpadding="3px" cellspacing="0">

                                <tr>
                                    <td class="auto-style1">CaptureType
                                    </td>
                                    <td>

                                        <select id="captureType">
                                            <option value="SingleCapture">SingleCapture</option>
                                            <option value="DoubleCapture">DoubleCapture</option>

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Registration ID
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegID" Width="276px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Current Device Name
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCurrentDeviceName" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button" value="BioMetric Capture" onclick="captureBiometric()" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text="Register" Enabled="true" OnClick="btnRegister_Click" />
                                    </td>
                                </tr>
                                <tr>

                                    <td>
                                        <fieldset style="width: 350px;">
                                            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="BtnBack_Click" />
                                            &nbsp;<asp:Label ID="serverResult" runat="server" Text="..."></asp:Label>
                                        </fieldset>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox Width="350px" ID="fileStaveStatus" runat="server" Visible="false" TextMode="MultiLine" Text="Captured Template save at">

                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="templateXML" runat="server" CssClass="pagetitleValue" Style="display: none;" TextMode="MultiLine" Text="" Height="263px" Width="663px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />

    </form>
</body>
</html>

