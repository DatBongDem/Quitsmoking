/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.BlogPost;
import static Utils.DBUtils.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
 
import DTO.Member;
import Utils.DBUtils;
import java.sql.Date;

/**
 *
 * @author Nguyen Tien Dat
 */
/////abcxyz12345
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
                String gender = rs.getString(4);
                String phone = rs.getString(5); // phone
                String email = rs.getString(6); // email
                String address = rs.getString(7); // address
                Date dob = rs.getDate(8); // dateOfBirth
                Date joinDate = rs.getDate(9); // joinDate
                String avata = rs.getString(10);
                int point=rs.getInt(11);
                String coach = rs.getString(12); // IDCoach
                String subscription = rs.getString(13); // subscription
                String status = rs.getString(14);

                member = new Member(id, password, name, gender, phone, email, address, dob, joinDate, avata, point, coach, subscription, status);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }

     public void resigter(String id, String password, String memberName, String gender, String phone, 
                String email, String address, String dateofBirth) throws ClassNotFoundException {
        String sql = "INSERT INTO Member\n"
                + "(IDMember, password, memberName, gender, phone, email, address, dateOfBirth, joinDate )\n"
                + "VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            PreparedStatement pstmt = getConnection().prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, memberName);
            pstmt.setString(4, gender);
            pstmt.setString(5, phone);
            pstmt.setString(6, email);
            pstmt.setString(7, address);
            pstmt.setString(8, dateofBirth);

            java.util.Date now = new java.util.Date();
            pstmt.setDate(9, new java.sql.Date(now.getTime()));

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
                        rs.getString("IDMember"), // IDMember là String
                        rs.getString("password"),
                        rs.getString("memberName"),
                        rs.getString("gender"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getDate("dateOfBirth"), // Lấy java.sql.Date từ ResultSet
                        rs.getDate("joinDate"), // Lấy java.sql.Date từ ResultSet
                        rs.getString("image"),
                        rs.getInt("point"),
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

    public void insertBlogPost(String idPost, String idMember, String title, String content, String imagePath, LocalDate publishDate) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO BlogPost (IDPost, IDMember, title, [content], image, publishDate) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = getConnection().prepareStatement(sql);

            stmt.setString(1, idPost);
            stmt.setString(2, idMember);
            stmt.setString(3, title);
            stmt.setString(4, content);
            stmt.setString(5, imagePath); // Đây là chuỗi đường dẫn ảnh
            stmt.setDate(6, java.sql.Date.valueOf(publishDate)); // Convert LocalDate to java.sql.Date

            stmt.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<BlogPost> getAllBlogPosts() throws SQLException, ClassNotFoundException {
        List<BlogPost> blogPosts = new ArrayList<>();

        String sql = "SELECT IDPost, IDMember, title, content, image, publishDate FROM BlogPost";

        // Kết nối cơ sở dữ liệu
        try {
            PreparedStatement stmt = getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            // Duyệt qua tất cả các bài viết và thêm vào list
            while (rs.next()) {
                String idPost = rs.getString("IDPost");
                String idMember = rs.getString("IDMember");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String image = rs.getString("image");
                Date publishDate = rs.getDate("publishDate");

                // Tạo đối tượng BlogPost và thêm vào danh sách
                BlogPost post = new BlogPost(idPost, idMember, title, content, image, publishDate);
                blogPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving blog posts: " + e.getMessage());
        }

        return blogPosts;
    }

    public static boolean updateMember(Member member) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Member SET password=?, memberName=?, gender=?, phone=?, email=?, address=?, dateOfBirth=?, joinDate=?, image=?, IDCoach=?, subcription=?, status=? WHERE IDMember=?";
        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, member.getPassword());
            ps.setString(2, member.getMemberName());
            ps.setString(3, member.getGender());
            ps.setString(4, member.getPhone());
            ps.setString(5, member.getEmail());
            ps.setString(6, member.getAddress());

            // dateOfBirth
            // dateOfBirth
            if (member.getDateOfBirth() != null) {
                ps.setDate(7, member.getDateOfBirth());  // đã là java.sql.Date rồi
            } else {
                ps.setNull(7, java.sql.Types.DATE);
            }

// joinDate
            if (member.getJoinDate() != null) {
                ps.setDate(8, member.getJoinDate());  // không cần tạo lại java.sql.Date nữa
            } else {
                ps.setNull(8, java.sql.Types.DATE);
            }

            ps.setString(9, member.getImage());
            
            ps.setString(10, member.getIDCoach());
            ps.setString(11, member.getSubscription());
            ps.setString(12, member.getStatus());

            ps.setString(13, member.getIDMember());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public  Member getMemberById(String id) {
        Member member = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT * FROM Member WHERE IDMember = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setIDMember(rs.getString("IDMember"));
                member.setPassword(rs.getString("password"));
                member.setMemberName(rs.getString("memberName"));
                member.setGender(rs.getString("gender"));
                member.setPhone(rs.getString("phone"));
                member.setEmail(rs.getString("email"));
                member.setAddress(rs.getString("address"));
                member.setDateOfBirth(rs.getDate("dateOfBirth"));
                member.setJoinDate(rs.getDate("joinDate"));

                member.setImage(rs.getString("image"));

                

               
                member.setPoint(rs.getInt("point"));
                member.setIDCoach(rs.getString("IDCoach"));
                member.setSubscription(rs.getString("subcription"));
                member.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
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

        return member;
    }

}
