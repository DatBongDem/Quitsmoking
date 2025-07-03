/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.member;

import DAO.ProgressLogDAO;
import DTO.ProgressLog;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen Tien Dat
 */
public class SubmitProgressLogServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            // Lấy idLog từ URL
            String idLogParam = request.getParameter("idLog");
            if (idLogParam == null || idLogParam.isEmpty()) {
                request.setAttribute("errorMessage", "Thiếu IDLog.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            int idLog = Integer.parseInt(idLogParam);

            // Gọi DAO để lấy ProgressLog theo id
            ProgressLogDAO dao = new ProgressLogDAO();
            ProgressLog log = dao.getById(idLog);

            if (log == null) {
                request.setAttribute("errorMessage", "Không tìm thấy bản ghi ProgressLog.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Đẩy dữ liệu sang JSP
            request.setAttribute("log", log);
            request.getRequestDispatcher("progressAnswer.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        int idLog = Integer.parseInt(request.getParameter("idLog"));
        String action = request.getParameter("action"); // "save" hoặc "submit"

        try {
            ProgressLogDAO dao = new ProgressLogDAO();
            ProgressLog log = dao.getById(idLog); // Lấy log hiện tại

            for (int i = 1; i <= 10; i++) {
                String answer = request.getParameter("as" + i);
                if (answer != null) {
                    log.setAnswer(i, answer);
                }
            }
            System.out.println("idLog = " + idLog);
            log.setStatus(action.equals("save") ? "save" : "submit");

            boolean updated = dao.update(log);
            if (updated) {
                response.sendRedirect("progresslist.jsp"); // hoặc trang thông báo
            } else {
                request.setAttribute("error", "Không thể lưu tiến trình.");
                request.getRequestDispatcher("progressAnswer.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("progressAnswer.jsp").forward(request, response);
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
