<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowPilotLevel.aspx.cs" Inherits="lessonweb.web.pilotapp.ShowPilotLevel" %>


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
                <li data-theme="b">Pilot Level</li>
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
            <h1 class="ui-title">Pilot Level</h1>
            <a class="ui-btn ui-btn-right ui-icon-user ui-btn-icon-notext ui-corner-all" href="#userPanel"></a>
        </div>

        <div data-role="content" id="ContentPage">

            <div class="ui-corner-all custom-corners">

                <div class="ui-bar ui-bar-b ui-bar-blue">
                    <h3><%=pcd.PilotClassName %></h3>
                </div>
                <div class="ui-body ui-body-a">
                    <table class="ui-responsive" id="table-column-toggle" data-role="table" data-mode="columntoggle:none">
                        <tbody>
                            <tr>
                                <td style="text-align: center; vertical-align: middle">
                                    <img src="<%=Utils.GetLogoURL(pcd.Logo) %>" style="width: 40px; height: 40px" /></td>
                                <td>
                                    <p><%=pcd.PilotClassDescription %></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <%if (achievedWhen != DateTime.MinValue)
                    { %>
                <div class="ui-bar ui-bar-note">
                    <h5>Achieved: <%=Helpers.FormatDateTime(achievedWhen, Helpers.DATEFORMAT.FORMAT_LONG) %></h5>
                </div>
                <%  } %>
                <br />


                <%
                    if (requirements != null && requirements.Count > 0)
                    {%>

                <div class="ui-bar ui-bar-b ui-bar-gray">
                    <h3>Required Achievements</h3>
                </div>
                <ul style="margin-top: 0px" data-role="listview" data-inset="true">
                    <%for (int i = 0; i < requirements.Count; i++)
                        {
                            AchievementDefinition td = (AchievementDefinition)requirements[i]; %>
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
                                <h2 class="<%=GetAchievementHeaderClass(whenAch!= DateTime.MinValue) %>"><%=td.AchievementName%></h2>
                                <p><%=td.AchievementDesc%></p></a></li>
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
