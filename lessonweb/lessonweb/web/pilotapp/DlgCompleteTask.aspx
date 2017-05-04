<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DlgCompleteTask.aspx.cs" Inherits="lessonweb.web.pilotapp.DlgCompleteTask" %>

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
            <h2>Complete Task</h2>
        </div>
        <div data-role="content" id="ContentPage">
            <form>
                <label for="CompletionDate">Completed On</label>
                <input type="text" data-role="datebox" name="CompletionDate" id="CompletionDate" data-options='{"mode":"calbox","overrideDateFormat":"%m-%d-%Y","showInitialValue":"true"}' />
                <select id="Reviewer" data-native-menu="true">
                    <option value="">Pick Reviewer</option>
                    <%foreach (AppUser ins in Instructors)
                        { %>
                    <option value="<%=ins.UserEmail %>"><%=ins.GetFullName() %></option>
                    <%} %>
                </select>
            </form>
            <p>By clicking Complete, you are declaring that you have performed this task.</p>

            <a href="#" onclick="addTaskComplete('<%=Email %>', '<%=Task %>', '<%=AchievementID %>');" id="complete-button" class="ui-btn ui-shadow ui-corner-all">Complete Task</a>
            <a href="#" onclick="navToAchievementOrTodo('<%=AchievementID %>')" id="cancel-button" class="ui-btn ui-shadow ui-corner-all">Cancel</a>
        </div>
    </div>
</body>
</html>
