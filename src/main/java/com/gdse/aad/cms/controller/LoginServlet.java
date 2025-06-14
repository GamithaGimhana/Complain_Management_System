package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.UserDAO;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            UserDAO userDAO = new UserDAO(getServletContext());
            User user = userDAO.getUserByEmail(email); // Get user by email only

            if (user != null && BCrypt.checkpw(password, user.getUpassword())) {
                // Password is correct
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("dashboard.jsp");
            } else {
                // Invalid email or password
                req.setAttribute("errorMessage", "Invalid email or password");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            throw new ServletException("Login failed", e);
        }
    }
}
