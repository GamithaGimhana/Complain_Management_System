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
                    <h5 class="mb-0">Update Complaint Status</h5>
                </div>
                <div class="card-body">
                    <form id="statusForm" action="update-complaint-status" method="post">
<%--                    <form id="statusForm" action="admin-complaint" method="post">--%>
                        <input type="hidden" name="cid" value="<%= complaint.getCid() %>">

                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" class="form-control" value="<%= complaint.getCtitle() %>" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" rows="3" readonly><%= complaint.getCdescription() %></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Current Status</label>
                            <input type="text" class="form-control" value="<%= complaint.getCstatus() %>" readonly>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">New Status</label>
                            <select name="status" id="status" class="form-select" required>
                                <option value="PENDING" <%= "PENDING".equals(complaint.getCstatus()) ? "selected" : "" %>>PENDING</option>
                                <option value="IN_PROGRESS" <%= "IN_PROGRESS".equals(complaint.getCstatus()) ? "selected" : "" %>>IN_PROGRESS</option>
                                <option value="RESOLVED" <%= "RESOLVED".equals(complaint.getCstatus()) ? "selected" : "" %>>RESOLVED</option>
                                <option value="REJECTED" <%= "REJECTED".equals(complaint.getCstatus()) ? "selected" : "" %>>REJECTED</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="remarks" class="form-label">Remarks</label>
                            <textarea class="form-control" id="remarks" name="remarks" rows="3"><%= complaint.getCremarks() != null ? complaint.getCremarks() : "" %></textarea>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="all-complaints" class="btn btn-outline-secondary">Cancel</a>
<%--                            <a href="admin-complaint" class="btn btn-outline-secondary">Cancel</a>--%>
                            <button type="submit" class="btn btn-purple">Update Status</button>
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
    document.getElementById('statusForm').addEventListener('submit', function(e) {
        const status = document.getElementById('status').value;
        const remarks = document.getElementById('remarks').value;

        if (!status) {
            e.preventDefault();
            Swal.fire({
                icon: 'error',
                title: 'Validation Error',
                text: 'Please select a status',
                confirmButtonColor: '#9b59b6'
            });
        } else if (status === 'REJECTED' && !remarks) {
            e.preventDefault();
            Swal.fire({
                icon: 'error',
                title: 'Validation Error',
                text: 'Remarks are required when rejecting a complaint',
                confirmButtonColor: '#9b59b6'
            });
        }
    });
</script>
</body>
</html>