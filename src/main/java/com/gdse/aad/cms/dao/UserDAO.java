package com.gdse.aad.cms.dao;

import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletContext;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;

public class UserDAO {
    private BasicDataSource ds;

    public UserDAO(ServletContext servletContext) {
        this.ds = (BasicDataSource) servletContext.getAttribute("ds");

    }

    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM user WHERE uemail=?";
        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUid(rs.getString("uid"));
                user.setUname(rs.getString("uname"));
                user.setUemail(rs.getString("uemail"));
                user.setUpassword(rs.getString("upassword")); // Hashed password
                user.setUrole(rs.getString("urole"));
                return user;
            }
        }
        return null;
    }

    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO user (uid, uname, uemail, upassword, urole) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUid());
            ps.setString(2, user.getUname());
            ps.setString(3, user.getUemail());
            ps.setString(4, user.getUpassword()); // Hashed
            ps.setString(5, user.getUrole());

            return ps.executeUpdate() > 0;
        } catch (SQLIntegrityConstraintViolationException e) {
            // Email already exists
            return false;
        }
    }


}

