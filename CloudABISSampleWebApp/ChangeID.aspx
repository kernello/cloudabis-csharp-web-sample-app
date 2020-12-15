<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeID.aspx.cs" Inherits="CloudABISSampleWebApp.ChangeID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ChangeID</title>
    <link href="Script/Style.css" rel="stylesheet" />
</head>

<body style="background-color: ButtonHighlight">
    <div class="formWrapper">
        <form id="form1" runat="server" class="commonForm changeIDForm">
            <h1 class="headline">Change ID</h1>
            <div>
                <asp:Label ID="lblChangeID" runat="server" Text="Old ID" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="txtOldID" Width="100%" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="newID">New ID</label>
                <asp:TextBox ID="txtNewID" Width="100%" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnChangeID" runat="server" Text="ChangeID" Enabled="true" OnClick="btnChangeID_Click" Width="120px" />
            </div>
            <%-- <asp:HiddenField ID="hdnBiodata" runat="server" />--%>
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="..."></asp:Label>
        </form>
    </div>
</body>
</html>
