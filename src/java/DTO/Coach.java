/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;
import java.time.LocalDate;
///vdjvi fibfib igb igi ig gigi /////
/**
 *
 * @author Nghia
 */
public class Coach {
     private String IDCoach;
    private String password;
    private String coachName;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private String image;
    private Date dateOfBirth;
    private String specialization;
    private int experienceYears;

    // Constructor không tham số
    public Coach() {
    }

    // Constructor có tham số
    public Coach(String IDCoach, String password, String coachName, String gender, String phone, String email, String address,String image, Date dateOfBirth, String specialization, int experienceYears) {
        this.IDCoach = IDCoach;
        this.password = password;
        this.coachName = coachName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.specialization = specialization;
        this.experienceYears = experienceYears;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // Getter và Setter
    public String getIDCoach() {
        return IDCoach;
    }

    public void setIDCoach(String IDCoach) {
        this.IDCoach = IDCoach;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
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

   

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    @Override
    public String toString() {
        return "Coach{" + "IDCoach=" + IDCoach + ", password=" + password + ", coachName=" + coachName + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address + ", image=" + image + ", dateOfBirth=" + dateOfBirth + ", specialization=" + specialization + ", experienceYears=" + experienceYears + '}';
    }
    
}
