<!DOCTYPE html>
<%@page import="com.etranzact.web.controllers.UserController"%>
<%@include file="taglib.jsp"%>
<html>
    <head>
        <title>Welcome</title>

        <link href="${rootURL}resources/bootstrap/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="${rootURL}resources/css/styles.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rootURL}resources/jquery/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="${rootURL}resources/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="${rootURL}resources/js/app.js"></script>

    </head>
    <body>

        <h2>Welcome <%=UserController.getCurrentUser().getName()%> </h2>
        <h3>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="${pageContext.request.contextPath}/allissuespagemaster">Administration</a>
            </sec:authorize>
        </h3>
        <p>	<a href="${pageContext.request.contextPath}/logout">Logout</a></p>
        <br />
        <h2>There are ${issues.size()} issues listed</h2>
        <table class="issues">
            <tr class="thead">
                <td class="thead">Issue summary</td>
                <td class="thead">Time identified</td>
                <td class="thead">Assigned</td>
                <td class="thead">Status</td>
            </tr>
            <c:forEach var="issue" items="${issues}" > 
                <tr>
                    <td><a href="${pageContext.request.contextPath}/issuedetails/${issue.id}">${issue.summary}</a></td>
                    <td>${issue.dateIdentified}</td>
                    <td>${issue.assignedTo.name}</td>
                    <td>${issue.status==true ? "Open" : "Closed"}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/createNewIssue">Create new issue</a>
        <br>
        
        <br>
        
            <sec:authorize access="hasRole('ROLE_TEAM_MEMBER')">
                <a href="${pageContext.request.contextPath}/getmyassigment/<%= UserController.getCurrentUserId()%>">My Assigment</a>
            </sec:authorize>
<br />
        <div class="foot">
            <span>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="${pageContext.request.contextPath}/allissuespagemaster">Administration</a>
            </sec:authorize>
            </span>
            <span>
                <a href="${pageContext.request.contextPath}/issues">Home</a>
            </span>
        </div>
    </body>
</html>