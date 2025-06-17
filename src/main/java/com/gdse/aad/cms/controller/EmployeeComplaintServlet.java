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

//@WebServlet(name = "EmployeeComplaintServlet", urlPatterns = {"/employee-complaint"})
public class EmployeeComplaintServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"EMPLOYEE".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");
        String cid = req.getParameter("cid");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());

            if ("edit".equals(action)) {
                Complaint complaint = dao.getComplaintById(cid);
                if (complaint != null && complaint.getUserId().equals(user.getUid()) && "PENDING".equals(complaint.getCstatus())) {
                    req.setAttribute("complaint", complaint);
                    req.getRequestDispatcher("update_user_complaint.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("employee-complaint?action=my");
                }
                return;
            }

            if ("delete".equals(action)) {
                dao.deleteComplaintById(cid, user.getUid());
                resp.sendRedirect("employee-complaint?action=my");
                return;
            }

            // Default or my complaints view
            List<Complaint> list = dao.getComplaintsByUser(user.getUid());
            req.setAttribute("complaints", list);
            req.getRequestDispatcher("user_complaints.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Failed to process employee request", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"EMPLOYEE".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());

            if ("submit".equals(action)) {
                Complaint complaint = new Complaint();
                complaint.setCid(UUID.randomUUID().toString());
                complaint.setUserId(user.getUid());
                complaint.setCtitle(req.getParameter("ctitle"));
                complaint.setCdescription(req.getParameter("cdescription"));

                boolean saved = dao.saveComplaint(complaint);
                if (saved) {
                    resp.sendRedirect("dashboard.jsp");
                } else {
                    req.setAttribute("errorMessage", "Failed to submit complaint.");
                    req.getRequestDispatcher("complaint_form.jsp").forward(req, resp);
                }
                return;
            }

            if ("update".equals(action)) {
                Complaint updated = new Complaint();
                updated.setCid(req.getParameter("cid"));
                updated.setCtitle(req.getParameter("ctitle"));
                updated.setCdescription(req.getParameter("cdescription"));

                dao.updateComplaint(updated);
                resp.sendRedirect("employee-complaint?action=my");
                return;
            }

        } catch (Exception e) {
            throw new ServletException("Failed to process complaint action", e);
        }
    }
}
