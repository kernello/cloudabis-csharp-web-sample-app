<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloudABISHome.aspx.cs" Inherits="CloudABISSampleWebApp.CloudABISHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome To CloudScanr web application</title>
    <link href="Script/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function openPopup() {
            var w = 850;
            var h = 350;

            // Fixes dual-screen position                         Most browsers      Firefox
            var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
            var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

            var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
            var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

            var left = ((width / 2) - (w / 2)) + dualScreenLeft;
            var top = ((height / 2) - (h / 2)) + dualScreenTop;
            var newWindow = window.open("ResetAccessPointIDCustomerrKey.aspx", "Reset AccessPointID & CustomerKey", 'scrollbars=no, resizable=false, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

            // Puts focus on the newWindow
            if (window.focus) {
                newWindow.focus();
            }
        }
        //<![CDATA[    
        //
    </script>
</head>
<body style="background-color: ButtonHighlight">

    <div class="container">
        <form id="form1" runat="server">
            <div class="homeContainer">
                <h1 class="headline">Welcome To CloudABIS web application</h1>
                <div><asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkIsRegistered_Click">IsRegistered</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkChangeID" runat="server" OnClick="lnkChangeID_Click">ChangeID</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkDeleteID_Click">DeleteID</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkRegister" runat="server" OnClick="lnkRegister_Click">Register</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkIdentify" runat="server" OnClick="lnkIdentify_Click">Identify</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkVerify" runat="server" OnClick="lnkVerify_Click">Verify</asp:LinkButton></div>
                <div><asp:LinkButton ID="LinkUpdate" runat="server" OnClick="lnkUpdate_Click">Update</asp:LinkButton></div>
                <div><asp:LinkButton ID="linkAuthenticate" runat="server" OnClick="lnkChangeActiveDevice_Click">Change Active Device</asp:LinkButton></div>
                <div><asp:Label ID="lblStatus" runat="server" Visible="true" Text="Server Status: "></asp:Label></div>
            </div>
        </form>
    </div>   

</body>
</html>
