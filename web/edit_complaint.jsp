<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/15/2025
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gdse.aad.cms.model.Complaint" %>
<%
  Complaint complaint = (Complaint) request.getAttribute("complaint");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Complaint</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h3>Edit Complaint</h3>
<%--  <form action="edit_complaint" method="post">--%>
  <form action="employee-complaint?action=update" method="post">

  <input type="hidden" name="cid" value="<%= complaint.getCid() %>">
    <div class="mb-3">
      <label>Title</label>
      <input type="text" class="form-control" name="ctitle" value="<%= complaint.getCtitle() %>" required>
    </div>
    <div class="mb-3">
      <label>Description</label>
      <textarea class="form-control" name="cdescription" required><%= complaint.getCdescription() %></textarea>
    </div>
    <button type="submit" class="btn btn-success">Update</button>
<%--    <a href="my_complaints" class="btn btn-secondary">Cancel</a>--%>
    <a href="employee-complaint" class="btn btn-secondary">Cancel</a>
  </form>
</div>
</body>
</html>
