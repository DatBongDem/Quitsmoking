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
import DTO.ProgressLog;
import DTO.Question;
import java.sql.*;

import Utils.DBUtils;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProgressLogDAO {

//    public static void insertProgressLog(Question log) {
//        String sql = "INSERT INTO ProgressLog (IDMember, logDate, numberOfCigarettes, notes) VALUES (?, ?, ?, ?)";
//        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
//            ps.setString(1, log.getIdMember());
//            ps.setDate(2, log.getLogDate());
//            ps.setInt(3, log.getNumberOfCigarettes());
//            ps.setString(4, log.getNotes());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public static Integer getCigarettesOnDate(String idMember, int daysOffset) {
        String sql = "SELECT numberOfCigarettes FROM ProgressLog WHERE IDMember = ? AND logDate = ?";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            LocalDate targetDate = LocalDate.now().plusDays(daysOffset);
            ps.setString(1, idMember);
            ps.setDate(2, Date.valueOf(targetDate));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("numberOfCigarettes");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Integer getCigarettesOnFirstDay(String idMember) {
        String sql = "SELECT TOP 1 numberOfCigarettes FROM ProgressLog WHERE IDMember = ? ORDER BY logDate ASC";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("numberOfCigarettes");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Date getStartDate(String idMember) {
        String sql = "SELECT TOP 1 logDate FROM ProgressLog WHERE IDMember = ? ORDER BY logDate ASC";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDate("logDate");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static List<Question> getAllLogsForMember(String idMember) {
//        List<Question> list = new ArrayList<>();
//        String sql = "SELECT * FROM ProgressLog WHERE IDMember = ? ORDER BY logDate DESC";
//        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
//            ps.setString(1, idMember);
//            try (ResultSet rs = ps.executeQuery()) {
//                while (rs.next()) {
//                    Question log = new Question(
//                        rs.getInt("IDLog"),
//                        rs.getString("IDMember"),
//                        rs.getDate("logDate"),
//                        rs.getInt("numberOfCigarettes"),
//                        rs.getString("notes")
//                    );
//                    list.add(log);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//    
//     public static List<Question> getLogsByMember(String memberId) {
//        List<Question> list = new ArrayList<>();
//        try (Connection conn = DBUtils.getConnection()) {
//            String sql = "SELECT * FROM ProgressLog WHERE IDMember = ? ORDER BY logDate DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, memberId);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                Question log = new Question();
//                log.setLogDate(rs.getDate("logDate"));
//                log.setNumberOfCigarettes(rs.getInt("numberOfCigarettes"));
//                log.setNotes(rs.getString("notes"));
//                list.add(log);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    private static final String INSERT_SQL
            = "INSERT INTO ProgressLog "
            + "(IDMember, IDCoach, StartDate, EndDate, "
            + "qs1, qs2, qs3, qs4, qs5, qs6, qs7, qs8, qs9, qs10, "
            + "status) "
            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    /**
     * @param idMember Mã thành viên
     * @param idCoach Mã coach
     * @param endDate Ngày kết thúc (StartDate = hôm nay)
     * @param questions Mảng câu hỏi (độ dài ≤10). Các phần tử null/"" => ghi
     * NULL
     */
    public static void insertQuestions(String idMember, String idCoach,
            Date endDate, String[] questions) throws ClassNotFoundException {
        // Normalize to exactly 10 slots
        String[] qs = new String[10];
        for (int i = 0; i < 10; i++) {
            if (questions != null && i < questions.length) {
                String raw = questions[i];
                qs[i] = (raw != null && !raw.trim().isEmpty()) ? raw.trim() : null;
            } else {
                qs[i] = null;
            }
        }

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            int idx = 1;
            ps.setString(idx++, idMember);
            ps.setString(idx++, idCoach);
            // StartDate = ngày hiện tại
            ps.setDate(idx++, new Date(System.currentTimeMillis()));
            // EndDate = tham số truyền vào
            ps.setDate(idx++, endDate);

            // qs1..qs10
            for (int i = 0; i < 10; i++) {
                if (qs[i] != null) {
                    ps.setString(idx++, qs[i]);
                } else {
                    ps.setNull(idx++, java.sql.Types.NVARCHAR);
                }
            }
            // status mặc định = "0"
            ps.setString(idx++, "0");

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(
                    "Error inserting ProgressLog for member=" + idMember, e);
        }
    }
    private static final String SELECT_LOGS_BY_MEMBER = "SELECT * FROM dbo.ProgressLog WHERE IDMember = ?";

     public List<ProgressLog> getProgressLogsByMember(String idMember) throws SQLException, ClassNotFoundException {
        List<ProgressLog> progressLogs = new ArrayList<>();
        
        // Kết nối và truy vấn dữ liệu
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(SELECT_LOGS_BY_MEMBER)) {
            
            ps.setString(1, idMember);
            
            ResultSet resultSet = ps.executeQuery();
            
            // Xử lý kết quả trả về
            while (resultSet.next()) {
                int idLog = resultSet.getInt("IDLog");
                String idCoach = resultSet.getString("IDCoach");
                
                // Lấy ngày tháng từ SQL và sử dụng java.sql.Date
                java.sql.Date sqlStartDate = resultSet.getDate("StartDate");
                java.sql.Date sqlEndDate = resultSet.getDate("EndDate");
                
                // Nếu có dữ liệu thì sử dụng
                Date startDate = sqlStartDate != null ? sqlStartDate : null;
                Date endDate = sqlEndDate != null ? sqlEndDate : null;
                
                String type = resultSet.getString("Type");
                
                // Các câu hỏi khác...
                String qs1 = resultSet.getString("qs1");
                String qs2 = resultSet.getString("qs2");
                String qs3 = resultSet.getString("qs3");
                String qs4 = resultSet.getString("qs4");
                String qs5 = resultSet.getString("qs5");
                String qs6 = resultSet.getString("qs6");
                String qs7 = resultSet.getString("qs7");
                String qs8 = resultSet.getString("qs8");
                String qs9 = resultSet.getString("qs9");
                String qs10 = resultSet.getString("qs10");
                
                // Tạo đối tượng ProgressLog và thêm vào danh sách
                ProgressLog log = new ProgressLog(idLog, idMember, idCoach, startDate, endDate, type, 
                                                  qs1, qs2, qs3, qs4, qs5, qs6, qs7, qs8, qs9, qs10);
                progressLogs.add(log);
            }
        }
        return progressLogs;
    }
       private static final String INSERT_ANSWER = "INSERT INTO Answers (logId, questionId, answer) VALUES (?, ?, ?)";
        public void saveAnswer(int logId, int questionId, String answer) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement preparedStatement= conn.prepareStatement(INSERT_ANSWER)) {
            preparedStatement.setInt(1, logId);  // logId
            preparedStatement.setInt(2, questionId);  // questionId
            preparedStatement.setString(3, answer);  // answer

            preparedStatement.executeUpdate();
        }
    }
}
   
    

    


