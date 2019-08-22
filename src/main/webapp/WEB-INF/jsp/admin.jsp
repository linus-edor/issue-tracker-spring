<!DOCTYPE html>
<%@include file="taglib.jsp" %>
<html>
    <head>
        <title>Administrator</title>
        <link href="${rootURL}resources/bootstrap/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="${rootURL}resources/css/styles.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rootURL}resources/jquery/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="${rootURL}resources/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="${rootURL}resources/js/app.js"></script>
    </head>
    <body>
        <h2>Administrator Home Page</h2>
        <p>	<a href="${rootURL}issues">Home</a></p>
        <p>	<a href="${rootURL}logout">Logout</a></p>	
        <br />
        <table class="issues">
            <tr class="thead">
                <td class="thead">Issue summary</td>
                <td class="thead">Full description</td>
                <td class="thead">Time identified</td>
                <td class="thead">Assigned to</td>
                <td class="thead">Identified By</td>
                <td class="thead">Closing Comments</td>
                <td class="thead">Status</td>

            </tr>
            <c:forEach var="issue" items="${issues}" > 
                <tr>
                    <td>${issue.summary}</td>
                    <td>${issue.fullDetails}</td>
                    <td>${issue.dateIdentified}</td>
                    <td>${issue.assignedTo.name}</td>
                    <td>${issue.identifiedBy}</td>
                    <td>${issue.closingComments}</td>
                    <td>${issue.status==true ? "Closed" : "Open"}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>