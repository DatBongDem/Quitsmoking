/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;
import java.sql.Date;
/**
 *
 * @author Nghia
 */
public class ProgressLog {
    private int idLog;
    private String idMember;
    private String idCoach;
    private Date startDate;
    private Date endDate;
    private String type;
    private String qs1;
    private String qs2;
    private String qs3;
    private String qs4;
    private String qs5;
    private String qs6;
    private String qs7;
    private String qs8;
    private String qs9;
    private String qs10;
    
    // Constructor
    public ProgressLog(int idLog, String idMember, String idCoach, Date startDate, Date endDate, String type, 
                       String qs1, String qs2, String qs3, String qs4, String qs5, String qs6, 
                       String qs7, String qs8, String qs9, String qs10) {
        this.idLog = idLog;
        this.idMember = idMember;
        this.idCoach = idCoach;
        this.startDate = startDate;
        this.endDate = endDate;
        this.type = type;
        this.qs1 = qs1;
        this.qs2 = qs2;
        this.qs3 = qs3;
        this.qs4 = qs4;
        this.qs5 = qs5;
        this.qs6 = qs6;
        this.qs7 = qs7;
        this.qs8 = qs8;
        this.qs9 = qs9;
        this.qs10 = qs10;
    }
    
    // Getter và Setter cho các thuộc tính
    public int getIdLog() { return idLog; }
    public void setIdLog(int idLog) { this.idLog = idLog; }

    public String getIdMember() { return idMember; }
    public void setIdMember(String idMember) { this.idMember = idMember; }

    public String getIdCoach() { return idCoach; }
    public void setIdCoach(String idCoach) { this.idCoach = idCoach; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getQs1() { return qs1; }
    public void setQs1(String qs1) { this.qs1 = qs1; }

    public String getQs2() { return qs2; }
    public void setQs2(String qs2) { this.qs2 = qs2; }

    public String getQs3() { return qs3; }
    public void setQs3(String qs3) { this.qs3 = qs3; }

    public String getQs4() { return qs4; }
    public void setQs4(String qs4) { this.qs4 = qs4; }

    public String getQs5() { return qs5; }
    public void setQs5(String qs5) { this.qs5 = qs5; }

    public String getQs6() { return qs6; }
    public void setQs6(String qs6) { this.qs6 = qs6; }

    public String getQs7() { return qs7; }
    public void setQs7(String qs7) { this.qs7 = qs7; }

    public String getQs8() { return qs8; }
    public void setQs8(String qs8) { this.qs8 = qs8; }

    public String getQs9() { return qs9; }
    public void setQs9(String qs9) { this.qs9 = qs9; }

    public String getQs10() { return qs10; }
    public void setQs10(String qs10) { this.qs10 = qs10; }
}
