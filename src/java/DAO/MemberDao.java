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
import java.util.ArrayList;
import java.util.List;

import DTO.Member;
import java.sql.Date;

/**
 *
 * @author Nguyen Tien Dat
 */
public class MemberDao {

    public Member checkLogin(String username, String pass) throws ClassNotFoundException {
        String sql = "SELECT *\n"
                + "FROM Member\n"
                + "WHERE IDMember = ? AND password = ?;";
        Connection con = null;
        Member member = null;

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String id = rs.getString(1); // IDMember
                String password = rs.getString(2); // password
                String name = rs.getString(3); // memberName
                String phone = rs.getString(4); // phone
                String email = rs.getString(5); // email
                String address = rs.getString(6); // address
                Date dob = rs.getDate(7); // dateOfBirth
                Date joinDate = rs.getDate(8); // joinDate
                String avata = rs.getString(9);
                String coach = rs.getString(10); // IDCoach
                String subscription = rs.getString(11); // subscription
                String status = rs.getString(12);

                member = new Member(id, password, name, phone, email, address, dob, joinDate, avata, coach, subscription, status);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }

    public void resigter(String id, String password, String memberName, String phone, String email, String address, String dateofBirth) throws ClassNotFoundException {
        String sql = "INSERT INTO Member\n"
                + "(IDMember, password, memberName, phone, email, address, dateOfBirth, joinDate )\n"
                + "VALUES\n"
                + "(?, ?, ?, ?, ?, ?,?, ?);";

        try {
            PreparedStatement pstmt = getConnection().prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, memberName);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, address);
            pstmt.setString(7, dateofBirth);

            java.util.Date now = new java.util.Date();
            pstmt.setDate(8, new java.sql.Date(now.getTime()));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public List<String> getAllMemberIds() throws ClassNotFoundException {
        List<String> memberIds = new ArrayList<>();
        String sql = "SELECT IDMember FROM Member";  // Tên bảng chính xác theo DB của bạn

        try {
            PreparedStatement pstmt = getConnection().prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String id = rs.getString(1);
                memberIds.add(id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return memberIds;
    }

    public String getIDMemberByUsername(String username) throws SQLException, ClassNotFoundException {
        String sql = "SELECT IDMember FROM dbo.Member WHERE memberName = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            // Set tham số username vào PreparedStatement
            ps.setString(1, username);

            // Thực thi truy vấn và lấy kết quả
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);  // Trả về IDMember
            } else {
                return null;  // Trường hợp không tìm thấy username
            }
        } catch (SQLException e) {
            throw new SQLException("Error while fetching IDMember: " + e.getMessage(), e);
        }
    }

    public List<Member> getMembersByCoach(String idCoach) {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM Member WHERE IDCoach = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, idCoach);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Member m = new Member();
                m.setIDMember(rs.getString("IDMember"));
                m.setMemberName(rs.getString("memberName"));
                // set các trường khác nếu cần
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Member getUserByUsername(String memberID) throws ClassNotFoundException, SQLException {
        String sql = "SELECT* FROM Member WHERE IDMember = ?";
        Member member = null;
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            // Kết nối tới cơ sở dữ liệu

            // Truy vấn lấy thông tin người dùng từ cơ sở dữ liệu
            ps.setString(1, memberID); // Gán IDMember từ tham số

            // Thực hiện truy vấn và lấy kết quả
            ResultSet rs = ps.executeQuery();

            // Kiểm tra nếu có kết quả
            if (rs.next()) {
                // Tạo đối tượng Member thông qua constructor và chuyển đổi java.sql.Date sang java.util.Date
                member = new Member(
                    rs.getString("IDMember"),   // IDMember là String
                    rs.getString("password"),
                    rs.getString("memberName"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("address"),
                    rs.getDate("dateOfBirth"), // Lấy java.sql.Date từ ResultSet
                    rs.getDate("joinDate"),    // Lấy java.sql.Date từ ResultSet
                    rs.getString("image"),
                    rs.getString("IDCoach"),
                    rs.getString("subcription"),
                    rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Trả về đối tượng Member chứa thông tin người dùng
        return member;
    }
     

}
