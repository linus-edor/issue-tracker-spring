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
                <a href="${pageContext.request.contextPath}/allissuespagemaster">Administration</a>
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
                        <td class="col">Assigned To</td><td class="val">${details.assignedTo.name}</td>
                    </tr>
                    <tr>
                        <td class="col">Date Identified</td><td class="val">${details.dateIdentified}</td>
                    </tr>
                    <tr>
                        <td class="col">Resolution Date</td><td class="val">${details.resolutionDate}</td>
                    </tr>
                    <tr>
                        <td class="col">Status</td><td class="val">${details.status==true ? "Open" : "Closed"}</td>
                    </tr>
                    <tr>
                        <td class="col">Closing Comments</td><td class="val">${details.closingComments}</td>
                    </tr>
                </table>
            </div>
            <div class="half-page-right">
                <c:if test="${details.status==true}">
                    <form method="POST" action="${pageContext.request.contextPath}/assignIssue">
                        <input type="hidden" name="issue" value="${details.id}"/>
                        <label for ="assign">Assign this Issue to:</label>
                        <c:if test="${details.assignedTo == null}">
                            <select name="member" class="input-sm">
                                <option value="-1">--Choose--</option>
                                <c:forEach var="member" items="${team}" > 
                                    <%--<c:if test="${!member.name == "admin"}">--%>
                                    <option value="${member.id}">${member.name}</option>
                                    <%--</c:if>--%>
                                </c:forEach>
                            </select>
                            <br>
                            <input type="submit" class="btn btn-primary" value="Save">
                        </c:if>
                    </form>
                </c:if>
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