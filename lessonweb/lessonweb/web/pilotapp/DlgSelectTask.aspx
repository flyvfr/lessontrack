<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DlgSelectTask.aspx.cs" Inherits="lessonweb.web.pilotapp.DlgSelectTask" %>

<%@ Import Namespace="lessonweb.Data" %>
<%@ Import Namespace="lessonweb.App_Code" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Task</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />
    <!-- #Include virtual="links.inc" -->
</head>
<body>
    <div data-role="page" data-dialog="true" id="homepage">
        <div data-role="header">
            <h2>Add Task</h2>
        </div>
        <div data-role="content" id="ContentPage">
            <%
                String PendingTask = Request.Params["PendingTask"];
                String Email = Request.Params["Email"];
                String Task = Request.Params["Task"];
                String AchievementID = Request.Params["Achievement"];
                if (string.IsNullOrEmpty(PendingTask))
                {
            %>
            <p>You can either add it to your TODO list for later, or if you have already performed it, set it as completed.</p>
                <a href="#" id="todo-button" class="ui-btn ui-shadow ui-corner-all" onclick="addTaskTodo('<%=Email %>', '<%=Task %>', '<%=AchievementID %>');">Add ToDo</a>
                <a href="DlgCompleteTask.aspx?Achievement=<%=AchievementID %>&Email=<%=mUser.UserEmail%>&Task=<%=Task%>" id="complete-button" class="ui-btn ui-shadow ui-corner-all">Complete Task</a>
                <a href="PlanAchievement.aspx?AchievementID=<%=AchievementID %>" id="cancel-button" class="ui-btn ui-shadow ui-corner-all">Cancel</a>
            <%}else{%>
            <p>If you have already performed the task, set it as completed.</p>
                <a href="DlgCompleteTask.aspx?Achievement=<%=AchievementID %>&Email=<%=mUser.UserEmail%>&Task=<%=PendingTask%>" id="complete-button2" class="ui-btn ui-shadow ui-corner-all">Complete Task</a>
                <a href="PlanAchievement.aspx?AchievementID=<%=AchievementID %>" id="cancel-button2" class="ui-btn ui-shadow ui-corner-all">Cancel</a>

            <%} %>
        </div>
    </div>
</body>
</html>
