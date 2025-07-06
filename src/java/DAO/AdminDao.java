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

import DTO.Admin;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {

    public Admin login(String adminID, String password) throws Exception {
        String sql = "SELECT * FROM Admin WHERE adminID = ? AND password = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, adminID);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminID(rs.getString("adminID"));
                admin.setPassword(rs.getString("password"));
                admin.setFullName(rs.getString("fullName"));
                admin.setEmail(rs.getString("email"));
                return admin;
            }
        }
        return null;
    }

    // (Optional) Get admin by ID
    public Admin getAdminByID(String adminID) throws Exception {
        String sql = "SELECT * FROM Admin WHERE adminID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, adminID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminID(rs.getString("adminID"));
                admin.setPassword(rs.getString("password"));
                admin.setFullName(rs.getString("fullName"));
                admin.setEmail(rs.getString("email"));
                return admin;
            }
        }
        return null;
    }
}
