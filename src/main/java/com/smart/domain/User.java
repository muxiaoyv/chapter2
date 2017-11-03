package com.smart.domain;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private int userId;
    private String userName;
    private String password;
    private int permissions;
    private String lastIp;
    private String roles;
    private int credits;
    private Date lastVisit;
    private String email;

    public User(int userId, String userName, int permissions, String roles, int credits, Date lastVisit, String email) {
        this.userId = userId;
        this.userName = userName;
        this.permissions = permissions;
        this.roles = roles;
        this.credits = credits;
        this.lastVisit = lastVisit;
        this.email = email;

    }

    public User(){}

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPermissions() {
        return permissions;
    }

    public void setPermissions(int permissions) {
        this.permissions = permissions;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public Date getLastVisit() {
        return lastVisit;
    }

    public void setLastVisit(Date lastVisit) {
        this.lastVisit = lastVisit;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
