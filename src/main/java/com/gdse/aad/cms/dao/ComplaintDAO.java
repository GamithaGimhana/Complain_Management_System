package com.gdse.aad.cms.dao;

import com.gdse.aad.cms.model.Complaint;
import jakarta.servlet.ServletContext;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    public List<Complaint> getComplaintsByUser(String userId) throws Exception {
        List<Complaint> complaints = new ArrayList<>();
//        String sql = "SELECT cid, ctitle, cdescription, ccreated_at, cstatus FROM complaint WHERE user_id = ? ORDER BY ccreated_at DESC";
        String sql = "SELECT cid, ctitle, cdescription, cstatus, ccreated_at, cupdated_at FROM complaint WHERE user_id = ? ORDER BY ccreated_at DESC";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setCid(rs.getString("cid"));
                c.setCtitle(rs.getString("ctitle"));
                c.setCdescription(rs.getString("cdescription"));
                c.setCcreatedAt(rs.getString("ccreated_at"));
                c.setCupdatedAt(rs.getString("cupdated_at"));
                c.setCstatus(rs.getString("cstatus"));
                complaints.add(c);
            }
        }
        return complaints;
    }

    public Complaint getComplaintById(String cid) throws Exception {
        String sql = "SELECT cid, user_id, ctitle, cdescription, cstatus, ccreated_at FROM complaint WHERE cid = ?";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Complaint c = new Complaint();
                c.setCid(rs.getString("cid"));
                c.setUserId(rs.getString("user_id"));
                c.setCtitle(rs.getString("ctitle"));
                c.setCdescription(rs.getString("cdescription"));
                c.setCstatus(rs.getString("cstatus"));
                c.setCcreatedAt(rs.getString("ccreated_at"));
                return c;
            }
        }
        return null;
    }

    public boolean updateComplaint(Complaint complaint) throws Exception {
        String sql = "UPDATE complaint SET ctitle = ?, cdescription = ? WHERE cid = ? AND cstatus = 'PENDING'";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, complaint.getCtitle());
            ps.setString(2, complaint.getCdescription());
            ps.setString(3, complaint.getCid());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteComplaintById(String cid, String userId) throws Exception {
        String sql = "DELETE FROM complaint WHERE cid = ? AND user_id = ? AND cstatus = 'PENDING'";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cid);
            ps.setString(2, userId);
            return ps.executeUpdate() > 0;
        }
    }

    public List<Complaint> getAllComplaints() throws Exception {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT c.cid, c.ctitle, c.cdescription, c.cstatus, c.cremarks, c.ccreated_at, u.uname " +
                "FROM complaint c JOIN user u ON c.user_id = u.uid ORDER BY c.ccreated_at DESC";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setCid(rs.getString("cid"));
                c.setCtitle(rs.getString("ctitle"));
                c.setCdescription(rs.getString("cdescription"));
                c.setCstatus(rs.getString("cstatus"));
                c.setCremarks(rs.getString("cremarks"));
                c.setCcreatedAt(rs.getString("ccreated_at"));
                c.setUsername(rs.getString("uname"));
                complaints.add(c);
            }
        }
        return complaints;
    }

    public boolean updateStatusAndRemarks(String cid, String status, String remarks) throws Exception {
        String sql = "UPDATE complaint SET cstatus = ?, cremarks = ? WHERE cid = ?";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, remarks);
            ps.setString(3, cid);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteComplaintByAdmin(String cid) throws Exception {
        String sql = "DELETE FROM complaint WHERE cid = ?";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cid);
            return ps.executeUpdate() > 0;
        }
    }


}
