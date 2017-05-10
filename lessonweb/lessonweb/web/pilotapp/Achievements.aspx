<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="lessonweb.web.pilotapp.Achievements" %>


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
                <li data-theme="b">Achievements</li>
                <li><a href="tasks.aspx" data-ajax="false">Tasks</a></li>
            </ul>
        </div>

        <div data-role="panel" id="userPanel" data-position="right" data-display="push" style="background-color: lightblue">
            <img src="<%=Utils.GetLogoURL("Air Pilot Hat") %>" style="display: block; margin: auto" />
            <h4 style="text-align: center"><%=mUser.GetFullName() %></h4>

            <a class="ui-btn" href="logout.aspx">Log Out</a>
        </div>

        <div data-role="header" data-position="fixed">
            <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all" href="#navPanel"></a>
            <h1 class="ui-title">Achievements</h1>
            <a class="ui-btn ui-btn-right ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">

            <div class="ui-corner-all custom-corners">

                <div class="ui-bar ui-bar-b ui-bar-gray">
                    <h3>All Achievements</h3>
                </div>
                <ul style="margin-top: 0px" data-role="listview" data-inset="true">
                    <%foreach (AchievementDefinition td in items)
                        {%>
                    <li <%
                        DateTime whenAch = PilotAchievement.WhenAchieved(td.AchievementID, mUser.UserEmail);
                        if (whenAch != DateTime.MinValue)
                        { %>
                        data-icon="check"><%}
                                              else
                                              { %>
                            data-icon="delete">
                                <%}%>
                        <a href="ShowAchievement.aspx?AchievementID=<%=td.AchievementID %>">
                            <img src="<%=Utils.GetLogoURL("Trophy") %>" />
                                <h2 class="<%=GetAchievementHeaderClass(whenAch!= DateTime.MinValue) %>"><%=td.AchievementName%></h2>
                                <p><%=td.AchievementDesc%></p></a></li>
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
