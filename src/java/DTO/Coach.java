/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.time.LocalDate;

/**
 *
 * @author Nghia
 */
public class Coach {
     private String IDCoach;
    private String password;
    private String coachName;
    private String phone;
    private String email;
    private String address;
    private LocalDate dateOfBirth;
    private String specialization;
    private int experienceYears;

    // Constructor không tham số
    public Coach() {
    }

    // Constructor có tham số
    public Coach(String IDCoach, String password, String coachName, String phone, String email, String address, LocalDate dateOfBirth, String specialization, int experienceYears) {
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

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
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
}
