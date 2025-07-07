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
import DTO.Member;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    public Admin login(String IDAdmin, String password) throws Exception {
        String sql = "SELECT * FROM Admin WHERE IDAdmin = ? AND password = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, IDAdmin);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setIDAdmin(rs.getString("IDAdmin"));
                admin.setPassword(rs.getString("password"));
                admin.setAdminName(rs.getString("adminName"));
                admin.setGender(rs.getString("gender"));
                admin.setPhone(rs.getString("phone"));
                admin.setEmail(rs.getString("email"));
                admin.setAddress(rs.getString("address"));
                admin.setImage(rs.getString("image"));
                admin.setDateOfBirth(rs.getDate("dateOfBirth"));
                return admin;
            }
        }
        return null;
    }

    public Admin getAdminByID(String IDAdmin) throws Exception {
        String sql = "SELECT * FROM Admin WHERE IDAdmin = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, IDAdmin);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setIDAdmin(rs.getString("IDAdmin"));
                admin.setPassword(rs.getString("password"));
                admin.setAdminName(rs.getString("adminName"));
                admin.setGender(rs.getString("gender"));
                admin.setPhone(rs.getString("phone"));
                admin.setEmail(rs.getString("email"));
                admin.setAddress(rs.getString("address"));
                admin.setImage(rs.getString("image"));
                admin.setDateOfBirth(rs.getDate("dateOfBirth"));
                return admin;
            }
        }
        return null;
    }

    public List<Member> getAllMembers() {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT IDMember, password, memberName, gender, phone, email, address, "
                + "dateOfBirth, joinDate, image, point, IDCoach, subcription, status "
                + "FROM dbo.Member "
                + "WHERE status <> ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "2");  // chỉ lấy những member có status khác "2"

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Member m = new Member();
                    m.setIDMember(rs.getString("IDMember"));
                    m.setPassword(rs.getString("password"));
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

                    list.add(m);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Bạn có thể log lỗi hoặc ném exception tuỳ nhu cầu
        }

        return list;
    }

    public boolean deleteMember(String idMember) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE dbo.Member SET status = ? WHERE IDMember = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "2");          // status mới
            ps.setString(2, idMember);     // ID của member

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public boolean updateMember(Member member) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rowsAffected = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE Member SET "
                    + "password = ?, memberName = ?, gender = ?, phone = ?, email = ?, "
                    + "address = ?, dateOfBirth = ?, joinDate = ?, image = ?, point = ?, "
                    + "IDCoach = ?, subcription = ?, status = ? "
                    + "WHERE IDMember = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, member.getPassword());
            stmt.setString(2, member.getMemberName());
            stmt.setString(3, member.getGender());
            stmt.setString(4, member.getPhone());
            stmt.setString(5, member.getEmail());
            stmt.setString(6, member.getAddress());
            stmt.setDate(7, new java.sql.Date(member.getDateOfBirth().getTime()));
            stmt.setDate(8, new java.sql.Date(member.getJoinDate().getTime()));
            stmt.setString(9, member.getImage());
            stmt.setInt(10, member.getPoint());
            stmt.setString(11, member.getIDCoach());
            stmt.setString(12, member.getSubscription());
            stmt.setString(13, member.getStatus());
            stmt.setString(14, member.getIDMember());

            rowsAffected = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
        return rowsAffected > 0;
    }
    public List<Member> searchMembers(String keyword) {
    List<Member> list = new ArrayList<>();
    String sql = "SELECT IDMember, password, memberName, gender, phone, email, address, "
               + "dateOfBirth, joinDate, image, point, IDCoach, subcription, status "
               + "FROM dbo.Member "
               + "WHERE status <> ? AND memberName LIKE ?";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        conn = DBUtils.getConnection();
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, "2");                       // loại bỏ những record đã "xóa"
        stmt.setString(2, "%" + keyword + "%");       // tìm kiếm tên chứa keyword
        rs = stmt.executeQuery();
        while (rs.next()) {
            Member m = new Member();
            m.setIDMember(   rs.getString("IDMember"));
            m.setPassword(   rs.getString("password"));
            m.setMemberName( rs.getString("memberName"));
            m.setGender(     rs.getString("gender"));
            m.setPhone(      rs.getString("phone"));
            m.setEmail(      rs.getString("email"));
            m.setAddress(    rs.getString("address"));
            m.setDateOfBirth(rs.getDate("dateOfBirth"));
            m.setJoinDate(   rs.getDate("joinDate"));
            m.setImage(      rs.getString("image"));
            m.setPoint(      rs.getInt("point"));
            m.setIDCoach(    rs.getString("IDCoach"));
            m.setSubscription(rs.getString("subcription"));
            m.setStatus(     rs.getString("status"));
            list.add(m);
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try { if (rs   != null) rs.close();   } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
    return list;
}
}
