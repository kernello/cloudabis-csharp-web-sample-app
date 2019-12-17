<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeID.aspx.cs" Inherits="CloudABISSampleWebApp.ChangeID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ChangeID</title>

    <style type="text/css">
        .auto-style4 {
            height: 37px;
        }

        .auto-style5 {
            width: 512px;
        }

        .auto-style6 {
            height: 37px;
            width: 281px;
        }

        .auto-style7 {
            width: 281px;
        }
    </style>
</head>

<body style="background-color: ButtonHighlight">
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table cellpadding="0px" cellspacing="0px" align="center">

                <tr>
                    <td>
                        <fieldset style="width: 300px;">
                            <legend>
                                <asp:Label ID="lblChangeID" runat="server" Text="ChangeID" Font-Size="Large"></asp:Label>
                            </legend>
                            <table cellpadding="3px" cellspacing="0" class="auto-style4">
                                <tr>
                                    <td width="120px">Old ID
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOldID" Width="260px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="120px">New ID
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNewID" Width="258px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100px">
                                        <asp:Button ID="btnChangeID" runat="server" Text="ChangeID" Enabled="true" OnClick="btnChangeID_Click" Width="120px" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <%-- <asp:HiddenField ID="hdnBiodata" runat="server" />--%>
                                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />

                                        <asp:Label ID="lblMessage" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
