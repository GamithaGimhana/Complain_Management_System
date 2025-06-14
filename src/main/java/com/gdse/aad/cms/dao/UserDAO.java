package com.gdse.aad.cms.dao;

import com.gdse.aad.cms.model.User;
import jakarta.servlet.ServletContext;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;

public class UserDAO {
    private BasicDataSource ds;

    public UserDAO(ServletContext context) {
        this.ds = (BasicDataSource) context.getAttribute("ds");
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

}

