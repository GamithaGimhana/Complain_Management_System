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
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .register-card {
            width: 100%;
            max-width: 500px;
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .card-header {
            background-color: var(--primary-dark);
            color: white;
            text-align: center;
            padding: 20px;
            font-weight: 600;
        }
        .card-body {
            padding: 30px;
            background-color: white;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 10px 15px;
        }
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(155, 89, 182, 0.25);
        }
        .btn-purple {
            background-color: var(--accent-color);
            border: none;
            padding: 10px;
            font-weight: 500;
            color: white;
            width: 100%;
        }
        .btn-purple:hover {
            background-color: #8e44ad;
            color: white;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <div class="card-header">
            <h4>Create Account</h4>
        </div>
        <div class="card-body">
            <form id="registerForm" action="register" method="post">
                <% String error = (String) request.getAttribute("errorMessage"); %>
                <% if (error != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
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
                    <select name="urole" id="urole" class="form-select" required>
                        <option value="EMPLOYEE">Employee</option>
                        <option value="ADMIN">Admin</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-purple mt-3">Register</button>

                <div class="mt-3 text-center">
                    Already have an account? <a href="login.jsp" style="color: var(--accent-color);">Login</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const name = document.getElementById('uname').value;
            const email = document.getElementById('uemail').value;
            const password = document.getElementById('upassword').value;
            const role = document.getElementById('urole').value;

            if (!name || !email || !password || !role) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Validation Error',
                    text: 'Please fill in all required fields',
                    confirmButtonColor: '#9b59b6'
                });
            } else if (password.length < 4) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Validation Error',
                    text: 'Password must be at least 4 characters long',
                    confirmButtonColor: '#9b59b6'
                });
            }
        });
    </script>
</body>
</html>