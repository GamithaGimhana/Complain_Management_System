package com.gdse.aad.cms.model;

public class Complaint {
    private String cid;
    private String userId;
    private String ctitle;
    private String cdescription;
    private String cstatus;
    private String ccreatedAt;
    private String cupdatedAt;
    private String cremarks;
    private String username; // Name of the user who submitted the complaint

    public Complaint() {
    }

    public Complaint(String cid, String userId, String ctitle, String cdescription, String cstatus, String ccreatedAt, String cremarks, String username) {
        this.cid = cid;
        this.userId = userId;
        this.ctitle = ctitle;
        this.cdescription = cdescription;
        this.cstatus = cstatus;
        this.ccreatedAt = ccreatedAt;
        this.cremarks = cremarks;
    }

    public String getCid() {
        return cid;
    }
    public void setCid(String cid) {
        this.cid = cid;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getCtitle() {
        return ctitle;
    }
    public void setCtitle(String ctitle) {
        this.ctitle = ctitle;
    }
    public String getCdescription() {
        return cdescription;
    }
    public void setCdescription(String cdescription) {
        this.cdescription = cdescription;
    }
    public String getCstatus() {
        return cstatus;
    }
    public void setCstatus(String cstatus) {
        this.cstatus = cstatus;
    }
    public String getCcreatedAt() {
        return ccreatedAt;
    }
    public void setCcreatedAt(String ccreatedAt) {
        this.ccreatedAt = ccreatedAt;
    }
    public String getCupdatedAt() {
        return cupdatedAt;
    }
    public void setCupdatedAt(String cupdatedAt) {
        this.cupdatedAt = cupdatedAt;
    }
    public String getCremarks() {
        return cremarks;
    }
    public void setCremarks(String cremarks) {
        this.cremarks = cremarks;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

}
