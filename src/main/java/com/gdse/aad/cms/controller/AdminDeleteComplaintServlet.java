package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

//@WebServlet(name = "AdminDeleteComplaintServlet", urlPatterns = {"/admin-delete-complaint"})
public class AdminDeleteComplaintServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        // Check if admin is logged in
        if (user == null || !"ADMIN".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String cid = req.getParameter("cid");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            dao.deleteComplaintByAdmin(cid);
        } catch (Exception e) {
            throw new ServletException("Failed to delete complaint", e);
        }

        resp.sendRedirect("all-complaints");
    }
}
