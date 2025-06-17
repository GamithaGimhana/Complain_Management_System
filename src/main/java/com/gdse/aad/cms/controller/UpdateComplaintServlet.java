package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.ComplaintDAO;
import com.gdse.aad.cms.model.Complaint;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//@WebServlet(name = "UpdateComplaintServlet", urlPatterns = {"/update-complaint"})
public class UpdateComplaintServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            Complaint complaint = dao.getComplaintById(cid);
            req.setAttribute("complaint", complaint);
            req.getRequestDispatcher("update_complaint.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String status = req.getParameter("status");
        String remarks = req.getParameter("remarks");

        try {
            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            dao.updateStatusAndRemarks(cid, status, remarks);
            resp.sendRedirect("all-complaints");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}


