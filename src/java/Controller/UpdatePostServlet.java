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
    private SystemDao dao = new SystemDao();
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
      // 1) Đọc text fields
        String idPost       = request.getParameter("idPost");
        String title        = request.getParameter("title");
        String content      = request.getParameter("content");
        String publishDateS = request.getParameter("publishDate");
        String existingImg  = request.getParameter("existingImage");

        // 2) Chuyển publishDate sang java.sql.Date, nếu định dạng hợp lệ
        java.sql.Date publishDate = null;
        if (publishDateS != null && !publishDateS.trim().isEmpty()) {
            try {
                publishDate = java.sql.Date.valueOf(publishDateS);
            } catch (IllegalArgumentException e) {
                // ngày không hợp lệ, để null hoặc xử lý tuỳ ý
                publishDate = null;
            }
        }

        // 3) Xử lý upload file (nếu JSP có <input type="file" name="imageFile">)
        String imagePath = existingImg;
        Part filePart = null;
        try {
            filePart = request.getPart("imageFile");
        } catch (IllegalStateException | ServletException ignored) {
            // không có multipart hoặc không upload, bỏ qua
        }
        if (filePart != null && filePart.getSize() > 0) {
            String uploadsDir = request.getServletContext().getRealPath("/uploads");
            File uploads = new File(uploadsDir);
            if (!uploads.exists()) uploads.mkdirs();

            String submittedName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String newFileName   = UUID.randomUUID() + "_" + submittedName;
            File file = new File(uploads, newFileName);
            try (InputStream in = filePart.getInputStream();
                 FileOutputStream out = new FileOutputStream(file)) {
                byte[] buffer = new byte[8192];
                int len;
                while ((len = in.read(buffer)) != -1) {
                    out.write(buffer, 0, len);
                }
            }
            // lưu đường dẫn tương đối để hiển thị
            imagePath = "/uploads/" + newFileName;
        }

        // 4) Tạo DTO và gọi DAO
        BlogPost post = new BlogPost();
        post.setIdPost     (idPost);
        post.setTitle      (title);
        post.setContent    (content);
        post.setImage      (imagePath);
        post.setPublishDate(publishDate);

        try {
            boolean ok = dao.updatePost(post);
            if (ok) {
                // cập nhật thành công → chuyển về trang quản lý với thông báo
                response.sendRedirect(request.getContextPath() + "/ManageBlogServlet?msg=updated");
            } else {
                // không có bản ghi nào bị ảnh hưởng
                request.setAttribute("error", "Không tìm thấy bài viết hoặc không thể cập nhật.");
                request.setAttribute("post", post);
                request.getRequestDispatcher("updatePost.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("post", post);
            request.getRequestDispatcher("updatePost.jsp").forward(request, response);
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
