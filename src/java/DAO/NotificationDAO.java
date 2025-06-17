/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Notification;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Tien Dat
 */
public class NotificationDAO {

    public static List<Notification> getNotificationsForMember(String memberId) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT n.IDNotification, n.type, n.message, mn.date "
                + "FROM Notification n "
                + "JOIN MemberNotification mn ON n.IDNotification = mn.IDNotification "
                + "WHERE mn.IDMember = ? "
                + "ORDER BY mn.date DESC";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, memberId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Notification n = new Notification();
                n.setIdNotification(rs.getString("IDNotification"));
                n.setType(rs.getString("type"));
                n.setMessage(rs.getString("message"));
                n.setDate(rs.getDate("date"));
                list.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
