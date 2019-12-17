<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveDevice.aspx.cs" Inherits="CloudABISSampleWebApp.ActiveDevice" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>CloudScanr Credentails
    </title>

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
    </style>
    <<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>

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

                window.location.href = "CloudABISHome.aspx";
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
                                    <td class="auto-style1">Device Name
                                    </td>
                                    <td>
                                        <select id="deviceName">
                                            <option value="Secugen">Secugen</option>
                                            <option value="TwoPrintFutronic">TwoPrintFutronic</option>
                                            <option value="TenPrintFutronic">TenPrintFutronic</option>
                                            <option value="DigitalPersona">DigitalPersona</option>
                                            <option value="TwoPrintWatsonMini">TwoPrintWatsonMini</option>
                                            <option value="TenPrintWatsonMini">TenPrintWatsonMini</option>
                                            <option value="HitachiFV">HitachiFV</option>
                                            <option value="CMitech">CMitech</option>
                                            <option value="Face">Face</option>

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Engine Name
                                    </td>
                                    <td>
                                        <select id="engineName">
                                            <option value="FPFF02">FingerPrint</option>
                                            <option value="FVHT01">FingerVein</option>
                                            <option value="IRIS01">Iris</option>
                                            <option value="FACE01">Face</option>

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Template Format
                                    </td>
                                    <td>
                                        <select id="templateFormat">
                                            <option value="ISO">ISO</option>
                                            <option value="ICS">ICS</option>
                                            <option value="ANSI">ANSI</option>
                                            <option value="FP2">FP2</option>
                                            <option value="FP1">FP1</option>
                                            <option value="M2ICS">M2ICS</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button" value="Set Active Device" onclick="setConfiguration()" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <div>

            <table cellpadding="0px" cellspacing="0px" align="center">
                <tr>

                    <td>
                        <fieldset style="width: 350px;">
                            <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
                            &nbsp;<asp:Label ID="lblMessage" runat="server" Text="..."></asp:Label>
                        </fieldset>
                    </td>

                </tr>
            </table>


        </div>

    </form>
</body>
</html>

