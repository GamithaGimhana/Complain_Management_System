<%--
  Created by IntelliJ IDEA.
  User: gamit
  Date: 6/16/2025
  Time: 12:07 PM
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
  <title>Update Complaint</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h3>Update Complaint</h3>
  <form action="update-complaint" method="post">
    <input type="hidden" name="cid" value="<%= complaint.getCid() %>">
    <div class="mb-3">
      <label>Status</label>
      <select name="status" class="form-select">
        <option value="PENDING" <%= "PENDING".equals(complaint.getCstatus()) ? "selected" : "" %>>PENDING</option>
        <option value="IN_PROGRESS" <%= "IN_PROGRESS".equals(complaint.getCstatus()) ? "selected" : "" %>>IN_PROGRESS</option>
        <option value="RESOLVED" <%= "RESOLVED".equals(complaint.getCstatus()) ? "selected" : "" %>>RESOLVED</option>
        <option value="REJECTED" <%= "REJECTED".equals(complaint.getCstatus()) ? "selected" : "" %>>REJECTED</option>
      </select>
    </div>
    <div class="mb-3">
      <label>Remarks</label>
      <textarea class="form-control" name="remarks"><%= complaint.getCremarks() != null ? complaint.getCremarks() : "" %></textarea>
    </div>
    <button type="submit" class="btn btn-success">Update</button>
    <a href="all-complaints" class="btn btn-secondary">Cancel</a>
  </form>
</div>
</body>
</html>


