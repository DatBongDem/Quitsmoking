/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MemberDao;
import DAO.TokenForgotPasswordDAO;
import DTO.Member;
import DTO.TokenForgotPasswordDTO;
import Utils.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.UUID;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinkpad
 */
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPasswordServlet"})
public class ForgotPasswordServlet extends HttpServlet {

    private static final String FORGOT_PASSWORD_PAGE = "forgotPassword.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(FORGOT_PASSWORD_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String url = FORGOT_PASSWORD_PAGE;
        try {
            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("ERROR", "Please enter your email address.");
            } else {
                MemberDao dao = new MemberDao();
                Member member = dao.getEmailByMember(email);
                if (member != null) {
                    String token = UUID.randomUUID().toString();
                    LocalDateTime expiryDate = LocalDateTime.now().plusHours(1);
                    TokenForgotPasswordDTO resetToken = new TokenForgotPasswordDTO();
                    resetToken.setIDMember(member.getIDMember());
                    resetToken.setToken(token);
                    resetToken.setExpiryTime(expiryDate);

                    TokenForgotPasswordDAO daoReset = new TokenForgotPasswordDAO();
                    daoReset.saveToken(resetToken);
                    
                    String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                            + request.getContextPath() + "/ResetPasswordServlet?token=" + token;
                    
                    String subject = "Password Reset Request";
                    String body = "Dear " + member.getMemberName() + ",\n\n"
                            + "You have requested to reset your password. Please click on the link below to reset your password:\n"
                            + resetLink + "\n\n"
                            + "This link will expire in 1 hour...";
                    EmailUtils.sendEmail(member.getEmail(), subject, body);
                    request.setAttribute("message", "A password reset link has been sent to your email.");
                } else {
                    request.setAttribute("message", "If your email is registered, a reset link has been sent.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("ERROR", "Database error. Please try again.");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            request.setAttribute("ERROR", "System error. Please try again.");
        } catch (MessagingException ex) {
            ex.printStackTrace();
            request.setAttribute("ERROR", "Could not send email. Please try again.");
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
