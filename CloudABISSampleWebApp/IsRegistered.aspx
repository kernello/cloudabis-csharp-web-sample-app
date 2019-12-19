<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IsRegistered.aspx.cs" Inherits="CloudABISSampleWebApp.IsRegistered" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>IsRegistered</title>
    <link href="Script/Style.css" rel="stylesheet" />
</head>

<body style="background-color: ButtonHighlight">
    <div class="formWrapper">
        <form id="form1" runat="server" class="commonForm">
        
            <h1 class="headline">Checking an ID already exist or not</h1>
            <label for="ID">ID:</label>
            <asp:TextBox ID="txtRegisterID" Width="272px" runat="server"></asp:TextBox>
            <asp:Button ID="btnIsRegistered" runat="server" Text="IsRegistered" Enabled="true" OnClick="btnIsRegistered_Click" />
            <%-- <asp:HiddenField ID="hdnBiodata" runat="server" />--%>
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
            <div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        
        </form>
    </div>
</body>
</html>
