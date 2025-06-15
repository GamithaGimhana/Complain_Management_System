package com.gdse.aad.cms.model;

public class Complaint {
    private String cid;
    private String userId;
    private String ctitle;
    private String cdescription;

    public Complaint() {
    }

    public Complaint(String cid, String userId, String ctitle, String cdescription) {
        this.cid = cid;
        this.userId = userId;
        this.ctitle = ctitle;
        this.cdescription = cdescription;
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
}
