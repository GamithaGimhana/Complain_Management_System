package com.gdse.aad.cms.controller;

import com.gdse.aad.cms.dao.UserDAO;
import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("uname");
        String uemail = req.getParameter("uemail");
        String upassword = req.getParameter("upassword");
        String urole = req.getParameter("urole");

        // Hash password
        String hashedPassword = BCrypt.hashpw(upassword, BCrypt.gensalt());

        // Build user
        User user = new User();
        user.setUid(UUID.randomUUID().toString());
        user.setUname(uname);
        user.setUemail(uemail);
        user.setUpassword(hashedPassword);
        user.setUrole(urole);

        try {
            UserDAO userDAO = new UserDAO(getServletContext());

            boolean success = userDAO.registerUser(user);

            if (success) {
                resp.sendRedirect("login.jsp");
            } else {
                req.setAttribute("errorMessage", "Email already exists!");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException("Registration failed", e);
        }
    }
}
