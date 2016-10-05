<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showcourse.aspx.cs" Inherits="lessonweb.web.PGShowCourse" %>
<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>LessonTrack Course</title>

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
                    <div>

                    <%if (mStudent != null)
                        { %>
                        <a class="navbar-brand" href="showuser.aspx?uid=<%=mStudent.UserEmail %>"><%= mStudent.GetFullName()%></a>
                        <button type="button" class="btn btn-success" onClick="window.open('printprogress.aspx?certid=<%=mCourse.CertificationID %>&student=<%=mStudent.UserEmail %>')">Print...</button>
                        <button type="button" class="btn btn-success" onClick="parent.location='editcourse.aspx?certid=<%=mCourse.CertificationID %>&student=<%=mStudent.UserEmail %>'">Update Progress</button>
                        <%}else{ %>
                        <a class="navbar-brand" href="#"><%= mCourse.CertificationName%></a>
                        <%} %>
                    </div>

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
                <div class="row">
                    <div class="col-sm-12">

                        <div class="panel-group" id="stageacc">
                        <%foreach (STAGE s in mCourse.mStages)
                            { %>
                                <div class="panel panel-default">
                                    <div class="panel-heading active ">
                                        <h4 class="panel-title <%=(s.IsComplete?"text-success":(s.IsStarted?"text-primary":"text-danger")) %>">
                                            
                                            <a data-toggle="collapse" data-parent="#stageacc" href="#collapse<%=s.STAGEID %>">
                                                <%if (s.IsComplete)
                                                    {%><i class="fa fa-check"></i><%} %>
                                                <%if (s.Type.ToLower().Equals("ground")){%>
                                                GROUND <%=s.Name %>
                                                <%} else { %>
                                                FLIGHT  <%=s.Name %>
                                                <%} %>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse<%=s.STAGEID %>" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="panel-group" id="lessonacc">
                                                <%foreach (LESSON less in s.Lessons)
                                                    { %>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title <%=(less.IsComplete?"text-success":(less.IsStarted?"text-primary":"text-danger")) %>">
                                                            <a data-toggle="collapse" data-parent="#lessonacc" href="#collapse<%=s.STAGEID%><%=less.LESSONID %>">
                                                                <%if (less.IsComplete)
                                                                    {%><i class="fa fa-check"></i><%} %>
                                                                <%=less.Title%>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapse<%=s.STAGEID%><%=less.LESSONID %>" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <%foreach (LESSONITEM li in less.LessonItems)
                                                                { %>
                                                                <%if (li.IsGroup)
                                                                    {%>
                                                                    <p><strong><%=li.ItemName %></strong></p>
                                                                <%} else { %>
                                                                <p class="<%=(li.IsComplete?"text-success":"text-danger") %>">
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <%if (li.IsComplete)
                                                                    {%><i class="fa fa-check"></i><%} %><%=li.ItemName %></p>
                                                                <%} %>
                                                            <%} %>

                                                        </div>
                                                    </div>
                                                </div>    
                                                <%} %>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <%} %>
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
