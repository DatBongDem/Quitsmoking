/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static Utils.DBUtils.getConnection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DTO.Quiz;
import DTO.QuizResult.QuizSubmission;

/**
 *
 * @author Nghia
 */
public class QuizDao {

    public List<Quiz> getAllQuiz() throws SQLException, ClassNotFoundException {
        List<Quiz> quizzes = new ArrayList<>();
        String sql = "SELECT IDQuiz, Question, AnswerA, AnswerB, AnswerC, AnswerD FROM Quiz";

        try {
            PreparedStatement pstmt = getConnection().prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setIDQuiz(rs.getString("IDQuiz"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setAnswerA(rs.getString("AnswerA"));
                quiz.setAnswerB(rs.getString("AnswerB"));
                quiz.setAnswerC(rs.getString("AnswerC"));
                quiz.setAnswerD(rs.getString("AnswerD"));
                quizzes.add(quiz);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizzes;
    }
//
//    public void saveQuizSubmission(QuizSubmission submission) throws SQLException, ClassNotFoundException {
//        String sql = "INSERT INTO QuizResult (IDMember, IDQuiz, Answer, DateSubmit) VALUES (?, ?, ?, ?)";
//
//        try {
//            PreparedStatement ps = getConnection().prepareStatement(sql);
//            ps.setString(1, submission.getIDMember());
//            ps.setString(2, submission.getIDQuiz());
//            ps.setString(3, submission.getAnswer());
//
//            ps.setTimestamp(4, new java.sql.Timestamp(submission.getDateSubmit().getTime()));
//
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        QuizDao dao = new QuizDao();
//        dao.saveQuizSubmission("nghia","Q01","a",);
//
//    }

}
