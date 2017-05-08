<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cleanuprewards.aspx.cs" Inherits="lessonweb.web.cleanuprewards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="DoIT" runat="server" Text="WARNING! THIS WILL DELETE ALL REWARDS AND TASKS" OnClick="DoIT_Click" />
        </div>
    </form>
</body>
</html>
