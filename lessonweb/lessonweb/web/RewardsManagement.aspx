<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RewardsManagement.aspx.cs" Inherits="lessonweb.web.PGStudents" %>

<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Reward Manager</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet" />
    <link href="../assets/css/jquery.dataTable.min.css" rel="stylesheet" />
    <link href="../assets/css/select.dataTables.min.css" rel="stylesheet" />
    <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" />
    <link href="../assets/css/lessonweb.css" rel="stylesheet" />
    <link href="../assets/css/boot-checklist.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

    <style type="text/css">
        #editTaskForm .has-error .control-label,
        #editTaskForm .has-error .help-block,
        #editTaskForm .has-error .form-control-feedback {
            color: #f39c12;
        }

        #editTaskForm .has-success .control-label,
        #editTaskForm .has-success .help-block,
        #editTaskForm .has-success .form-control-feedback {
            color: #18bc9c;
        }
        #TableRewards {
        width: 100% !Important;
        }
        #TableAchievements {
        width: 100% !Important;
        }
        #TableTasks{
        width: 100% !Important;
        }
        #TablePilotClass{
        width: 100% !Important;
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
                    <a href="http://www.atomichelicopters.com" class="simple-text">Atomic Helicopters
                    </a>
                </div>

                <ul class="nav">
                    <%if (mUser.IsRestrictedUser())
                        {%>
                    <li>
                        <a href="showuser.aspx?uid=<%=mUser.UserEmail %>">
                            <i class="ti-user"></i>
                            <p>Home</p>
                        </a>
                    </li>
                    <%}
                        else
                        { %>
                    <li>
                        <a href="dashboard.aspx">
                            <i class="ti-panel"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
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
                        <hr />
                    </li>
                    <li>
                        <a href="rewardshome.aspx?uid=<%=mUser.UserEmail %>">
                            <i class="ti-user"></i>
                            <p>Rewards</p>
                        </a>
                    </li>
                    <%if (!mUser.IsRestrictedUser())
                        {%>
                    <li class="active">
                        <a href="RewardsManagement.aspx">
                            <i class="ti-user"></i>
                            <p>Manage Rewards</p>
                        </a>
                    </li>
                    <%} %>
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
                            <a class="navbar-brand" href="#">Manage Rewards</a>
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
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tasks">Tasks</a></li>
                        <li><a data-toggle="tab" href="#achievements">Achievements</a></li>
                        <li><a data-toggle="tab" href="#rewards">Rewards</a></li>
                        <li><a data-toggle="tab" href="#classes">Pilot Classes</a></li>
                    </ul>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="content">
                                    <div class="tab-content">
                                        <div id="tasks" class="tab-pane fade in active">
                                            <table class="table table-condensed table-hover" id="TableTasks">
                                                <thead>
                                                    <tr class="active">
                                                        <th>Task Name</th>
                                                        <th>Task Type</th>
                                                        <th>Details</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <!--
                                                <tbody>
                                                    <%
                                                        var Tasks = TaskDefinition.getAllTaskDefinitions();
                                                        foreach (TaskDefinition tsk in Tasks)
                                                        {
                                                    %>
                                                    <tr>
                                                        <td><a href="#" data-toggle="modal" data-target="#editTask" data-taskid="<%:tsk.TaskID %>"
                                                            data-title="View Task"
                                                            data-nosave="1"
                                                            data-tasktype="<%:tsk.TaskType %>"
                                                            data-description="<%:tsk.TaskDescription %>"
                                                            data-taskname="<%:tsk.TaskName %>"
                                                            data-actype="<%:tsk.AircraftType %>"
                                                            data-airport="<%:tsk.Airport %>"
                                                            data-classname="<%:tsk.Course %>"
                                                            data-detail="<%:tsk.Detail %>"
                                                            data-distance="<%:tsk.Distance %>"
                                                            data-hours="<%:tsk.Hours %>"
                                                            data-iscc="<%:tsk.IsCrossCountry %>"
                                                            data-isdual="<%:tsk.IsDual %>"
                                                            data-isnight="<%:tsk.IsNight %>"
                                                            data-ispassenger="<%:tsk.IsWithPassenger %>"
                                                            data-lessonname="<%:tsk.Lesson %>"
                                                            data-maneuver="<%:tsk.Maneuver %>"
                                                            data-tailno="<%:tsk.TailNo %>"><%:tsk.TaskName %>></a></td>
                                                        <td><%:tsk.GetTaskTypeName() %></td>
                                                        <td><%:tsk.GetTaskDetail()%></td>
                                                        <td><a href="#" class="ti-pencil" data-toggle="modal" data-target="#editTask" data-taskid="<%:tsk.TaskID %>" style="margin-right: 10px; outline: none"
                                                            data-title="Edit Task"
                                                            data-tasktype="<%:tsk.TaskType %>"
                                                            data-description="<%:tsk.TaskDescription %>"
                                                            data-taskname="<%:tsk.TaskName %>"
                                                            data-actype="<%:tsk.AircraftType %>"
                                                            data-airport="<%:tsk.Airport %>"
                                                            data-classname="<%:tsk.Course %>"
                                                            data-detail="<%:tsk.Detail %>"
                                                            data-distance="<%:tsk.Distance %>"
                                                            data-hours="<%:tsk.Hours %>"
                                                            data-iscc="<%:tsk.IsCrossCountry %>"
                                                            data-isdual="<%:tsk.IsDual %>"
                                                            data-isnight="<%:tsk.IsNight %>"
                                                            data-ispassenger="<%:tsk.IsWithPassenger %>"
                                                            data-lessonname="<%:tsk.Lesson %>"
                                                            data-maneuver="<%:tsk.Maneuver %>"
                                                            data-tailno="<%:tsk.TailNo %>" ></a>
                                                            <a href="#" class="ti-trash" data-toggle="modal" data-target="#deleteTask" data-taskid="<%:tsk.TaskID %>" data-taskname="<%:tsk.TaskName%>" style="outline: none" ></a></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>-->
                                            </table>
                                        </div> 
                                        <!-- START ACHIEVEMENT TAB -->
                                        <div id="achievements" class="tab-pane fade in">
                                            <table class="table table-condensed table-hover" id="TableAchievements">
                                                <thead>
                                                    <tr class="active">
                                                        <th>Achievement Name</th>
                                                        <th>Tasks</th>
                                                        <th>Prerequisites</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>

                                        <!-- START Rewards TAB -->
                                        <div id="rewards" class="tab-pane fade in">
                                            <table class="table table-condensed table-hover" id="TableRewards">
                                                <thead>
                                                    <tr class="active">
                                                        <th>Reward</th>
                                                        <th>Reward Type</th>
                                                        <th>Details</th>
                                                        <th>Prerequisites</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <!-- START Pilot Classes TAB -->
                                        <div id="classes" class="tab-pane fade in">
                                            <table class="table table-condensed table-hover" id="TablePilotClass">
                                                <thead>
                                                    <tr class="active">
                                                        <th>Pilot Class</th>
                                                        <th>Prerequisites</th>
                                                        <th>Details</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>

                                    </div>
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

    <!-- Dialog box for editing or new Task -->
    <div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="editTaskLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editTaskLabel">New Task</h4>
                </div>
                <div class="modal-body">
                    <div class="card">
                        <div class="content">
                            <form id="editTaskForm" method="post" action="savetask.ashx">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Task Type</label>
                                            <select class="form-control border-input selectpicker" id="ChooseTaskType" name="tasktype">
                                                <option value="0">Choose a Task Type</option>
                                                <% Dictionary<int, String> Types = TaskDefinition.GetTaskTypeCodes();
                                                    foreach (int code in Types.Keys)
                                                    {%>
                                                <option value="<%=code%>"><%=Types[code] %></option>
                                                <%} %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group" id="grp_taskname">
                                            <label class="control-label ">Task Name</label>
                                            <input type="text" class="form-control border-input" id="taskname" placeholder="Task Name" name="taskname">
                                            <input type="text" hidden class="form-control hidden" id="taskid" name="taskid">
                                        </div>
                                    </div>
                                </div>

                                <div class="flighthoursrow row" hidden>
                                    <div class="col-md-5">
                                        <div class="form-group" id="grp_actype">
                                            <label>Aircraft Type</label>
                                            <select class="form-control border-input acpicker" id="ChooseAC" name="ChooseAC">
                                                <option value="">Choose an Aircraft</option>
                                                <option value="S300">S-300</option>
                                                <option value="R22">R-22</option>
                                                <option value="R44">R-44</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="form-group" id="grp_hours">
                                            <label>Hours</label>
                                            <input type="number" id="Hours" class="form-control border-input input-sm danger" name="hours">
                                        </div>
                                    </div>
                                </div>

                                <div class="row classrow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_classname">
                                            <label>Class Name</label>
                                            <input type="text" class="form-control border-input" id="classname" placeholder="Enter the Class Name" name="classname">
                                        </div>
                                    </div>
                                </div>
                                <div class="row lessonrow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_lessonname">
                                            <label>Lesson Name</label>
                                            <input type="text" class="form-control border-input" id="lessonname" placeholder="Enter the Lesson Name" name="lessonname">
                                        </div>
                                    </div>
                                </div>
                                <div class="row maneuverrow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_manuever">
                                            <label>Maneuver Name</label>
                                            <input type="text" class="form-control border-input" id="maneuver" placeholder="Enter the Maneuver to be done" name="maneuver">
                                        </div>
                                    </div>
                                </div>
                                <div class="row airportrow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_airport">
                                            <label>Airport Code</label>
                                            <input type="text" class="form-control border-input" id="airport" placeholder="Enter the Airport Code" name="airport">
                                        </div>
                                    </div>
                                </div>
                                <div class="row destinationrow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_destination">
                                            <label>Name of destination</label>
                                            <input type="text" class="form-control border-input" id="destination" placeholder="Enter the Off-Airport Destination Name" name="destination">
                                        </div>
                                    </div>
                                </div>
                                <div class="row pinnaclerow" hidden>
                                    <div class="col-md-12">
                                        <div class="form-group" id="grp_pinnacle">
                                            <label>Name of pinnacle</label>
                                            <input type="text" class="form-control border-input" id="pinnacle" placeholder="Enter the pinnacle name" name="pinnacle">
                                        </div>
                                    </div>
                                </div>
                                <div class="row descriptionrow">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea rows="5" class="form-control border-input" id="description" placeholder="Description of task" name="description"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button id="btnclosetask" type="button" data-dismiss="modal" class="btn btn-default btn-fill btn-wd pull-left">Close</button>
                                    <button id="btnsavetask" type="button" onclick="OnSubmitTask()" class="btn btn-info btn-fill btn-wd pull-right">Save Task</button>
                                </div>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Save Changes</button>
                </div>
                -->
            </div>
        </div>
    </div>


    <!-- Dialog box for deleting Task -->
    <div class="modal fade" id="deleteTask" tabindex="-1" role="dialog" aria-labelledby="deleteTaskLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="deleteTaskLabel">Delete this ?</h4>
                </div>
                <div class="modal-body">
                    <div class="content">
                        <p>Are you sure you wish to delete this task ?</p>
                        <p class="text-danger" id="TaskName">TaskName</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="doDeleteTask()">Yes, Delete</button>
                </div>
            </div>
        </div>
    </div>

<!--#include file="editachievements.html" -->
<!--#include file="editrewards.html" -->
<!--#include file="editpilotclasses.html" -->


<!--   Core JS Files   -->
<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery.dataTable.min.js"></script>
<script src="../assets/js/dataTables.select.min.js"></script>
<script src="../assets/js/dataTables.buttons.min.js"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<script src="../assets/js/boot-checklist.js"></script>
<script src="../assets/js/RewardsManagement.js"></script>
<script src="../assets/js/AchievementsManagement.js"></script>
<script src="../assets/js/TasksManagement.js"></script>
<script src="../assets/js/PilotClassManagement.js"></script>

</body>




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
