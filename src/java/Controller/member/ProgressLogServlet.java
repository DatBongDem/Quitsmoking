/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.member;

import DAO.BadgeDAO;
import DAO.NotificationDao;
import DAO.ProgressLogDAO;
import DAO.QuitPlanDAO;
import DTO.ProgressLog;
import DTO.Question;
import DTO.QuitPlan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Tien Dat
 */
public class ProgressLogServlet extends HttpServlet {

    private ProgressLogDAO progressLogDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // Khởi tạo đối tượng DAO khi Servlet được khởi tạo
        progressLogDAO = new ProgressLogDAO();
    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
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
            HttpSession session = request.getSession();
            String idMember = (String) session.getAttribute("id");

            // Lấy danh sách các ProgressLog của idMember từ cơ sở dữ liệu
            List<ProgressLog> logs = progressLogDAO.getProgressLogsByMember(idMember);

            // Lưu logs vào request để truyền cho JSP
            request.setAttribute("logs", logs);

            // Forward dữ liệu tới JSP để hiển thị
            request.getRequestDispatcher("progress.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProgressLogServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProgressLogServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        HttpSession session = request.getSession();
        String idMember = (String) session.getAttribute("id");

        if (idMember == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy danh sách các câu trả lời từ form
        List<String> answers = new ArrayList<>();
        List<Integer> questionIds = new ArrayList<>();
        List<Integer> logIds = new ArrayList<>();

        // Duyệt qua các câu hỏi và lấy các câu trả lời
        for (int i = 1; i <= 10; i++) {  // Giả sử có tối đa 10 câu hỏi
            String answer = request.getParameter("answer_" + i);  // Lấy câu trả lời
            if (answer != null && !answer.trim().isEmpty()) {
                answers.add(answer);
                questionIds.add(i);  // Mỗi câu hỏi có ID (ví dụ: 1, 2, 3,...)
                logIds.add(Integer.parseInt(request.getParameter("logId")));  // ID của log
            }
        }

        // Giả sử bạn có một phương thức lưu câu trả lời vào cơ sở dữ liệu
        // progressLogDAO.saveAnswers(answers, questionIds, logIds);
        // Lưu câu trả lời vào cơ sở dữ liệu
        for (int i = 0; i < answers.size(); i++) {
            try {
                String answer = answers.get(i);
                int questionId = questionIds.get(i);
                int logId = logIds.get(i);

                // Gọi DAO để lưu câu trả lời
                progressLogDAO.saveAnswer(logId, questionId, answer);
            } catch (SQLException ex) {
                Logger.getLogger(ProgressLogServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ProgressLogServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
