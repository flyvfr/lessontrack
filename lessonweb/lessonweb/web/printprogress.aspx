<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printprogress.aspx.cs" Inherits="lessonweb.web.PGPrintProgress" %>

<%@ Import Namespace="lessonweb.Data" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>LessonTrack Course</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">
</head>
<body>
    <div><h3><%=mStudent.GetFullName() %></h3></div>
    <div>Generated on <%=DateTime.Now.ToString() %></div>
    <hr />
    <div>
        <table class="table table-condensed">
            <thead>
                <tr class="active">
                    <th style="width:5%">Done</th>
                    <th style="width:60%">Lesson</th>
                    <th style="width:15%">Completed On</th>
                    <th style="width:20%">Logged by</th>
                </tr>

            </thead>

            <tbody>
            
                <%foreach (STAGE s in mCourse.mStages)
                    { %>
                    <%=s.GetReportLines() %>
                <%} %>
            </tbody>
        </table>
    </div>
</body>

<!--   Core JS Files   -->
<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="../assets/js/bootstrap-checkbox-radio.js"></script>


</html>
