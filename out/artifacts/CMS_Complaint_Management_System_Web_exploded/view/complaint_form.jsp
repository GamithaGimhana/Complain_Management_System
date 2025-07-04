<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/15/2025
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gdse.aad.cms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"EMPLOYEE".equals(user.getUrole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: var(--primary-dark);
            color: white;
            font-weight: 600;
            border-radius: 8px 8px 0 0 !important;
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
        .form-control, .form-select {
            border-radius: 4px;
            border: 1px solid #ddd;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(155, 89, 182, 0.25);
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Submit New Complaint</h5>
                    </div>
                    <div class="card-body">
                        <%--If you using function based servlets--%>
                        <form id="complaintForm" action="complaint?action=submit" method="post">
                            <%--If you using role based servlets--%>
    <%--                    <form id="complaintForm" action="employee-complaint?action=submit" method="post">--%>
                            <div class="mb-3">
                                <label for="ctitle" class="form-label">Title</label>
                                <input type="text" class="form-control" id="ctitle" name="ctitle" required>
                            </div>

                            <div class="mb-3">
                                <label for="cdescription" class="form-label">Description</label>
                                <textarea class="form-control" id="cdescription" name="cdescription" rows="5" required></textarea>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="../view/dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
                                <button type="submit" class="btn btn-purple">Submit Complaint</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.getElementById('complaintForm').addEventListener('submit', function(e) {
            const title = document.getElementById('ctitle').value;
            const description = document.getElementById('cdescription').value;

            if (!title || !description) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Validation Error',
                    text: 'Please fill in all required fields',
                    confirmButtonColor: '#9b59b6'
                });
            } else if (description.length < 10) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Validation Error',
                    text: 'Description should be at least 10 characters long',
                    confirmButtonColor: '#9b59b6'
                });
            }
        });
    </script>

    <%
        Boolean complaintSuccess = (Boolean) session.getAttribute("complaintSuccess");
        if (complaintSuccess != null && complaintSuccess) {
            session.removeAttribute("complaintSuccess");
    %>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Complaint Submitted',
            text: 'Your complaint was submitted successfully!',
            confirmButtonColor: '#4d6bfe'
        });
    </script>
    <%
        }
    %>

</body>
</html>