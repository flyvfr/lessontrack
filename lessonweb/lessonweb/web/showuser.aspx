<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showuser.aspx.cs" Inherits="lessonweb.web.PGShowUser" %>
<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>LessonTrack Student</title>

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

</head>
<body>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title">Delete User ?</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete this user ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onClick="parent.location='deleteuser.aspx?uid=<%=mShownUser.UserEmail %>'">Delete</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

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
                    <div>
                        <a class="navbar-brand" href="#"><%= mShownUser.GetFullName()%></a>
                        <%if (mUser.IsRestrictedUser() && (mUser.UserEmail == mShownUser.UserEmail))
                            { %>
                            <button type="button" class="btn btn-success" onClick="parent.location='showcourse.aspx?certid=141-PVT&student=<%=mShownUser.UserEmail %>'">View Progress</button>
                            <!--<a href="showcourse.aspx?certid=141-PVT&student=<%=mShownUser.UserEmail %>">Show Progress</a>
                            <a href="editcourse.aspx?certid=141-PVT&student=<%=mShownUser.UserEmail %>">Update Progress</a> -->
                        <%}
                        else if (!mUser.IsRestrictedUser())
                        { %>
                            <button type="button" class="btn btn-success" onClick="parent.location='showcourse.aspx?certid=141-PVT&student=<%=mShownUser.UserEmail %>'">View Progress</button>
                            <button type="button" class="btn btn-success" onClick="parent.location='editcourse.aspx?certid=141-PVT&student=<%=mShownUser.UserEmail %>'">Update Progress</button>
                        <%} %>
                    </div>
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
                <div class="row">
                    <div class="col-sm-8">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-user"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-8">
                                        <div>
                                            <p><strong><%=mShownUser.GetFullName() %></strong></p>
                                            <p class="text-warning"><%=mShownUser.UserEmail %></p>
                                            <%if (!String.IsNullOrEmpty(mShownUser.CellPhone))
                                                {%>
                                                <p><%=mShownUser.CellPhone %> (cell)</p>
                                            <%} %>

                                            <%if (!String.IsNullOrEmpty(mShownUser.HomePhone))
                                                {%>
                                                <p><%=mShownUser.HomePhone %> (home)</p>
                                            <%} %>

                                            <%if (!String.IsNullOrEmpty(mShownUser.WorkPhone))
                                                {%>
                                                <p><%=mShownUser.WorkPhone %> (work)</p>
                                            <%} %>

                                        </div>
                                    </div>
                                </div>
                                <%if (!mUser.IsRestrictedUser())
                                 { %>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                            <a href="edituser.aspx?uid=<%=mShownUser.UserEmail %>">
                                            <i class="fa fa-2x fa-pencil-square"></i> </a> &nbsp;&nbsp;&nbsp;
                                    <%if (mUser.IsAdmin)
                                    { %>

                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-2x fa-trash"></i> </a> &nbsp;&nbsp;&nbsp;
                                    <%} %>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
            </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="card">
                            <div class="content">
                                <p><strong>Address</strong></p>
                                <p><%=mShownUser.Address1 %></p>
                                <p><%=mShownUser.Address2 %></p>
                                <p><%=mShownUser.Address3 %></p>
                                <p><%=mShownUser.City %></p>
                                <p><%=mShownUser.State %></p>
                                <p><%=mShownUser.ZIP %></p>
                                <p><%=mShownUser.Country%></p>
                                <br />
                                <%if (mShownUser.DOB != null)
                                    {%>
                                    <p><strong>Date Of Birth</strong></p>
                                    <p><%=mShownUser.DOB%></p>
                                <%} %>
                                <br />

                                <%if (!String.IsNullOrEmpty(mShownUser.Employer))
                                    {%>
                                    <p><strong>Employer</strong></p>
                                    <p><%=mShownUser.Employer%></p>
                                <%} %>
                            </div>
                        </div>
                    </div>
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
