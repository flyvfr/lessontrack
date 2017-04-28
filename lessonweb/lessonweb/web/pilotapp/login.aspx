<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="lessonweb.web.pilotapp.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/Content/jquery.mobile-1.4.5.min.css" />
    <script src="/Assets/js/jquery-2.2.4.min.js"></script>
    <script src="/Scripts/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
    <div data-role="page">
        <div data-role="header" data-position="fixed">
            <h1>Login to PilotWeb</h1>
        </div>
        <div data-role="content">
            <form runat="server">
                <asp:Label runat="server" Text="Email Address"></asp:Label>
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"></asp:TextBox>
                <asp:Label runat="server" Text="Password"></asp:Label>
                <asp:TextBox runat="server" ID="Password" TextMode="Password"></asp:TextBox>
                <asp:CheckBox ID="chkStay" runat="server" Text="Stay Signed In" />
                <asp:Button runat="server" Text="Login" ID="btnLogin" OnClick="btnLogin_Click" />
                <asp:Label runat="server" ForeColor="Red" Text="" ID="txtError" Visible="false"></asp:Label>
            </form>

        </div>
        <div data-role="footer" data-position="fixed">
            <h4>Copyright &copy; Atomic Helicopters</h4>
        </div>
    </div>
</body>
</html>
