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
import java.util.List;

//@WebServlet(name = "AllComplaintsServlet", urlPatterns = {"/all-complaints"})
public class AllComplaintsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getUrole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            List<Complaint> list = dao.getAllComplaints();
            req.setAttribute("complaints", list);
            req.getRequestDispatcher("all_complaints.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

