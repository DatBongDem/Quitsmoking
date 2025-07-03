<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="DTO.ProgressLog"%>
<%@page import="java.lang.reflect.Method"%>

<html>
    <head>
        <title>Trả lời câu hỏi tiến trình</title>
        <%@include file="information/bootstrap.jspf" %>
        <link rel="stylesheet" type="text/css" href="css/proressAnswer.css">
    </head>
    <body>
        <%
            ProgressLog log = (ProgressLog) request.getAttribute("log");
            if (log == null) {
        %>
        <div class="container mt-5">
            <div class="alert alert-danger text-center shadow-sm" role="alert">
                Không tìm thấy dữ liệu nhật ký.
            </div>
        </div>
        <%
                return;
            }
        %>

        <div class="container mt-4 mb-5">
            <h2 class="text-center text-success mb-4 font-weight-bold">✍️ Trả lời câu hỏi từ huấn luyện viên</h2>

            <% String progress = log.getProgress();
                if (progress != null && !progress.trim().isEmpty()) {%>
            <div class="card border-success mb-4 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title text-success font-weight-bold">
                        <i class="fas fa-sticky-note mr-2"></i> Nhật ký ghi chú:
                    </h5>
                    <textarea class="form-control text-question" rows="4" readonly><%= progress%></textarea>
                </div>
            </div>
            <% }%>

            <form action="SubmitProgressLogServlet" method="post">
                <input type="hidden" name="idLog" value="<%= log.getIdLog()%>">

                <%
                    for (int i = 1; i <= 5; i++) {
                        Method getQs = ProgressLog.class.getMethod("getQs" + i);
                        Method getAs = ProgressLog.class.getMethod("getAs" + i);
                        String question = (String) getQs.invoke(log);
                        String answer = (String) getAs.invoke(log);

                        if (question != null && !question.trim().isEmpty()) {
                %>
                <div class="card mb-3 border-light shadow-sm">
                    <div class="card-body">
                        <div class="card-subtitle mb-2 text-success font-weight-bold">
                            <i class="fas fa-question-circle mr-1"></i> Câu hỏi <%= i%>:
                        </div>
                        <p class="card-text p-3 rounded bg-light border">
                            <%= question%>
                        </p>
                        <textarea name="as<%= i%>" class="form-control mt-2" rows="3"
                                  placeholder="Nhập câu trả lời của bạn..."><%= answer != null ? answer : ""%></textarea>
                    </div>
                </div>
                <%
                        }
                    }
                %>

                <div class="d-flex justify-content-end mt-4">
                    <button type="submit" name="action" value="save" class="btn btn-success shadow-sm mr-2">
                        <i class="fas fa-save"></i> Lưu
                    </button>
                    <button type="submit" name="action" value="submit" class="btn btn-primary shadow-sm">
                        <i class="fas fa-paper-plane"></i> Gửi
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
