package com.gdse.aad.cms.dao;

import com.gdse.aad.cms.model.Complaint;
import jakarta.servlet.ServletContext;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ComplaintDAO {
    private BasicDataSource ds;

    public ComplaintDAO(ServletContext context) {
        this.ds = (BasicDataSource) context.getAttribute("ds");
    }

    public boolean saveComplaint(Complaint complaint) throws Exception {
        String sql = "INSERT INTO complaint (cid, user_id, ctitle, cdescription) VALUES (?, ?, ?, ?)";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, complaint.getCid());
            ps.setString(2, complaint.getUserId());
            ps.setString(3, complaint.getCtitle());
            ps.setString(4, complaint.getCdescription());
            return ps.executeUpdate() > 0;
        }
    }
}
