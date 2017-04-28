<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="lessonweb.web.pilotapp.homepage" %>

<%@ Import Namespace="lessonweb.Data" %>
<%@ Import Namespace="lessonweb.App_Code" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/Content/jquery.mobile-1.4.5.min.css" />
    <script src="/Assets/js/jquery-2.2.4.min.js"></script>
    <script src="/Scripts/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
    <div data-role="page" id="homepage" >
        <div data-role="panel" id="navPanel" data-display="push">
            <ul data-role="listview">
                <li data-theme="b">Home</li>
                <li><a href="#">Pilot Levels</a></li>
                <li><a href="#">Rewards</a></li>
                <li><a href="#">Achievements</a></li>
                <li><a href="#">Tasks</a></li>
                <li><a href="#">Planner</a></li>
            </ul>
        </div>

        <div data-role="panel" id="userPanel" data-position="right" data-display="push">
        </div>

        <div data-role="header" data-position="fixed">
            <a class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all" href="#navPanel"></a>
            <h1 class="ui-title">Pilot Rewards</h1>
            <a class="ui-btn ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">
            <%if (PilotClasses != null && PilotClasses.Count > 0)
                {
                    foreach (PilotClassDefinition pc in PilotClasses)
                    {%>

            <div class="ui-corner-all custom-corners" >
                <div class="ui-bar ui-bar-b">
                    <h3>Pilot Level : <%=pc.PilotClassName %></h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Achieved on <%= Helpers.FormatDateTime(PilotClass.WhenAchieved(pc.PilotClassID, mUser.UserEmail), Helpers.DATEFORMAT.FORMAT_SHORT) %></p>
                </div>
            </div>
            <%}
                }
                else
                {
            %>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>No Pilot Level yet</h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>You haven't qualified for any levels yet.</p>
                    <p>Choose the planner in the menu to view the tasks required to achieve the next level.</p>
                </div>
            </div>

            <%
                }
            %>
            <br />
            <%if (Rewards != null && Rewards.Count > 0)
                {
                    foreach (RewardDefinition pc in Rewards)
                    {%>

            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>Reward : <%=pc.RewardName %></h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Achieved on <%= Helpers.FormatDateTime(PilotReward.WhenAchieved(pc.RewardID, mUser.UserEmail), Helpers.DATEFORMAT.FORMAT_SHORT) %></p>
                </div>
            </div>
            <%}
                }
                else
                {
            %>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>No rewards yet</h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Choose the planner in the menu to view the tasks and acheivements required to get the next Reward.</p>
                </div>
            </div>

            <%
                }
            %>
            <br />

            <%if (Achievements != null && Achievements.Count > 0)
                {
                    foreach (AchievementDefinition pc in Achievements)
                    {%>

            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>Achievement : <%=pc.AchievementName %></h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Achieved on <%= Helpers.FormatDateTime(PilotReward.WhenAchieved(pc.AchievementID, mUser.UserEmail), Helpers.DATEFORMAT.FORMAT_SHORT) %></p>
                </div>
            </div>
            <%}
                }
                else
                {
            %>
            <div class="ui-corner-all custom-corners">
                <div class="ui-bar ui-bar-a">
                    <h3>No achievements yet</h3>
                </div>
                <div class="ui-body ui-body-a">
                    <p>Choose the planner in the menu to view the tasks required to get the next Achievement.</p>
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
