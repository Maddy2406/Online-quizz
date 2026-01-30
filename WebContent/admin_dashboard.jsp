<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.quiz.model.User" %>
        <% User user=(User) session.getAttribute("user"); if(user==null || !"admin".equals(user.getRole())) {
            response.sendRedirect("login.jsp"); return; } %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Admin Dashboard</title>
                <link rel="stylesheet" type="text/css" href="css/style.css">
            </head>

            <body>
                <div class="navbar">
                    <h3>Admin Panel</h3>
                    <a href="auth?action=logout">Logout</a>
                </div>

                <div class="container">
                    <h2>Admin Operations</h2>
                    <% String msg=request.getParameter("msg"); if(msg !=null) { %>
                        <div class="alert alert-success">
                            <%= msg %>
                        </div>
                        <% } %>

                            <div style="display: flex; gap: 20px;">
                                <a href="add_question.jsp" class="card"
                                    style="text-decoration: none; color: inherit; flex: 1; text-align: center;">
                                    <h3>Add Question</h3>
                                    <p>Add new questions to quizzes</p>
                                </a>

                                <a href="admin?action=view_results" class="card"
                                    style="text-decoration: none; color: inherit; flex: 1; text-align: center;">
                                    <h3>View Results</h3>
                                    <p>See student scores</p>
                                </a>
                            </div>
                </div>
            </body>

            </html>