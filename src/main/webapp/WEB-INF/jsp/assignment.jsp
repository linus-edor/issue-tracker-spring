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
        <style type="text/css">
        </style>
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
        <br>
        <div class="container full-page">
            <div class="row half-page-left">
                <table>
                    <tr>
                        <td class="col">Issue Summary</td><td class="val">${details.summary}</td>
                    </tr>
                    <tr>
                        <td class="col">Full Description</td><td class="val">${details.fullDetails}</td>
                    </tr>
                    <tr>
                        <td class="col">Closed?</td><td class="val">${details.status==true ? "No" : "Yes"}</td>
                    </tr>
                    <tr>
                        <td class="col">Closing Comments</td><td class="val">${details.closingComments}</td>
                    </tr>
                </table>
            </div>
            <div class="half-page-right">
                <form action="${pageContext.request.contextPath}/closeAssigment/${details.id}" method="POST">
                    <p>
                    <Lable class ="labell">Close Issue:</lable><input type ="checkbox" name="close" />
                    </p>
                    <p>
                    <Lable class ="labell">Closing Comments:</lable><input type ="text" name="comment"/>
                    </p>
                    <p>
                        <input type="submit" value="Close issue" class="btn btn-primary"/> &nbsp; <input type="reset" value="Reset" class="btn btn-default"/>
                    </p>
                </form>
            </div>
        </div>
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