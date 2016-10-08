<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editaircraft.aspx.cs" Inherits="lessonweb.web.PGEditAircraft" %>
<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>LessonTrack Aircraft</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

    <style type="text/css">
        input[type="radio"]
        {
            margin: 4px 4px 4px 4px;    
        }

    </style>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.atomichelicopters.com" class="simple-text">
                    Atomic Helicopters
                </a>
            </div>

            <ul class="nav">
                 <%if (mUser.IsRestrictedUser())
                    {%>
                    <li >
                        <a href="showuser.aspx?uid=<%=mUser.UserEmail %>">
                            <i class="ti-user"></i>
                            <p>Home</p>
                        </a>
                    </li>
                <%}
                else
                { %>
                    <li >
                        <a href="dashboard.aspx">
                            <i class="ti-panel"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li >
                        <a href="students.aspx">
                            <i class="ti-user"></i>
                            <p>Students</p>
                        </a>
                    </li>
                <%} %>
                <li >
                    <a href="instructors.aspx">
                        <i class="ti-light-bulb"></i>
                        <p>Instructors</p>
                    </a>
                </li>
                <li>
                    <a href="showcourse.aspx?certid=141-PVT">
                        <i class="ti-book"></i>
                        <p>Private Syllabus</p>
                    </a>
                </li>
                <li>
                    <a href="aircraft.aspx">
                        <i class="fa fa-plane"></i>
                        <p>Aircraft</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.aspx">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#"><%= mShip.TailNumber%></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<p><%= mUser.GetFullName()%></p>
                            </a>
                        </li>
                        <li>
                            <a href="showuser.aspx?uid=<%=mUser.UserEmail %>">
								<i class="fa fa-user"></i>
								<p>Profile</p>
                            </a>
                        </li>
						<li>
                            <a href="login.aspx">
								<i class="ti-lock"></i>
								<p>Logout</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <form id="form1" class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="content">
                                    <div class="form-group">
                                        <% if (NewType != null)
                                            { %>
                                        <label for="TailNum" class="control-label col-sm-3">Tail</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="TailNum" runat="server" class="form-control" autocomplete="off" placeholder="Tail Number"></asp:TextBox>
                                        </div>
                                        <%} %>
                                        <label for="Make" class="control-label col-sm-3">Make</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Make" runat="server" class="form-control" autocomplete="off" placeholder="Make"></asp:TextBox>
                                        </div>
                                        <label for="Model" class="control-label col-sm-3">Model</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Model" runat="server" class="form-control" autocomplete="off" placeholder="Model"></asp:TextBox>
                                        </div>
                                        <label for="Year" class="control-label col-sm-3">Year</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Year" runat="server" class="form-control" autocomplete="off" placeholder="Year"></asp:TextBox>
                                        </div>
                                    </div>
                           </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="content">
                                <div class="form-group">
                                    <label for="ListStatus" class="control-label col-sm-3">Status</label>
                                    <div class="col-sm-8" >
                                        <asp:RadioButtonList ID="ListStatus" runat="server" class="form-control" style="overflow:visible;height:140px">
                                            <asp:ListItem class="label">Unavailable</asp:ListItem>
                                            <asp:ListItem class="label">Ready</asp:ListItem>
                                            <asp:ListItem class="label">Flying</asp:ListItem>
                                            <asp:ListItem class="label">Maintenance</asp:ListItem>
                                            <asp:ListItem class="label">Reserved</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="content">
                                <div class="form-group">
                                    <div class="col-sm-11">
                                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success" text="Save" OnClick="btnSave_Click"/>
                                    <asp:Button runat="server" ID="Cancel" CssClass="btn btn-danger " text="Cancel" OnClick="Cancel_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                </form>
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="http://atomichelicopters.com">
                                Atomic Helicopters
                            </a>
                        </li>
                        <li>
                            <a href="http://atomichelicopters.com/aboutus.html">
                                About
                            </a>
                        </li>
                        <li>
                            <a href="http://atomichelicopters.com/contact.html">
                               Contact
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../assets/js/bootstrap-notify.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!--
	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            });

    	});
	</script>
        -->
</html>
