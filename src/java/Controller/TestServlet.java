/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import DAO.QuizDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Tien Dat
 */
public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            QuizDao dao = new QuizDao();

            request.setAttribute("quizList", dao.getAllQuiz());
            request.getRequestDispatcher("test.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false: don't create a new session if one doesn't exist

        // Check if the session is valid and contains the "name" attribute (meaning the user is logged in)
        if (session == null || session.getAttribute("username") == null) {
            // User is not logged in, send an error message
            request.setAttribute("errorMessage", "Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.");

            request.getRequestDispatcher("test.jsp").forward(request, response);

            return;
        } else {
            String quizId = request.getParameter("quizID"); // quiz_id là chuỗi
            String memberId = request.getParameter("memberID"); // member_id là chuỗi
            String answers = ""; // Chuỗi lưu trữ các câu trả lời
     
            // Lấy các câu trả lời từ các lựa chọn radio buttons (Câu trả lời có thể là một chuỗi)
            List<String> answerList = new ArrayList<>();
             QuizDao quiz=new QuizDao();
            for (int i = 1; i <= Integer.parseInt(quizId); i++) {
                 answers = request.getParameter("answer_");
                if (answers != null) {
                    answerList.add(answers);
                      answers = String.join(",", answerList);
                     try {
               quiz.insertQuizResult("123", quizId, answers);
              
                
            } catch (Exception e) {
            }
                }
            }
           
           

            request.setAttribute("success", false);  // Đặt thuộc tính "success" để hiển thị nút trở về trang chủ
            request.setAttribute("successMessage", "Bài kiểm tra đã được nộp thành công!");
            request.getRequestDispatcher("test.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
