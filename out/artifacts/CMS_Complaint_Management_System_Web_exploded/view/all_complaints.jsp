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
    .table {
      background-color: white;
    }
    .table th {
      background-color: var(--primary-light);
      color: white;
    }
    .status-pending {
      color: #f39c12;
      font-weight: 500;
    }
    .status-in-progress {
      color: #3498db;
      font-weight: 500;
    }
    .status-resolved {
      color: #2ecc71;
      font-weight: 500;
    }
    .status-rejected {
      color: #e74c3c;
      font-weight: 500;
    }
  </style>
</head>
<body>
  <div class="container py-5">
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">All Complaints</h5>
        <a href="../view/dashboard.jsp" class="btn btn-sm btn-outline-light">Back to Dashboard</a>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
            <tr>
              <th>Submitted By</th>
              <th>Title</th>
              <th>Description</th>
              <th>Status</th>
              <th>Remarks</th>
              <th>Created At</th>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Complaint c : complaints) { %>
            <tr>
              <td><%= c.getUsername() %></td>
              <td><%= c.getCtitle() %></td>
              <td><%= c.getCdescription() %></td>
              <td>
                <span class="status-<%= c.getCstatus().toLowerCase().replace("_", "-") %>">
                  <%= c.getCstatus() %>
                </span>
              </td>
              <td><%= c.getCremarks() != null ? c.getCremarks() : "—" %></td>
              <td><%= c.getCcreatedAt() %></td>
              <td>
                <%--If you using function based servlets--%>
                <a href="update-complaint-status?cid=<%= c.getCid() %>" class="btn btn-sm btn-purple">Update</a>
                <a href="admin-delete-complaint?cid=<%= c.getCid() %>" class="btn btn-sm btn-outline-danger"
                   onclick="confirmDelete(event)">Delete</a>

                <%--If you using role based servlets--%>
  <%--              <a href="admin-complaint?action=edit&cid=<%= c.getCid() %>" class="btn btn-sm btn-purple">Update</a>--%>
  <%--              <a href="admin-complaint?action=delete&cid=<%= c.getCid() %>" class="btn btn-sm btn-outline-danger"--%>
  <%--                 onclick="confirmDelete(event)">Delete</a>--%>
              </td>
            </tr>
            <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    function confirmDelete(event) {
      event.preventDefault();
      const url = event.currentTarget.getAttribute('href');

      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#9b59b6',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    }
  </script>
</body>
</html>