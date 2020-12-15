<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteID.aspx.cs" Inherits="CloudABISSampleWebApp.DeleteID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DeleteID</title>
    <link href="Script/Style.css" rel="stylesheet" />
</head>

<body style="background-color: ButtonHighlight">
    <div class="formWrapper">
        <form id="form1" runat="server" class="commonForm deleteIDForm">
            <h1 class="headline">Delete ID</h1>
            <div>
                <asp:Label ID="lblDeleteID" runat="server" Text="DeleteID" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="txtDeleteID" Width="272px" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnDeleteID" runat="server" Text="DeleteID" Enabled="true" OnClick="btnDeleteID_Click" />
            </div>
            <%-- <asp:HiddenField ID="hdnBiodata" runat="server" />--%>
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />

            <asp:Label ID="lblMessage" runat="server" Text="..."></asp:Label>        
        </form>
    </div>
</body>
</html>

