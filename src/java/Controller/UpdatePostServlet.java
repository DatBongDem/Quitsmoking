/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import DAO.SystemDao;
import DTO.BlogPost;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Nghia
 */
@WebServlet(name = "UpdatePostServlet", urlPatterns = {"/UpdatePostServlet"})
public class UpdatePostServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet UpdatePostServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePostServlet at " + request.getContextPath() + "</h1>");
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

   String id = request.getParameter("idPost");
        BlogPost post = null;
        SystemDao mem=new SystemDao();
        try {
            post = mem.getBlogById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("post", post  );
        request.getRequestDispatcher("updatePost.jsp")
               .forward(request, response);
    
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
               
        String idPost       = request.getParameter("idPost");
        String title        = request.getParameter("title");
        String content      = request.getParameter("content");
        String publishDateS = request.getParameter("publishDate");

        // 1) Chuyển publishDate an toàn
        Date publishDate = null;
        if (publishDateS != null && !publishDateS.trim().isEmpty()) {
            try {
                LocalDate ld = LocalDate.parse(publishDateS);
                publishDate = Date.valueOf(ld);
            } catch (Exception e) {
                // Nếu sai định dạng thì để null hoặc xử lý tuỳ ý
                publishDate = null;
            }
        }

        // 2) Tạo DTO và gán dữ liệu
        BlogPost post = new BlogPost();
        post.setIdPost     (idPost);
        post.setTitle      (title);
        post.setContent    (content);
        post.setPublishDate(Date.valueOf("2025-07-11"));
        // LƯU Ý: không gọi setImage(...) nữa, giữ nguyên trong DAO
  SystemDao dao=new SystemDao();
     // 3) Gọi DAO update
     dao.updatePost(post);
    
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
