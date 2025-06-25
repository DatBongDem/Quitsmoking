/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.coach;

import DAO.CoachDao;
import DTO.Coach;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateProfileCoach", urlPatterns = {"/UpdateProfileCoach"})
public class UpdateProfileCoach extends HttpServlet {

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
        String coachId = request.getParameter("coachId");
        CoachDao dao = new CoachDao();
        try {
            Coach coach = dao.getCoachById(coachId);

            // Pass coach object to JSP
            request.setAttribute("coach", coach);
            request.getRequestDispatcher("editProfileCoach.jsp").forward(request, response);
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
    try {
        request.setCharacterEncoding("UTF-8");
        
        // Đường dẫn lưu ảnh avatar
        String AVATAR_UPLOAD_DIR = "images/avata";
        
        // Lấy idCoach từ request
        String coachId = request.getParameter("coachId");
        
        // Gọi DAO để lấy đối tượng Coach
        CoachDao coachDao = new CoachDao();
        Coach coach = coachDao.getCoachById(coachId);
        
        // Lấy thông tin từ form
        String password = request.getParameter("password");
        String coachName = request.getParameter("coachName");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String specialization = request.getParameter("specialization");
        
        // Xử lý dateOfBirth
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        java.sql.Date dateOfBirth = null;
        
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                // Chuyển từ chuỗi sang java.util.Date
                java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirthStr);
                // Chuyển sang java.sql.Date
                dateOfBirth = new java.sql.Date(utilDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        
        // Xử lý experienceYears
        String experienceYearsStr = request.getParameter("experienceYears");
        int experienceYears = 0; // Mặc định là 0 nếu không có giá trị
        
        if (experienceYearsStr != null && !experienceYearsStr.isEmpty()) {
            try {
                experienceYears = Integer.parseInt(experienceYearsStr);  // Chuyển sang kiểu int
            } catch (NumberFormatException e) {
                e.printStackTrace();  // Log lỗi nếu không thể chuyển đổi
            }
        }
        
        // Lấy file avatar từ request
        Part filePart = request.getPart("avatarFile");
        String avatarPath = null; // Đường dẫn avatar mới
        
        if (filePart != null && filePart.getSize() > 0) {
            // Lấy tên file
            String fullFileName = filePart.getSubmittedFileName();
            String fileName = fullFileName.substring(fullFileName.lastIndexOf("\\") + 1);
            
            // Đường dẫn lưu file trên server
            String appPath = request.getServletContext().getRealPath("");
            String uploadDir = appPath + File.separator + AVATAR_UPLOAD_DIR;
            
            // Tạo thư mục nếu chưa tồn tại
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }
            
            // Đường dẫn file lưu
            String filePath = uploadDir + File.separator + fileName;
            
            // Lưu file vào server
            filePart.write(filePath);
            
            // Đường dẫn avatar sẽ lưu vào database
            avatarPath = AVATAR_UPLOAD_DIR + "/" + fileName;
        }
        
        // Cập nhật thông tin cho coach
        coach.setPassword(password);
        coach.setCoachName(coachName);
        coach.setGender(gender);
        coach.setPhone(phone);
        coach.setEmail(email);
        coach.setAddress(address);
        coach.setSpecialization(specialization);
        coach.setExperienceYears(experienceYears);
        coach.setDateOfBirth(dateOfBirth);
        
        // Nếu có ảnh avatar mới thì set lại avatar cho coach
        if (avatarPath != null) {
            coach.setImage(avatarPath);
        }
        
        // Cập nhật thông tin trong database thông qua DAO
        boolean success = false;
        try {
            success = coachDao.updateCoachProfile(coach);  // Gọi phương thức updateCoach trong DAO
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateStatusServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Kiểm tra kết quả cập nhật và chuyển hướng
        if (success) {
            // Cập nhật thành công, chuyển về trang profile với thông tin mới
            request.setAttribute("coach", coach);
            request.getRequestDispatcher("ProfileCoach.jsp").forward(request, response);
        } else {
            // Xử lý lỗi cập nhật
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher("editProfileCoach.jsp").forward(request, response);
        }
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(UpdateProfileCoach.class.getName()).log(Level.SEVERE, null, ex);
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
