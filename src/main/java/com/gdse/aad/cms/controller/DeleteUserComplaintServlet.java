package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteUserComplaintServlet", urlPatterns = {"/delete-user-complaint"})
public class DeleteUserComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        User user = (User) req.getSession().getAttribute("user");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            dao.deleteComplaintById(cid, user.getUid());
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("user-complaints");
    }
}
