/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nghia
 */
@WebServlet(name = "QuitPlanRegister", urlPatterns = {"/QuitPlanRegister"})
public class QuitPlanRegister extends HttpServlet {

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
        processRequest(request, response);
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
        MemberDao mem = new MemberDao();
        String memberId = (String) session.getAttribute("id"); // IDMember
        String roleID = (String) session.getAttribute("role"); // IDMember
        if (memberId == null || roleID.equalsIgnoreCase("coach")) {
            // Chưa đăng nhập → chuyển về login
            request.getRequestDispatcher("homepage.jsp").forward(request, response);

            return;
        }
        String status = mem.getMemberById(memberId).getStatus();
        if (status != null) {
            request.setAttribute("error", "Bạn đã trong khóa, không thể đăng ký khóa mới");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;  // Dừng lại ở đây, không tiếp tục xử lý các logic bên dưới
        }
        String goal = request.getParameter("goal");

        if ("Silver".equalsIgnoreCase(goal)) {
            response.sendRedirect("GOISILIVER.jsp");
        } else if ("Gold".equalsIgnoreCase(goal)) {
            response.sendRedirect("GOIGOLD.jsp");
        } else {

            response.sendRedirect("GOIDIAMOND.jsp");
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
