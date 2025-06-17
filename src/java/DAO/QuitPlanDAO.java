/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.QuitPlan;
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
public class QuitPlanDAO {
    public static List<QuitPlan> getAllPlans() {
        List<QuitPlan> list = new ArrayList<>();
        String sql = "SELECT * FROM QuitPlan";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                QuitPlan plan = new QuitPlan();
                plan.setIdQuitPlan(rs.getString("IDQuitPlan"));
                plan.setPeriodOfTime(rs.getInt("periodOfTime"));
                plan.setGoals(rs.getString("goals"));
                plan.setProgress(rs.getString("progress"));
                plan.setPrice(rs.getInt("price"));
                list.add(plan);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static QuitPlan getPlanById(String id) {
        String sql = "SELECT * FROM QuitPlan WHERE IDQuitPlan = ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    QuitPlan plan = new QuitPlan();
                    plan.setIdQuitPlan(rs.getString("IDQuitPlan"));
                    plan.setPeriodOfTime(rs.getInt("periodOfTime"));
                    plan.setGoals(rs.getString("goals"));
                    plan.setProgress(rs.getString("progress"));
                    plan.setPrice(rs.getInt("price"));
                    return plan;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
