/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import Utils.DBUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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

        MemberDao mem = new MemberDao();
        try {
            String id = request.getParameter("memberid");
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String dobStr = request.getParameter("dob");
            request.setAttribute("memberId", request.getParameter("memberid"));
            request.setAttribute("fullname", request.getParameter("fullname"));
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("phone", request.getParameter("phone"));
            request.setAttribute("address", request.getParameter("address"));
            request.setAttribute("dob", request.getParameter("dob"));
            boolean isDuplicate = false;
            for (String idcheck : mem.getAllMemberIds()) {
                if (idcheck.equals(id)) {
                    isDuplicate = true;
                    break;
                }
            }
            String imagePath = "";
            Part imagePart = request.getPart("image");  // Assuming the image input is named 'profileImage'
            if (imagePart != null && imagePart.getSize() > 0) {
                String imageFileName = extractFileName(imagePart);
                String uploadDirectory = getServletContext().getRealPath("/uploads");
                File uploadDir = new File(uploadDirectory);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();  // Create the uploads directory if it doesn't exist
                }
                imagePath = "/uploads/" + imageFileName;
                imagePart.write(uploadDirectory + File.separator + imageFileName);
            }

            if (isDuplicate) {
                request.setAttribute("errorMessage", "Member ID đã tồn tại, vui lòng chọn ID khác.");
                request.getRequestDispatcher("register.jsp").forward(request, response);

            }

            while (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Password and Confirm Password do not match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);

            }
            mem.resigter(id, password, fullName, phone, email, address, dobStr,imagePath);
            request.setAttribute("successMessage", "Đăng ký tài khoản thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
             e.printStackTrace();
        }
        }
 
    private String extractFileName(Part part) {
        String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "";
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
