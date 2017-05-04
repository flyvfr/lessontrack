<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editcourse.aspx.cs" Inherits="lessonweb.web.PGEditCourse" %>

<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>LessonTrack Edit Course</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />


    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet" />
    <link href="../assets/css/lessonweb.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

    <script>
        document.addEventListener('keypress', function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
        }
    });
</script>

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
                    <a href="http://www.atomichelicopters.com" class="simple-text">Atomic Helicopters
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
                    <li>
                        <a href="instructors.aspx">
                            <i class="ti-light-bulb"></i>
                            <p>Instructors</p>
                        </a>
                    </li>
                    <li class="active">
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
                <form id="form1" method="post" action="updatecourse.aspx?certid=<%=mCourse.CertificationID %>&student=<%=mStudent.UserEmail %>"> 
                <input type="hidden" name="selections" />
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
                                <a class="navbar-brand" href="#"><%= mStudent.GetFullName()%></a>
                                <input type="submit" ID="btnSave" class="btn btn-success" value="Save"/>
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
                                    <a href="logout.aspx">
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
                                                <%=s.Name %></a>
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
                                                                <!-- TIMES BLOCK -->
                                                                <div class="panel-group col-sm-8" id="timesacc">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading">
                                                                            <h4 class="panel-title <%=(less.IsTimesComplete?"text-success":(less.IsTimesStarted?"text-primary":"text-danger")) %>">
                                                                                <a data-toggle="collapse" data-parent="#timesacc" href="#collapseTimes<%=s.STAGEID%><%=less.LESSONID %>">
                                                                                    <%if (less.IsAllComplete)
                                                                                        {%><i class="fa fa-check"></i><%} %>
                                                                                    Time Log
                                                                                    <%if (less.IsAllStarted && !less.IsTimesComplete)
                                                                                        {%><i class="fa fa-clock-o"></i><%} %>
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseTimes<%=s.STAGEID%><%=less.LESSONID %>" class="panel-collapse collapse">
                                                                            <div class="panel-body nopadding">
                                                                                <table class="table table-condensed">
                                                                                    <thead class="header">
                                                                                        <tr>
                                                                                            <th>Time</th>
                                                                                            <th>Required</th>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <th>Total so far</th>
                                                                                            <th>Remaining</th>
                                                                                            <th>New Total</th>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                    </thead>

                                                                                    <tbody>
                                                                                        <%if (less.briefing>0) { %>
                                                                                        <tr>
                                                                                            <td>Briefing</td> 
                                                                                            <td><%=less.briefing%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedbriefing%></td>
                                                                                            <td><%=(less.briefing - less.Loggedbriefing) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.briefing%>" class="form-control" name="TIMELOG-briefing-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.classvideo>0) { %>
                                                                                        <tr>
                                                                                            <td>Classes and Video</td> 
                                                                                            <td><%=less.classvideo%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedclassvideo%></td>
                                                                                            <td><%=(less.classvideo - less.Loggedclassvideo) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.classvideo%>" class="form-control" name="TIMELOG-classvideo-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.exams>0) { %>
                                                                                        <tr>
                                                                                            <td>Exams</td> 
                                                                                            <td><%=less.exams%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedexams%></td>
                                                                                            <td><%=(less.exams - less.Loggedexams) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.exams%>" class="form-control" name="TIMELOG-exams-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.debrief>0) { %>
                                                                                        <tr>
                                                                                            <td>Test Debriefing</td> 
                                                                                            <td><%=less.debrief%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggeddebrief%></td>
                                                                                            <td><%=(less.debrief - less.Loggeddebrief) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.debrief%>" class="form-control" name="TIMELOG-debrief-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.duallocalday>0) { %>
                                                                                        <tr>
                                                                                            <td>Dual Local Day</td> 
                                                                                            <td><%=less.duallocalday %></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedduallocalday %></td>
                                                                                            <td><%=(less.duallocalday - less.Loggedduallocalday) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.duallocalday%>" class="form-control" name="TIMELOG-duallocalday-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.dualccday>0) { %>
                                                                                        <tr>
                                                                                            <td>Dual Day Cross Country</td> 
                                                                                            <td><%=less.dualccday%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggeddualccday%></td>
                                                                                            <td><%=(less.dualccday - less.Loggeddualccday) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.dualccday%>" class="form-control" name="TIMELOG-dualccday-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.duallocalnight>0) { %>
                                                                                        <tr>
                                                                                            <td>Dual Night Local</td> 
                                                                                            <td><%=less.duallocalnight %></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedduallocalnight%></td>
                                                                                            <td><%=(less.duallocalnight - less.Loggedduallocalnight) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.duallocalnight%>" class="form-control" name="TIMELOG-duallocalnight-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.dualccnight>0) { %>
                                                                                        <tr>
                                                                                            <td>Dual Night Cross Country</td> 
                                                                                            <td><%=less.dualccnight%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggeddualccnight%></td>
                                                                                            <td><%=(less.dualccnight - less.Loggeddualccnight) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.dualccnight%>" class="form-control" name="TIMELOG-dualccnight-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.sololocalday>0) { %>
                                                                                        <tr>
                                                                                            <td>Solo Local Day</td> 
                                                                                            <td><%=less.sololocalday%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedsololocalday%></td>
                                                                                            <td><%=(less.sololocalday - less.Loggedsololocalday) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.sololocalday%>" class="form-control" name="TIMELOG-sololocalday-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>
                                                                                        <%if (less.soloccday>0) { %>
                                                                                        <tr>
                                                                                            <td>Solo Day Cross Country</td> 
                                                                                            <td><%=less.soloccday%></td>
                                                                                            <%if (mStudent != null)
                                                                                                {%>
                                                                                            <td><%=less.Loggedsoloccday%></td>
                                                                                            <td><%=(less.soloccday - less.Loggedsoloccday) %></td>
                                                                                            <td><input type="number" step="0.1" min="0.0" max="<%=less.soloccday%>" class="form-control" name="TIMELOG-soloccday-<%=less.LESSONID%>-<%=less.STAGEID%>" /></td>
                                                                                            <%} %>
                                                                                        </tr>
                                                                                        <%} %>

                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>    
                                                                </div>
                                                                <!-- END TIMES BLOCK -->
                                                                <div class="panel-body col-sm-12">
                                                                    <%foreach (LESSONITEM li in less.LessonItems)
                                                                        { %>
                                                                    <%if (li.IsGroup)
                                                                        {%>
                                                                    <p><strong><%=li.ItemName %></strong></p>
                                                                    <%}
                                                                    else
                                                                    { %>
                                                                    <div class="checkbox"  >
                                                                      <label class="<%=(li.IsComplete?"text-success":"text-danger")%>"> <!-- onclick="onitemchecked()" --> <input type="checkbox" name="CHK-<%=li.LESSONGUID%>" class="success" <%=(li.IsComplete?"checked":"")%> > <%=li.ItemName %></label>
                                                                    </div>
     
                                                                    <%} %>
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
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>

                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>

                                <li>
                                    <a href="http://atomichelicopters.com">Atomic Helicopters
                                    </a>
                                </li>
                                <li>
                                    <a href="http://atomichelicopters.com/aboutus.html">About
                                    </a>
                                </li>
                                <li>
                                    <a href="http://atomichelicopters.com/contact.html">Contact
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright pull-right">
                            &copy;
                            <script>document.write(new Date().getFullYear())</script>
                            , made with <i class="fa fa-heart heart"></i>by <a href="http://www.creative-tim.com">Creative Tim</a>
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
