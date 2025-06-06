<%-- 
    Document   : supportCoach
    Created on : Jun 5, 2025, 9:09:40 PM
    Author     : Nguyen Tien Dat
--%>

<%@page import="DTO.Support"%>
<%@page import="DAO.SupportDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="DTO.Member" %>
<%@page import="DAO.MemberDao"%>
<%
    String idCoach = (String) session.getAttribute("id");
    MemberDao memberDAO = new MemberDao();
    List<Member> members = memberDAO.getMembersByCoach(idCoach);
%>

<div class="chat-container">
    <div class="member-list">
        <ul>
            <% for(Member m : members) { %>
            <li>
                <a href="supportCoach.jsp?memberId=<%= m.getIDMember() %>"><%= m.getMemberName() %></a>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="chat-box">
        <% 
          String idMember = request.getParameter("memberId");
          if(idMember != null) {
              SupportDAO dao = new SupportDAO();
              List<Support> messages = dao.getAllMessagesBetween(idMember, idCoach);
              for(Support msg : messages) {
        %>
              <div class="<%= msg.getAuthorSend().equals("coach") ? "coach-msg" : "member-msg" %>">
                  <b><%= msg.getAuthorSend() %>:</b> <%= msg.getContent() %> <br/>
                  <small><%= msg.getFeedbackDate() %></small>
              </div>
        <%  }
          } else { %>
              <p>Please select a member to chat.</p>
        <% } %>
    </div>
</div>
