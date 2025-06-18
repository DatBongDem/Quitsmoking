/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Member;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Arrays;

import java.util.List;

/**
 *
 * @author Nguyen Tien Dat
 */
public class ScheduleDAO {

    public static boolean hasSchedule(String idMember) {
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT COUNT(*) FROM Schedule WHERE IDMember = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, idMember);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void createScheduleForMember(Member member, LocalDate startDate, LocalTime startTime, String selectedDays) throws Exception {
        String idMember = member.getIDMember();
        String idCoach = member.getIDCoach();
        String status = member.getStatus();
        int weeks;
        switch (status.toLowerCase()) {
            case "silver":
                weeks = 4;
                break;
            case "gold":
                weeks = 12;
                break;
            case "diamond":
                weeks = 24;
                break;
            default:
                throw new Exception("Gói học không hợp lệ.");
        }

        LocalTime endTime = startTime.plusHours(2);
        List<DayOfWeek> days;
        if ("246".equals(selectedDays)) {
            days = Arrays.asList(DayOfWeek.MONDAY, DayOfWeek.WEDNESDAY, DayOfWeek.FRIDAY);
        } else {
            days = Arrays.asList(DayOfWeek.TUESDAY, DayOfWeek.THURSDAY, DayOfWeek.SATURDAY);
        }

        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO Schedule (IDSchedule, IDCoach, IDMember, sessionDate, startTime, endTime, status, detail) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            int count = 1;

            for (int w = 0; w < weeks; w++) {
                LocalDate baseWeek = startDate.plusWeeks(w);
                for (DayOfWeek dow : days) {
                    LocalDate sessionDate = baseWeek.with(dow);
                    String idSchedule = "SCH" + String.format("%04d", count++);

                    ps.setString(1, idSchedule);
                    ps.setString(2, idCoach);
                    ps.setString(3, idMember);
                    ps.setDate(4, java.sql.Date.valueOf(sessionDate));
                    ps.setTime(5, java.sql.Time.valueOf(startTime));
                    ps.setTime(6, java.sql.Time.valueOf(endTime));
                    ps.setString(7, "Chưa học");
                    ps.setString(8, "Buổi học huấn luyện");

                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
    }
}
