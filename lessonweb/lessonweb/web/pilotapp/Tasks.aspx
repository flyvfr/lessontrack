<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="lessonweb.web.pilotapp.Tasks" %>


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
                <li><a href="todo.aspx" data-ajax="false">To Do</a></li>
                <li><a href="planner.aspx" data-ajax="false">Planner</a></li>
                <li><a href="PilotLevels.aspx" data-ajax="false">Pilot Levels</a></li>
                <li><a href="Rewards.aspx" data-ajax="false">Rewards</a></li>
                <li><a href="achievements.aspx" data-ajax="false">Achievements</a></li>
                <li data-theme="b">Tasks</li>
            </ul>
        </div>

        <div data-role="panel" id="userPanel" data-position="right" data-display="push" style="background-color: lightblue">
            <img src="<%=Utils.GetLogoURL("Air Pilot Hat") %>" style="display: block; margin: auto" />
            <h4 style="text-align: center"><%=mUser.GetFullName() %></h4>

            <a class="ui-btn" href="logout.aspx">Log Out</a>
        </div>

        <div data-role="header" data-position="fixed">
            <div class="ui-btn-left" data-type="horizontal">
                <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all" href="#navPanel"></a>
                <a class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="back" href="#"></a>
            </div>
            <h1 class="ui-title">Tasks</h1>
            <a class="ui-btn ui-btn-right ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">

            <div class="ui-corner-all custom-corners">

                <div class="ui-bar ui-bar-b ui-bar-gray">
                    <h3>All Tasks</h3>
                </div>
                <ul style="margin-top: 0px" data-role="listview" data-inset="true">
                    <%foreach (TaskDefinition td in items)
                        {%>
                    <li <%
                        DateTime whenAch = PilotTask.WhenAchieved(td.TaskID, mUser.UserEmail);
                        if (whenAch != DateTime.MinValue)
                        { %>
                        data-icon="check"><%}
                                              else
                                              { %>
                            data-icon="delete">
                                <%}%>
                        <a href="ShowTask.aspx?TaskID=<%=td.TaskID %>">
                            <img src="<%=Utils.GetLogoURL("Trophy") %>" />
                                <h2 class="<%=GetTaskHeaderClass(whenAch!= DateTime.MinValue) %>"><%=td.TaskName%></h2>
                                <p><%=td.TaskDescription%></p></a></li>
                    <%} %>
                </ul>

            </div>
        </div>

        <div data-role="footer" data-position="fixed">
            <h4>Copyright &copy; Atomic Helicopters</h4>
        </div>
    </div>

</body>
</html>
