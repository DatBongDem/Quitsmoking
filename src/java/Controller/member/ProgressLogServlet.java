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
import DTO.QuitPlan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
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
        HttpSession session = request.getSession();
        String idMember = (String) session.getAttribute("id");

        if (idMember == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Date startDate = ProgressLogDAO.getStartDate(idMember);
        request.setAttribute("startDate", (startDate != null ? startDate.toString() : ""));

        LocalDate today = LocalDate.now();
        request.setAttribute("today", today.toString());

        Integer todayCigs = ProgressLogDAO.getCigarettesOnDate(idMember, 0);
        Integer yesterdayCigs = ProgressLogDAO.getCigarettesOnDate(idMember, -1);
        Integer firstDayCigs = ProgressLogDAO.getCigarettesOnFirstDay(idMember);

        request.setAttribute("todayCigarettes", todayCigs);
        request.setAttribute("yesterdayCigarettes", yesterdayCigs);
        request.setAttribute("firstDayCigarettes", firstDayCigs);

        if (startDate != null && startDate.toLocalDate().isEqual(today)) {
            request.setAttribute("isFirstDay", true);
        } else {
            request.setAttribute("isFirstDay", false);
        }

        request.getRequestDispatcher("progress.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8"); // cần thiết để đọc đúng tiếng Việt
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        BadgeDAO badge = new BadgeDAO();
        NotificationDao notiDao=new NotificationDao();
        HttpSession session = request.getSession();
        String idMember = (String) session.getAttribute("id");

        if (idMember == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int numberOfCigarettes = Integer.parseInt(request.getParameter("cigarettes"));

            // Lấy 5 câu trả lời từ form
            String q1 = request.getParameter("q1");
            String q2 = request.getParameter("q2");
            String q3 = request.getParameter("q3");
            String q4 = request.getParameter("q4");
            String q5 = request.getParameter("q5");

            // Ghép lại thành notes, cách nhau bằng dòng mới
            String notes = "Câu 1: " + q1 + "\n"
                    + "Câu 2: " + q2 + "\n"
                    + "Câu 3: " + q3 + "\n"
                    + "Câu 4: " + q4 + "\n"
                    + "Câu 5: " + q5;

            // Tạo log mới
            ProgressLog log = new ProgressLog();
            log.setIdMember(idMember);
            log.setLogDate(Date.valueOf(LocalDate.now()));
            log.setNumberOfCigarettes(numberOfCigarettes);
            log.setNotes(notes);

            // Ghi vào DB
            ProgressLogDAO.insertProgressLog(log);
            badge.insertBadgeDetail(idMember);
       
            response.sendRedirect("ProgressLogServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("progress.jsp?error=1");
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
