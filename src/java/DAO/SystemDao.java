/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.BlogPost;
import DTO.QuitPlan;
import static Utils.DBUtils.getConnection;
import java.sql.Date;
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
            ResultSet rs = ps.executeQuery();

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

    public List<BlogPost> searchByTitle(String keyword) throws ClassNotFoundException {
        List<BlogPost> list = new ArrayList<>();
        String sql = "SELECT * FROM BlogPost WHERE title LIKE ?";

        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String id = rs.getString("IDPost");
                String idmem = rs.getString("IDMember");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String image = rs.getString("image");
                Date date = rs.getDate("publishDate");
                BlogPost post = new BlogPost(id, idmem, title, content, image, date);
                list.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        SystemDao dao = new SystemDao();
        List<BlogPost> results = dao.searchByTitle("h");

        for (BlogPost post : results) {
            System.out.println(post.getTitle() + " - " + post.getPublishDate());
        }
    }
}
