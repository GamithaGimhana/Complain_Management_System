package com.gdse.aad.cms.model;

public class User {
    private String uid;
    private String uname;
    private String uemail;
    private String upassword;
    private String urole;

    public User() {
    }

    public User(String uid, String uname, String uemail, String upassword, String urole) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.upassword = upassword;
        this.urole = urole;
    }

    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public String getUname() {
        return uname;
    }
    public void setUname(String uname) {
        this.uname = uname;
    }
    public String getUemail() {
        return uemail;
    }
    public void setUemail(String uemail) {
        this.uemail = uemail;
    }
    public String getUpassword() {
        return upassword;
    }
    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }
    public String getUrole() {
        return urole;
    }
    public void setUrole(String urole) {
        this.urole = urole;
    }

}
