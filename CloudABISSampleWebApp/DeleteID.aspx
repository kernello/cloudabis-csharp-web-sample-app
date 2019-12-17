<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteID.aspx.cs" Inherits="CloudABISSampleWebApp.DeleteID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DeleteID</title>

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
                    <td class="auto-style5">
                        <fieldset style="width: 300px;">
                            <legend>
                                <asp:Label ID="lblDeleteID" runat="server" Text="DeleteID" Font-Size="Large"></asp:Label>
                            </legend>
                            <table cellpadding="3px" cellspacing="0">
                                <tr>
                                    <td class="auto-style6">ID
                                    </td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtDeleteID" Width="272px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">
                                        <asp:Button ID="btnDeleteID" runat="server" Text="DeleteID" Enabled="true" OnClick="btnDeleteID_Click" />
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

