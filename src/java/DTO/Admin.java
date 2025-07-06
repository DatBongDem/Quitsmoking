/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Nguyen Tien Dat
 */


public class Admin {
    private String adminID;
    private String password;
    private String fullName;
    private String email;

    public Admin() {
    }

    public Admin(String adminID, String password, String fullName, String email) {
        this.adminID = adminID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
    }

    public String getAdminID() { return adminID; }
    public void setAdminID(String adminID) { this.adminID = adminID; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
