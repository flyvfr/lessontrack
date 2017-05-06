<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todo.aspx.cs" Inherits="lessonweb.web.pilotapp.todo" %>

<%@ Import Namespace="lessonweb.Data" %>
<%@ Import Namespace="lessonweb.App_Code" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />
    <!-- #Include virtual="links.inc" -->
</head>
<body>
    <div data-role="page" id="todo">
        <div data-role="panel" id="navPanel" data-display="push">
            <ul data-role="listview">
                <li><a href="homepage.aspx" data-ajax="false">Home</a></li>
                <li data-theme="b">To Do</li>
                <li><a href="planner.aspx" data-ajax="false">Planner</a></li>

            </ul>
        </div>

        <div data-role="panel" id="userPanel" data-position="right" data-display="push" style="background-color:lightblue" >
            <img src="<%=Utils.GetLogoURL("Air Pilot Hat") %>" style="display:block; margin:auto" />
            <h4 style="text-align:center"><%=mUser.GetFullName() %></h4>

            <a class="ui-btn" href="logout.aspx">Log Out</a>
        </div>

        <div data-role="header" data-position="fixed">
            <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all" href="#navPanel"></a>
            <h1 class="ui-title">ToDo List</h1>
            <a class="ui-btn ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">
            <%if (TasksTodo != null && TasksTodo.Count > 0)
                {
                    foreach (TaskDefinition td in TasksTodo)
                    {%>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3><%=td.TaskName %></h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p class="task-details"><%=td.GetTaskTypeString() %></p>
                    <p class="task-notes"><%=td.TaskDescription %></p>
                    <div data-type="horizontal" data-role="controlgroup">
                        <a class="ui-btn ui-mini ui-corner-all ui-icon-delete ui-btn-icon-top" href="#" onclick="removeTaskTodo('<%=mUser.UserEmail %>', '<%=td.TaskID %>');">Discard</a>
                        <a class="ui-btn ui-mini ui-corner-all ui-icon-check ui-btn-icon-top ui-btn-b" href="DlgCompleteTask.aspx?Email=<%=mUser.UserEmail%>&Task=<%=td.TaskID%>">Mark Done</a>
                    </div>
                </div>
            </div>

            <%}
                }
                else
                {
            %>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>No items in To Do List</h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Go to the Planner, select an achievement and add its tasks to the ToDo list.</p>
                </div>
            </div>

            <%
                }
            %>
        </div>


        <div data-role="footer" data-position="fixed">
            <h4>Copyright &copy; Atomic Helicopters</h4>
        </div>
    </div>

</body>
</html>
