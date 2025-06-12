/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CoachDao;
import DAO.MemberDao;
import DTO.Coach;
import DTO.Member;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Tien Dat
 */
public class LoginServlet extends HttpServlet {

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
         try {
        String id = request.getParameter("username");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");

        MemberDao dao = new MemberDao();
        CoachDao daocoach = new CoachDao();

        HttpSession session = request.getSession();

        if (role.equalsIgnoreCase("member")) {
            Member member = dao.checkLogin(id, pass);

            if (member != null) {
                // Lưu thông tin vào session
                session.setAttribute("id", id);
                session.setAttribute("role", "member");
                session.setAttribute("username", member.getMemberName());

                // Gửi dữ liệu đến homepage
                request.setAttribute("member", member);
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("error", "Invalid username or password. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

        } else {
            Coach coach = daocoach.checkLogin(id, pass);

            if (coach != null) {
                // Lưu thông tin vào session
                session.setAttribute("id", id);
                session.setAttribute("role", "coach");
                session.setAttribute("username", coach.getCoachName());
                session.setAttribute("coachId", coach.getIDCoach());
                // Gửi dữ liệu đến homepage
                request.setAttribute("coach", coach);
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("error", "Invalid username or password. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        }

    } catch (Exception e) {
        e.printStackTrace(); // Log lỗi để tiện theo dõi
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
        processRequest(request, response);
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
