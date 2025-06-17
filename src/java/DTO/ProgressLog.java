/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author Nguyen Tien Dat
 */
public class ProgressLog {
    private int idLog;
    private String idMember;
    private Date logDate;
    private int numberOfCigarettes;
    private String notes;

    public ProgressLog() {}

    public ProgressLog(int idLog, String idMember, Date logDate, int numberOfCigarettes, String notes) {
        this.idLog = idLog;
        this.idMember = idMember;
        this.logDate = logDate;
        this.numberOfCigarettes = numberOfCigarettes;
        this.notes = notes;
    }

    public int getIdLog() {
        return idLog;
    }

    public void setIdLog(int idLog) {
        this.idLog = idLog;
    }

    public String getIdMember() {
        return idMember;
    }

    public void setIdMember(String idMember) {
        this.idMember = idMember;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    public int getNumberOfCigarettes() {
        return numberOfCigarettes;
    }

    public void setNumberOfCigarettes(int numberOfCigarettes) {
        this.numberOfCigarettes = numberOfCigarettes;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
