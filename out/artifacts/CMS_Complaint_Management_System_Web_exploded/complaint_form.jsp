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
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="card shadow-sm">
    <div class="card-body">
      <h3 class="mb-4">Submit a Complaint</h3>
<%--      <form action="complaint" method="post">--%>
        <form action="employee-complaint?action=submit" method="post">
        <div class="mb-3">
          <label for="ctitle" class="form-label">Title</label>
          <input type="text" class="form-control" id="ctitle" name="ctitle" required>
        </div>

        <div class="mb-3">
          <label for="cdescription" class="form-label">Description</label>
          <textarea class="form-control" id="cdescription" name="cdescription" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Submit Complaint</button>
      </form>
      <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
  </div>
</div>
</body>
</html>
