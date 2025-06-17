/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.BlogPost;
import DTO.Payment;
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

    public List<Payment> getAllPayments() throws ClassNotFoundException {
        List<Payment> payments = new ArrayList<>();

        String sql = "SELECT * FROM Payment"; // Câu lệnh SQL để lấy tất cả các phương thức thanh toán

        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
            // Duyệt qua kết quả và thêm vào list
            while (rs.next()) {
                String idPayment = rs.getString("IDPayment");
                String method = rs.getString("method");
                 String logo = rs.getString("logo");  // Lấy logo từ cơ sở dữ liệu
                Payment payment = new Payment(idPayment, method, logo);
                payments.add(payment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payments;
    }
   public boolean insertQuitPlanRegistration(String idMember,String iQuitPlan, String status, String registerDate) throws ClassNotFoundException {
        String sql = "INSERT INTO dbo.QuitPlanRegistration (IDMember, IDQuitPlan, status, registerDate)\n" +
"VALUES (?, ?, ?, ?);";
        
        try  {
              PreparedStatement ps = getConnection().prepareStatement(sql);
            // Thiết lập các tham số cho PreparedStatement
            ps.setString(1, idMember);
      
            ps.setString(2, iQuitPlan);
            ps.setString(3, status);
            ps.setString(4, registerDate);  // Lưu ý: Chuyển kiểu dữ liệu nếu cần, có thể dùng java.sql.Date

            // Thực thi câu lệnh SQL
            int result = ps.executeUpdate();
            return result > 0; // Trả về true nếu số dòng bị ảnh hưởng > 0
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Nếu có lỗi thì trả về false
        }
    }
   
}
