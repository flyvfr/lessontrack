<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edituser.aspx.cs" Inherits="lessonweb.web.PGEditUser" %>
<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>LessonTrack User</title>

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
                    <a class="navbar-brand" href="#"><%= mEditingUser.GetFullName()%></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p><%= mUser.GetFullName()%></p>
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
                                        <label for="Email" class="control-label col-sm-3">Email</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Email" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                        </div>
                                        <label for="Password" class="control-label col-sm-3">Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Password" type="password" runat="server" class="form-control" autocomplete="off" placeholder="Password required"></asp:TextBox>
                                        </div>
                                        <%}%>

                                        <label for="FName" class="control-label col-sm-3">First Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="FName" runat="server" class="form-control" autocomplete="off" placeholder="First Name"></asp:TextBox>
                                        </div>
                                        <label for="LName" class="control-label col-sm-3">Last Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="LName" runat="server" class="form-control" autocomplete="off" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                        <label for="MI" class="control-label col-sm-3">MI</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="MI" runat="server" class="form-control" autocomplete="off" placeholder="MI"></asp:TextBox>
                                        </div>
                                        <label for="Employer" class="control-label col-sm-3">Employer</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="Employer" runat="server" class="form-control" autocomplete="off" placeholder="Employer"></asp:TextBox>
                                        </div>
                                        <label for="DOB" class="control-label col-sm-3">DOB</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="DOB" runat="server" class="form-control" autocomplete="off" placeholder="Date of Birth"></asp:TextBox>
                                        </div>

                                        <label for="ListGender" class="control-label col-sm-3">Gender</label>
                                        <div class="col-sm-8">
                                            <asp:RadioButtonList ID="ListGender" runat="server" class="form-control" RepeatDirection="Horizontal">
                                                <asp:ListItem class="label">Male</asp:ListItem>
                                                <asp:ListItem class="label">Female</asp:ListItem>
                                                <asp:ListItem class="label">Unspecified</asp:ListItem>
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
                                <p><strong>Address</strong></p>
                                <div class="form-group">
                                    <label for="Address1" class="control-label col-sm-3">Line 1</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="Address1" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
                                    </div>
                                    <label for="Address2" class="control-label col-sm-3">Line 2</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="Address2" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
                                    </div>
                                    <label for="Address3" class="control-label col-sm-3">Line 3</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="Address3" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
                                    </div>
                                    <label for="City" class="control-label col-sm-3">City</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="City" runat="server" class="form-control" autocomplete="off" placeholder="City"></asp:TextBox>
                                    </div>
                                    <label for="State" class="control-label col-sm-3">State</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="State" runat="server" class="form-control" autocomplete="off" placeholder="State"></asp:TextBox>
                                    </div>
                                    <label for="ZIP" class="control-label col-sm-3">ZIP</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="ZIP" runat="server" class="form-control" autocomplete="off" placeholder="ZIP"></asp:TextBox>
                                    </div>
                                    <label for="Country" class="control-label col-sm-3">Country</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="Country" runat="server" class="form-control" autocomplete="off" placeholder="Country"></asp:TextBox>
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
                                <p><strong>Phones</strong></p>
                                <div class="form-group">
                                    <label for="CellPhone" class="control-label col-sm-3">Mobile</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="CellPhone" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
                                    </div>
                                    <label for="WorkPhone" class="control-label col-sm-3">Work</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="WorkPhone" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
                                    </div>
                                    <label for="HomePhone" class="control-label col-sm-3">Home</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="HomePhone" runat="server" class="form-control" autocomplete="off" placeholder=""></asp:TextBox>
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
                                    <label for="IsAdmin" class="control-label col-sm-3">Roles</label>
                                    <div class="col-sm-9 ">
                                        <asp:CheckBox ID="IsAdmin" CssClass="checkbox has-error" runat="server" Text="Administrator"/>
                                        <asp:CheckBox ID="IsStudent" CssClass="checkbox has-success" runat="server" Text="Student"/>
                                        <asp:CheckBox ID="IsInstructor" CssClass="checkbox has-warning" runat="server" Text="Instructor"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <% if (NewType == null)
                    { %>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="content">
                                <p><strong>Password Update</strong></p>
                                <div class="form-group">
                                        <label for="PasswordChange" class="control-label col-sm-3">Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="PasswordChange" type="password" runat="server" class="form-control" autocomplete="off" placeholder="Leave empty to keep old password"></asp:TextBox>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>

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
