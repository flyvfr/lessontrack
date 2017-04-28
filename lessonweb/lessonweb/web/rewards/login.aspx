<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="lessonweb.web.rewards.login" %>

<!DOCTYPE HTML>
<html>
<head runat="server">

    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css" />
    <link rel="stylesheet" href="/Assets/nativedroid2/vendor/waves/waves.min.css" />
    <link rel="stylesheet" href="/Assets/nativedroid2/vendor/wow/animate.css" />
    <link rel="stylesheet" href="/Assets/nativedroid2/css/nativedroid2.css" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
</head>
<body>
    <div data-role="page">
        <!-- <nd2-include data-src="/Assets/nativedroid2/examples/fragments/panel.left.html"></nd2-include>
        <div data-role="panel" id="bottomsheet" data-animate="false" data-position='bottom' data-display="overlay">
            <nd2-include data-src="/Assets/nativedroid2/examples/fragments/bottom.sheet.html"></nd2-include>
        </div>-->

        <div data-role="header" data-position="fixed" class="wow fadeInDown" data-wow-delay="0.2s">
            <h1 class="wow fadeIn" data-wow-delay='0.4s' id="PageTitle">Flight Rewards</h1>
        </div>
        <div role="main" class="ui-content" id="divContent" data-inset="false">
            <form id="form1" runat="server">
                <div>
                    <div class="row start-xs">
                        <div class="col-xs-2">
                        </div>
                        <div class="col-xs-8">
                            <div>
                                <label for="inputEmail">Email Address</label>
                                <asp:TextBox TextMode="Email" name="inputEmail" id="inputEmail" runat="server" data-clear-btn="true" ></asp:TextBox>
                                <label for="inputPassword">Password</label>
                                <asp:TextBox TextMode="Password" name="inputPassword" id="inputPassword" runat="server" ></asp:TextBox>
                                <asp:CheckBox name="chkStaySignedIn" id="chkStaySignedIn"  runat="server" />
                                <label for="chkStaySignedIn">Stay signed in</label>
                                <asp:LinkButton ID="btnSignIn" runat="server" class="ui-btn ui-btn-raised clr-primary" text="Sign In"></asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-xs-2">
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <script src="/Assets/nativedroid2/vendor/waves/waves.min.js"></script>
    <script src="/Assets/nativedroid2/vendor/wow/wow.min.js"></script>
    <script src="/Assets/nativedroid2/js/nativedroid2.js"></script>
    <script src="/Assets/nativedroid2/nd2settings.js"></script>
</body>



</html>
