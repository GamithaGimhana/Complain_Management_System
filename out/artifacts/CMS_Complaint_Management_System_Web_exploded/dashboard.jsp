<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/14/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gdse.aad.cms.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h3 class="card-title mb-4">Welcome, <%= user.getUname() %>!</h3>
            <p><strong>Email:</strong> <%= user.getUemail() %></p>
            <p><strong>Role:</strong> <%= user.getUrole() %></p>

            <hr>

            <% if ("EMPLOYEE".equals(user.getUrole())) { %>
            <h5>Employee Options</h5>
            <ul>
                <li><a href="complaint_form.jsp">Submit Complaint</a></li>
                <li><a href="my_complaints.jsp">View My Complaints</a></li>
            </ul>
            <% } else if ("ADMIN".equals(user.getUrole())) { %>
            <h5>Admin Options</h5>
            <ul>
                <li><a href="all_complaints.jsp">View All Complaints</a></li>
                <li><a href="manage_users.jsp">Manage Users</a></li>
            </ul>
            <% } %>

            <div class="mt-4">
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>



