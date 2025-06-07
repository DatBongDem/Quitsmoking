/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Nghia
 */
import java.sql.Date;
import java.time.LocalDate;

public class Member {

    private String IDMember;
    private String password;
    private String memberName;
    private String phone;
    private String email;
    private String address;
    private Date dateOfBirth;
    private Date joinDate;
    private String avarta;
    private String IDCoach;
    private String subscription;
    private String status;

    public Member() {
    }

    // Constructor không tham số
    public Member(String IDMember, String password, String memberName, String phone, String email, String address, Date dateOfBirth, Date joinDate, String avarta, String IDCoach, String subscription, String status) {   
        this.IDMember = IDMember;
        this.password = password;
        this.memberName = memberName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.joinDate = joinDate;
        this.avarta = avarta;
        this.IDCoach = IDCoach;
        this.subscription = subscription;
        this.status = status;
    }

    public String getIDMember() {
        return IDMember;
    }

    public void setIDMember(String IDMember) {
        this.IDMember = IDMember;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getAvarta() {
        return avarta;
    }

    public void setAvarta(String avarta) {
        this.avarta = avarta;
    }

    public String getIDCoach() {
        return IDCoach;
    }

    public void setIDCoach(String IDCoach) {
        this.IDCoach = IDCoach;
    }

    public String getSubscription() {
        return subscription;
    }

    public void setSubscription(String subscription) {
        this.subscription = subscription;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // toString() (nếu cần)
    @Override
    public String toString() {
        return "Member{"
                + "IDMember='" + IDMember + '\''
                + ", password='" + password + '\''
                + ", memberName='" + memberName + '\''
                + ", phone='" + phone + '\''
                + ", email='" + email + '\''
                + ", address='" + address + '\''
                + ", dateOfBirth=" + dateOfBirth
                + ", joinDate=" + joinDate
                + ", IDCoach='" + IDCoach + '\''
                + ", subscription='" + subscription + '\''
                + '}';
    }
}
