package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.Complaint;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateUserComplaintServlet", urlPatterns = {"/update-user-complaint"})
public class UpdateUserComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        User user = (User) req.getSession().getAttribute("user");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            Complaint complaint = dao.getComplaintById(cid);

            if (complaint != null && complaint.getUserId().equals(user.getUid()) && "PENDING".equals(complaint.getCstatus())) {
                req.setAttribute("complaint", complaint);
                req.getRequestDispatcher("edit_complaint.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("my-complaints");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String title = req.getParameter("ctitle");
        String desc = req.getParameter("cdescription");

        Complaint updated = new Complaint();
        updated.setCid(cid);
        updated.setCtitle(title);
        updated.setCdescription(desc);

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            dao.updateComplaint(updated);
            resp.sendRedirect("my-complaints");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
