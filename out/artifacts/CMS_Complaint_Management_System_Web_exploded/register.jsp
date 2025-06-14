<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/14/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { display: flex; align-items: center; justify-content: center; height: 100vh; background: #f8f9fa; }
        .register-card { max-width: 500px; width: 100%; }
    </style>
</head>
<body>

<div class="card register-card shadow-sm">
    <div class="card-body p-4">
        <h2 class="text-center mb-3">Register</h2>

        <form action="register" method="post">
            <% String error = (String) request.getAttribute("errorMessage"); %>
            <% if (error != null) { %>
            <div class="alert alert-danger"><%= error %></div>
            <% } %>

            <div class="mb-3">
                <label for="uname" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="uname" name="uname" required>
            </div>

            <div class="mb-3">
                <label for="uemail" class="form-label">Email</label>
                <input type="email" class="form-control" id="uemail" name="uemail" required>
            </div>

            <div class="mb-3">
                <label for="upassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="upassword" name="upassword" required>
            </div>

            <div class="mb-3">
                <label for="urole" class="form-label">Role</label>
                <select name="urole" class="form-select" required>
                    <option value="EMPLOYEE">Employee</option>
                    <option value="ADMIN">Admin</option>
                </select>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-success">Register</button>
            </div>

            <div class="mt-3 text-center">
                Already have an account? <a href="login.jsp">Login</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
