<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/16/2025
  Time: 12:05 PM
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
  <title>All Complaints</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h3>All Complaints</h3>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Submitted By</th>
      <th>Title</th>
      <th>Description</th>
      <th>Status</th>
      <th>Remarks</th>
      <th>Created At</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : complaints) { %>
    <tr>
      <td><%= c.getUsername() %></td>
      <td><%= c.getCtitle() %></td>
      <td><%= c.getCdescription() %></td>
      <td><%= c.getCstatus() %></td>
      <td><%= c.getCremarks() != null ? c.getCremarks() : "" %></td>
      <td><%= c.getCcreatedAt() %></td>
      <td>
<%--        <a href="update-complaint?cid=<%= c.getCid() %>" class="btn btn-sm btn-primary">Update</a>--%>
        <a href="admin-complaint?action=edit&cid=<%= c.getCid() %>" class="btn btn-sm btn-primary">Update</a>

      <%--        <a href="admin-delete-complaint?cid=<%= c.getCid() %>"--%>
<%--           class="btn btn-sm btn-danger"--%>
<%--           onclick="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--          Delete--%>
<%--        </a>--%>
        <a href="admin-complaint?action=delete&cid=<%= c.getCid() %>"
           class="btn btn-sm btn-danger"
           onclick="return confirm('Are you sure you want to delete this complaint?');">
          Delete
        </a>

      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
</div>
</body>
</html>

