<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloudABISHome.aspx.cs" Inherits="CloudABISSampleWebApp.CloudABISHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome To CloudScanr web application</title>
    <script type="text/javascript">
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
        <div>

            <br />
            <br />
            <br />
            <br />
            <br />

            <br />
            <table cellpadding="3px" cellspacing="0" align="center">
                <tr>
                    <td class="pagetitle" style="font-size: larger"><b>Welcome To CloudABIS web application</b></td>
                </tr>

                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="lnkIsRegistered" runat="server" OnClick="lnkIsRegistered_Click">IsRegistered</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkChangeID" runat="server" OnClick="lnkChangeID_Click">ChangeID</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkDeleteID" runat="server" OnClick="lnkDeleteID_Click">DeleteID</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkRegister" runat="server" OnClick="lnkRegister_Click">Register</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkIdentify" runat="server" OnClick="lnkIdentify_Click">Identify</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkVerify" runat="server" OnClick="lnkVerify_Click">Verify</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="LinkUpdate" runat="server" OnClick="lnkUpdate_Click">Update</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="font-size: larger">
                        <asp:LinkButton ID="linkAuthenticate" runat="server" OnClick="lnkChangeActiveDevice_Click">Change Active Device</asp:LinkButton></td>
                </tr>

                <tr>
                    <td style="font-size: larger">
                        <asp:Label ID="lblStatus" runat="server" Visible="true" Text="Server Status: "></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

    </form>

</body>
</html>
