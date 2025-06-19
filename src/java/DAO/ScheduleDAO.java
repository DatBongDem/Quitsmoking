/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Member;
import DTO.Schedule;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
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
            String sql = "INSERT INTO Schedule (IDCoach, IDMember, sessionDate, startTime, endTime, status, detail) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            int count = 1;

            for (int w = 0; w < weeks; w++) {
                LocalDate baseWeek = startDate.plusWeeks(w);
                for (DayOfWeek dow : days) {
                    LocalDate sessionDate = baseWeek.with(dow);
                    String idSchedule = "SCH" + String.format("%04d", count++);

                    ps.setString(1, idCoach);
                    ps.setString(2, idMember);
                    ps.setDate(3, java.sql.Date.valueOf(sessionDate));
                    ps.setTime(4, java.sql.Time.valueOf(startTime));
                    ps.setTime(5, java.sql.Time.valueOf(endTime));
                    ps.setString(6, "not yet");
                    ps.setString(7, "Buổi học huấn luyện");

                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
    }

    public void updateMeetLink(String idSchedule, String meetLink) throws Exception {
        String sql = "UPDATE Schedule SET meetLink = ? WHERE IDSchedule = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, meetLink);
            stmt.setString(2, idSchedule);
            stmt.executeUpdate();
        }
    }

    public static boolean updateStatusAndLink(String idSchedule, String status, String meetLink) throws Exception {
        String sql = "UPDATE Schedule SET status = ?, meetLink = ? WHERE IDSchedule = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setString(2, meetLink);
            stmt.setString(3, idSchedule);
            return stmt.executeUpdate() > 0;
        }
    }

    public static List<Schedule> getSchedulesByCoachAndMonth(String coachId, int month, int year) throws Exception {
        List<Schedule> list = new ArrayList<>();
        String sql = "SELECT s.*, m.memberName AS memberName "
                + "FROM Schedule s "
                + "JOIN Member m ON s.IDMember = m.IDMember "
                + "WHERE s.IDCoach = ? AND MONTH(s.sessionDate) = ? AND YEAR(s.sessionDate) = ? "
                + "ORDER BY s.sessionDate, s.startTime";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, coachId);
            stmt.setInt(2, month);
            stmt.setInt(3, year);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Schedule sch = new Schedule();
                sch.setIDSchedule(rs.getString("IDSchedule"));
                sch.setIDCoach(rs.getString("IDCoach"));
                sch.setIDMember(rs.getString("IDMember"));
                sch.setSessionDate(rs.getDate("sessionDate"));
                sch.setStartTime(rs.getTime("startTime"));
                sch.setEndTime(rs.getTime("endTime"));
                sch.setStatus(rs.getString("status"));
                sch.setDetail(rs.getString("detail"));
                sch.setMeetLink(rs.getString("meetLink"));
                sch.setMemberName(rs.getString("memberName"));

                list.add(sch);
            }
        }

        return list;
    }

    public static List<Schedule> getScheduleByCoachAndMonth(String idCoach, int month, int year) throws Exception {
        List<Schedule> list = new ArrayList<>();

        String sql
                = "SELECT s.*, m.name AS memberName "
                + "FROM Schedule s "
                + "JOIN Member m ON s.IDMember = m.IDMember "
                + "WHERE s.IDCoach = ? AND MONTH(s.sessionDate) = ? AND YEAR(s.sessionDate) = ? "
                + "ORDER BY s.sessionDate, s.startTime";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, idCoach);
            stmt.setInt(2, month);
            stmt.setInt(3, year);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Schedule s = new Schedule();
                s.setIDSchedule(rs.getString("IDSchedule"));
                s.setIDCoach(rs.getString("IDCoach"));
                s.setIDMember(rs.getString("IDMember"));
                s.setSessionDate(rs.getDate("sessionDate"));
                s.setStartTime(rs.getTime("startTime"));
                s.setEndTime(rs.getTime("endTime"));
                s.setStatus(rs.getString("status"));
                s.setDetail(rs.getString("detail"));
                s.setMeetLink(rs.getString("meetLink"));
                s.setMemberName(rs.getString("memberName")); // lấy từ JOIN

                list.add(s);
            }
        }

        return list;
    }
}
