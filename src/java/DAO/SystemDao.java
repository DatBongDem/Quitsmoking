/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.QuitPlan;
import static Utils.DBUtils.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nghia
 */
public class SystemDao {
      public List<QuitPlan> getAllQuitPlans() throws ClassNotFoundException {
        List<QuitPlan> list = new ArrayList<>();
        String query = "SELECT IDQuitPlan, periodOfTime, goals, progress, price FROM QuitPlan";

        try {
            
            PreparedStatement ps = getConnection().prepareStatement(query);
             ResultSet rs = ps.executeQuery() ;

            while (rs.next()) {
                QuitPlan plan = new QuitPlan();
                plan.setIdQuitPlan(rs.getString("IDQuitPlan"));
                plan.setPeriodOfTime(rs.getInt("periodOfTime"));
                plan.setGoals(rs.getString("goals"));
                plan.setProgress(rs.getString("progress"));
                plan.setPrice(rs.getDouble("price"));

                list.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
     
}

