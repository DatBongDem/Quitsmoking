/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author Nguyen Tien Dat
 */
import DTO.ProgressLog;
import java.sql.*;

import Utils.DBUtils;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProgressLogDAO {

    public static void insertProgressLog(ProgressLog log) {
        String sql = "INSERT INTO ProgressLog (IDMember, logDate, numberOfCigarettes, notes) VALUES (?, ?, ?, ?)";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, log.getIdMember());
            ps.setDate(2, log.getLogDate());
            ps.setInt(3, log.getNumberOfCigarettes());
            ps.setString(4, log.getNotes());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Integer getCigarettesOnDate(String idMember, int daysOffset) {
        String sql = "SELECT numberOfCigarettes FROM ProgressLog WHERE IDMember = ? AND logDate = ?";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            LocalDate targetDate = LocalDate.now().plusDays(daysOffset);
            ps.setString(1, idMember);
            ps.setDate(2, Date.valueOf(targetDate));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("numberOfCigarettes");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Integer getCigarettesOnFirstDay(String idMember) {
        String sql = "SELECT TOP 1 numberOfCigarettes FROM ProgressLog WHERE IDMember = ? ORDER BY logDate ASC";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("numberOfCigarettes");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Date getStartDate(String idMember) {
        String sql = "SELECT TOP 1 logDate FROM ProgressLog WHERE IDMember = ? ORDER BY logDate ASC";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDate("logDate");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<ProgressLog> getAllLogsForMember(String idMember) {
        List<ProgressLog> list = new ArrayList<>();
        String sql = "SELECT * FROM ProgressLog WHERE IDMember = ? ORDER BY logDate DESC";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProgressLog log = new ProgressLog(
                        rs.getInt("IDLog"),
                        rs.getString("IDMember"),
                        rs.getDate("logDate"),
                        rs.getInt("numberOfCigarettes"),
                        rs.getString("notes")
                    );
                    list.add(log);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
