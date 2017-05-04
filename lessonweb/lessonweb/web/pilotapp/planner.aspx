<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planner.aspx.cs" Inherits="lessonweb.web.pilotapp.planner" %>

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
                <li data-theme="b">Planner</li>
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
            <h1 class="ui-title">Achievement Planner</h1>
            <a class="ui-btn ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">

            <div class="ui-corner-all custom-corners">
            <div data-role="collapsible" >
                <h4>How this works</h4>
                <p>Listed below are achievements you are ready for.</p>
                <p>Each achievement may have a set of prerequisite tasks you need to complete. Open each, review the tasks needed and when you have accomplished each task, mark it as done.</p>
                <p>Once you mark a task as completed, your instructor can go in and confirm the task.</p>
                <p>As you complete each achievement, additional ones may be unlocked as well.</p>
            </div>

            <%if (NextAchievements != null && NextAchievements.Count > 0)
                {
                    foreach (AchievementDefinition ad in NextAchievements)
                    {%>

            <div data-role="collapsible" data-theme="b" >
                <h4>Achievement : <%=ad.AchievementName%></h4>
                <p><%=ad.AchievementDesc %></p>
                <a class="ui-btn" href="PlanAchievement.aspx?AchievementID=<%=ad.AchievementID %>">Get This</a>
            </div>

            <%}
                }
                else
                {
            %>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>No more unlocked achievements for you</h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Weird.</p>
                </div>
            </div>

            <%
                }
            %>
        </div>
            </div>


        <div data-role="footer" data-position="fixed">
            <h4>Copyright &copy; Atomic Helicopters</h4>
        </div>
    </div>

</body>
</html>
