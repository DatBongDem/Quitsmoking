/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static Utils.DBUtils.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import DTO.Coach;
import DTO.Member;
import Utils.DBUtils;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen
 */
public class CoachDao {

    public Coach checkLogin(String username, String pass) throws ClassNotFoundException {
        String sql = "SELECT * FROM Coach WHERE IDCoach = ? AND password = ?";
        Connection con = null;
        Coach coach = null;

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                coach = new Coach();
                coach.setIDCoach(rs.getString(1));             // IDCoach
                coach.setPassword(rs.getString(2));            // password
                coach.setCoachName(rs.getString(3));           // coachName
                coach.setPhone(rs.getString(4));                // phone
                coach.setEmail(rs.getString(5));                // email
                coach.setAddress(rs.getString(6));              // address
                coach.setDateOfBirth(rs.getDate(7));  // dateOfBirth (java.sql.Date -> LocalDate)
                coach.setSpecialization(rs.getString(8));       // specialization
                coach.setExperienceYears(rs.getInt(9));          // experienceYears

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coach;
    }

    public List<Member> getMembersForCoach(String coachId) throws SQLException, ClassNotFoundException {
        List<Member> members = new ArrayList<>();
        String sql = "SELECT * FROM Member WHERE IDCoach = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, coachId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Member m = new Member();
                m.setIDMember(rs.getString("IDMember"));
                m.setMemberName(rs.getString("memberName"));
                m.setGender(rs.getString("gender"));
                m.setPhone(rs.getString("phone"));
                m.setEmail(rs.getString("email"));
                m.setAddress(rs.getString("address"));
                m.setDateOfBirth(rs.getDate("dateOfBirth"));
                m.setJoinDate(rs.getDate("joinDate"));
                m.setImage(rs.getString("image"));
                m.setPoint(rs.getInt("point"));
                m.setIDCoach(rs.getString("IDCoach"));
                m.setSubscription(rs.getString("subcription"));
                m.setStatus(rs.getString("status"));
                members.add(m);
            }
        }
        return members;
    }

    public String getCoachIdFromMember(String idMem) throws ClassNotFoundException {
        String sql = "SELECT c.IDCoach\n"
                + "FROM Member m\n"
                + "JOIN Coach c ON m.IDCoach = c.IDCoach\n"
                + "WHERE m.IDMember = ?;";

        String coachName = null;

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, idMem);  // Thiết lập giá trị IDMember vào câu lệnh SQL
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                coachName = rs.getString("IDCoach");  // Lấy tên huấn luyện viên từ kết quả truy vấn
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return coachName;
    }

    public Coach getCoachById(String idCoach) throws ClassNotFoundException {
        Coach coach = null;
        String query = "SELECT * FROM dbo.Coach WHERE IDCoach = ?";

        try {

            PreparedStatement st = getConnection().prepareStatement(query);
            // Set the IDCoach parameter in the query
            st.setString(1, idCoach);
            ResultSet resultSet = st.executeQuery();

            while (resultSet.next()) {
                coach = new Coach();
                coach.setIDCoach(resultSet.getString("IDCoach"));
                coach.setPassword(resultSet.getString("password"));
                coach.setCoachName(resultSet.getString("coachName"));
                coach.setGender(resultSet.getString("gender"));
                coach.setPhone(resultSet.getString("phone"));
                coach.setEmail(resultSet.getString("email"));
                coach.setAddress(resultSet.getString("address"));
                coach.setImage(resultSet.getString("image"));
                coach.setDateOfBirth(resultSet.getDate("dateOfBirth"));
                coach.setSpecialization(resultSet.getString("specialization"));
                coach.setExperienceYears(resultSet.getInt("experienceYears"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return coach;
    }
 public boolean updateCoachProfile(Coach coach) throws ClassNotFoundException {
        String sql = "UPDATE Coach SET password = ?, coachName = ?, gender = ?, phone = ?, email = ?, address = ?, dateOfBirth = ?, specialization = ?, experienceYears = ? WHERE IDCoach = ?";

        try  {
            PreparedStatement ps = getConnection().prepareStatement(sql);

            ps.setString(1, coach.getPassword());
            ps.setString(2, coach.getCoachName());
            ps.setString(3, coach.getGender());
            ps.setString(4, coach.getPhone());
            ps.setString(5, coach.getEmail());
            ps.setString(6, coach.getAddress());
            ps.setDate(7, coach.getDateOfBirth());
            ps.setString(8, coach.getSpecialization());
            ps.setInt(9, coach.getExperienceYears());
            ps.setString(10, coach.getIDCoach());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void main(String[] args) throws ClassNotFoundException {
        CoachDao coachDAO = new CoachDao();
        Coach coaches = coachDAO.getCoachById("C000001");

        System.out.println(coaches);
    }
}
