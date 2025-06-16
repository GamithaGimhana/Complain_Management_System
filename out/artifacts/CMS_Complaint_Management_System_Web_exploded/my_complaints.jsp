<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/15/2025
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gdse.aad.cms.model.Complaint" %>
<%
  List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Complaints</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="mb-4">My Complaints</h2>
  <table class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th>Status</th>
      <th>Created At</th>
      <th>Last Updated</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : complaints) { %>
    <tr>
      <td><%= c.getCtitle() %></td>
      <td><%= c.getCdescription() %></td>
      <td><%= c.getCstatus() %></td>
      <td><%= c.getCcreatedAt() %></td>
      <td><%= c.getCupdatedAt() %></td>
      <td>
        <% if ("PENDING".equals(c.getCstatus())) { %>
        <a href="edit_complaint?cid=<%= c.getCid() %>" class="btn btn-sm btn-warning">Edit</a>
        <a href="delete_complaint?cid=<%= c.getCid() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?');">Delete</a>
        <% } %>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
</div>
</body>
</html>

