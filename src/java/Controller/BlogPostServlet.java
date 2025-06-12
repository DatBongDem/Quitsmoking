/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import DAO.SystemDao;
import DTO.BlogPost;
import DTO.Member;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes.Name;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nghia
 */
@WebServlet(name = "BlogPostServlet", urlPatterns = {"/BlogPostServlet"})
public class BlogPostServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogPostServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        MemberDao dao = new MemberDao();

        try {
            // Lấy tất cả bài viết từ database
            List<BlogPost> blogPosts = dao.getAllBlogPosts();
            List<Member> member = new ArrayList<>();
            for (BlogPost blog : blogPosts) {
                String idMem = blog.getIdMember();
               
                member.add(dao.getMemberById(idMem));

            }
            request.setAttribute("member", member);
            // Truyền dữ liệu ra JSP
            request.setAttribute("blogPosts", blogPosts);
            request.getRequestDispatcher("blogPage.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi lấy dữ liệu bài viết: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogPostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        String keyword = request.getParameter("keyword");
          MemberDao mem = new MemberDao();
        try {
            SystemDao dao = new SystemDao();
            List<BlogPost> blogPosts = dao.searchByTitle(keyword);
            List<Member> member = new ArrayList<>();
            for (BlogPost blog : blogPosts) {
                String idMem = blog.getIdMember();
                member.add(mem.getMemberById(idMem));

            }
            request.setAttribute("member", member);
            request.setAttribute("blogPosts", blogPosts);
            request.getRequestDispatcher("blogPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
