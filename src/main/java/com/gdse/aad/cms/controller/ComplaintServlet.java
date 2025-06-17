package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.Complaint;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

//@WebServlet(name = "ComplaintServlet", urlPatterns = {"/complaint"})
public class ComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if (user == null || !"EMPLOYEE".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String title = req.getParameter("ctitle");
        String description = req.getParameter("cdescription");

        Complaint complaint = new Complaint();
        complaint.setCid(UUID.randomUUID().toString());
        complaint.setUserId(user.getUid());
        complaint.setCtitle(title);
        complaint.setCdescription(description);

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            boolean success = dao.saveComplaint(complaint);
            if (success) {
                resp.sendRedirect("dashboard.jsp");
            } else {
                req.setAttribute("errorMessage", "Failed to submit complaint.");
                req.getRequestDispatcher("complaint_form.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException("Complaint submission failed", e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"EMPLOYEE".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            List<Complaint> complaintList = dao.getComplaintsByUser(user.getUid());

            req.setAttribute("complaints", complaintList);
            req.getRequestDispatcher("my_complaints.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException("Failed to load complaints", e);
        }
    }
}
