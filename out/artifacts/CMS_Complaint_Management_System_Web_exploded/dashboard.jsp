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

    <!-- Custom CSS -->
    <style>
        :root {
            --primary-dark: #2c3e50;
            --primary-light: #34495e;
            --accent-color: #4d6bfe;
            --light-gray: #ecf0f1;
            --dark-gray: #7f8c8d;
        }
        body {
            background-color: var(--light-gray);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .sidebar {
            background-color: var(--primary-dark);
            color: white;
            height: 100vh;
            position: fixed;
            padding: 20px 0;
        }
        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .sidebar-menu {
            padding: 20px 0;
        }
        .sidebar-menu a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .sidebar-menu a:hover {
            background-color: rgba(255,255,255,0.1);
            color: white;
        }
        .sidebar-menu a.active {
            background-color: var(--accent-color);
        }
        .main-content {
            width: 100%;
            margin-left: 250px;
            padding: 50px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            font-weight: 600;
        }
        .btn-purple {
            background-color: var(--accent-color);
            color: white;
            border: none;
        }
        .btn-purple:hover {
            background-color: #8e44ad;
            color: white;
        }
        .user-info {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar" style="width: 250px;">
            <div class="sidebar-header">
                <h5>Complaint System</h5>
            </div>
            <div class="sidebar-menu">
                <a href="dashboard.jsp" class="active">Dashboard</a>
                <% if ("EMPLOYEE".equals(user.getUrole())) { %>
                <a href="complaint_form.jsp">Submit Complaint</a>
                <a href="user-complaints">My Complaints</a>
                <% } else if ("ADMIN".equals(user.getUrole())) { %>
                <a href="all-complaints">All Complaints</a>
                <% } %>
                <a href="logout">Logout</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="user-info">
                <h4>Welcome, <%= user.getUname() %></h4>
                <p class="text-muted mb-1"><strong>Email:</strong> <%= user.getUemail() %></p>
                <p class="text-muted"><strong>Role:</strong> <%= user.getUrole() %></p>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Quick Actions</h5>
                </div>
                <div class="card-body">
                    <% if ("EMPLOYEE".equals(user.getUrole())) { %>
                        <h5>Employee Options</h5>
                        <a href="complaint_form.jsp" class="btn btn-purple me-2">Submit New Complaint</a>
                        <a href="user-complaints" class="btn btn-outline-secondary">View My Complaints</a>
    <%--                    <a href="employee-complaint" class="btn btn-outline-secondary">View My Complaints</a>--%>
                    <% } else if ("ADMIN".equals(user.getUrole())) { %>
                        <h5>Admin Options</h5>
                        <a href="all-complaints" class="btn btn-purple">Manage Complaints</a>
    <%--                    <a href="admin-complaint" class="btn btn-purple">Manage Complaints</a>--%>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
