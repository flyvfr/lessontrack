<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="lessonweb.web.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Sign in to LessonTrack</h1>
                    <div class="account-wall">
                        <img class="profile-img" src="http://atomichelicopters.com/img/atomic_logo.png"
                            alt="">
                        <form id="form1" class="form-signin" runat="server">
                        <asp:TextBox ID="Email" runat="server" class="form-control" placeholder="Email" required autofocus></asp:TextBox>
                        <asp:TextBox ID="Password" type="password" runat="server" class="form-control" placeholder="Password" required></asp:TextBox>
                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" />
                        <label class="checkbox pull-left">
                            <asp:CheckBox ID="chkRemember" runat="server" />
                           Remember me
                        </label>
                        <a href="http://atomichelicopters.com" target="_blank" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                        </form>
                    </div>
                    <!-- <a href="#" class="text-center new-account">Create an account </a> -->
                </div>
            </div>
        </div>
</body>
</html>
