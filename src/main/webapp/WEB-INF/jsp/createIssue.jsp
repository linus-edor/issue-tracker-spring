<!DOCTYPE html>
<%@page import="com.etranzact.web.controllers.UserController"%>
<%@include file="taglib.jsp"%>
<html xmlns:th="http://www.thymeleaf.org">
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
                <a href="${pageContext.request.contextPath}/admin">Administration</a>
            </sec:authorize>
        </h3>
        <p>	<a href="${pageContext.request.contextPath}/logout">Logout</a></p>
        <br />
        <h1>Create Issue</h1>
        <form action="${pageContext.request.contextPath}/createIssue"  method="post">
            <p><span class="labell">Summary: </span><input type="text" name="summary" /></p>
            <p><span class="labell">Full Description:</span> <input type="text" name="fulldesc" /></p>
            <input type="hidden" name="identifiedBy" value="${UserController.getCurrentUser().getName()}"/>
            <p><input type="submit" class="btn btn-primary" value="Submit" /> &nbsp; &nbsp; &nbsp; &nbsp;<input type="reset" class="btn btn-default" value="Reset" /></p>
        </form>
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