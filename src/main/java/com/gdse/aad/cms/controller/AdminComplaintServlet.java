package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.Complaint;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminComplaintServlet", urlPatterns = {"/admin-complaint"})
public class AdminComplaintServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");
        String cid = req.getParameter("cid");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());

            if ("delete".equals(action)) {
                dao.deleteComplaintByAdmin(cid);
                resp.sendRedirect("admin-complaint?action=all");
                return;
            }

            if ("edit".equals(action)) {
                Complaint complaint = dao.getComplaintById(cid);
                req.setAttribute("complaint", complaint);
                req.getRequestDispatcher("update_complaint.jsp").forward(req, resp);
                return;
            }

            // default : list all complaints
            List<Complaint> list = dao.getAllComplaints();
            req.setAttribute("complaints", list);
            req.getRequestDispatcher("all_complaints.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String cid = req.getParameter("cid");
        String status = req.getParameter("status");
        String remarks = req.getParameter("remarks");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            dao.updateStatusAndRemarks(cid, status, remarks);
            resp.sendRedirect("admin-complaint?action=all");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
