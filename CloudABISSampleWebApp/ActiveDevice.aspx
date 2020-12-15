<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveDevice.aspx.cs" Inherits="CloudABISSampleWebApp.ActiveDevice" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>CloudScanr Credentails</title>
    <link rel="Stylesheet" type="text/css" href="Script/Style.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function setConfiguration() {
            var engineName = document.getElementById("engineName");
            engineName = engineName.options[engineName.selectedIndex].value;
            var templateFormat = document.getElementById("templateFormat");
            templateFormat = templateFormat.options[templateFormat.selectedIndex].value;

            var deviceName = document.getElementById("deviceName");
            deviceName = deviceName.options[deviceName.selectedIndex].value;

            if (engineName != '') {
                //set credentials in cookey or any others client storage or get your storage
                setCookie("CSDeviceName", deviceName, 7);
                setCookie("CABEngineName", engineName, 7);
                setCookie("CSTempalteFormat", templateFormat, 7);

                //window.location.href = "CloudABISHome.aspx";
                window.open("CloudABISHome.aspx","_self");
            } else {
                failCall("Please put required values.");
            }
        }

        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }

        function failCall(status) {
            document.getElementById('lblMessage').innerHTML = status;
        }
    </script>

</head>
<body style="background-color: ButtonHighlight">
    <div class="formWrapper">
        <form id="form1" runat="server">
            <div class="iholder">
                <h1 class="headline">Active Device</h1>
                <label for="deviceName">Device Name</label>
                <select id="deviceName">
                    <option value="Secugen">Secugen</option>
                    <option value="TwoPrintFutronic">TwoPrintFutronic</option>
                    <option value="TenPrintFutronic">TenPrintFutronic</option>
                    <option value="DigitalPersona">DigitalPersona</option>
                    <option value="TwoPrintWatsonMini">TwoPrintWatsonMini</option>
                    <option value="TenPrintWatsonMini">TenPrintWatsonMini</option>
                    <option value="HitachiFV">HitachiFV</option>
                    <option value="EMX30">EMX30</option>
                    <option value="Face">Face</option>
                    <option value="TD100">TD100</option>
                    <option value="EF45">EF45</option>
                </select>
                <label for="engineName">Engine Name</label>
                <select id="engineName">
                    <option value="FPFF02">FingerPrint</option>
                    <option value="FVHT01">FingerVein</option>
                    <option value="IRIS01">Iris</option>
                    <option value="FACE01">Face</option>
                </select>
                <label for="templateFormat">Template Format</label>
                <select id="templateFormat">
                    <option value="ISO">ISO</option>
                    <option value="ICS">ICS</option>
                    <option value="ANSI">ANSI</option>
                    <option value="FP2">FP2</option>
                    <option value="FP1">FP1</option>
                    <option value="M2ICS">M2ICS</option>
                </select>
                <input type="button" value="Set Active Device" onclick="setConfiguration()" />
                <asp:Button ID="Button1" runat="server" Text="Back" OnClick="BtnBack_Click" />
                <label id="lblMessage"></label>
            </div>
        </form>
    </div>
</body>
</html>

