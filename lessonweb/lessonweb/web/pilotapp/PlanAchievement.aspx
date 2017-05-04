<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAchievement.aspx.cs" Inherits="lessonweb.web.pilotapp.PlanAchievement" %>

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
    <div data-role="page" id="homepage">
        <div data-role="panel" id="navPanel" data-display="push">
            <ul data-role="listview">
                <li><a href="homepage.aspx" data-ajax="false">Home</a></li>
                <li><a href="todo.aspx"  data-ajax="false">To Do</a></li>
                <li><a href="planner.aspx" data-ajax="false">Planner</a></li>
                <li data-theme="b">Plan</li>
                <li><a href="levels.aspx"  data-ajax="false">Pilot Levels</a></li>
                <li><a href="rewards.aspx"  data-ajax="false">Rewards</a></li>
                <li><a href="achievements.aspx"  data-ajax="false">Achievements</a></li>
                <li><a href="tasks.aspx"  data-ajax="false">Tasks</a></li>
            </ul>
        </div>

        <div data-role="panel" id="userPanel" data-position="right" data-display="push">
        </div>

        <div data-role="header" data-position="fixed">
            <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all" href="#navPanel"></a>
            <h1 class="ui-title">Planner</h1>
            <a class="ui-btn ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">

            <div class="ui-corner-all custom-corners">
                <div data-role="collapsible">
                    <h4>How this works</h4>
                    <p>Listed below are tasks you need to complete.</p>
                    <p>The ones with a + sign are not started yet. Tap them to add them to your TODO list.</p>
                    <p>Once you add tasks to TODO, you can view and mark them complete in the ToDo screen </p>
                    <p>Once all tasks are moved to ToDo and completed, you reach your achievement goal.</p>
                </div>

                <%
                    if (AllTasks != null && AllTasks.Count > 0)
                    {%>
                <ul data-role="listview" data-inset="true">
                    <%    for (int i = 0; i < AllTasks.Count; i++)
                        {
                            TaskDefinition td = (TaskDefinition)AllTasks[i]; %>

                    <li <%if (IsCompleted(td))
                        { %>data-icon="check" data-theme="b"><%}
                        else if (IsPending(td))
                        { %>data-icon="heart"><a href="DlgSelectTask.aspx?Achievement=<%=AchievementID %>&Email=<%=mUser.UserEmail%>&PendingTask=<%=td.TaskID%>"> <%} 
                        else
                        { %>data-icon="plus" class="show-page-loading-msg"><a href="DlgSelectTask.aspx?Achievement=<%=AchievementID %>&Email=<%=mUser.UserEmail%>&Task=<%=td.TaskID%>"><%} 
                        %>
                        <h2 class="<%=GetTaskHeaderClass(td) %>"><%=td.TaskName %></h2>
                        <p><%=td.TaskDescription %></p>
                            <%if (!IsCompleted(td)) { %>
                            </a>
                            <% } %>
                    </li>

                    <%} %>
                </ul>

                <% }
                %>
            </div>
        </div>

        <div data-role="footer" data-position="fixed">
            <h4>Copyright &copy; Atomic Helicopters</h4>
        </div>
    </div>

</body>
</html>
