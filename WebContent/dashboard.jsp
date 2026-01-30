<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.quiz.model.Quiz" %>
            <%@ page import="com.quiz.model.User" %>
                <% User user=(User) session.getAttribute("user"); if(user==null) { response.sendRedirect("login.jsp");
                    return; } %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <title>Dashboard - Online Quiz</title>
                        <link rel="stylesheet" type="text/css" href="css/style.css">
                    </head>

                    <body>
                        <div class="navbar">
                            <h3>Welcome, <%= user.getUsername() %>
                            </h3>
                            <div>
                                <a href="quiz?action=list">Available Quizzes</a>
                                <a href="auth?action=logout">Logout</a>
                            </div>
                        </div>

                        <div class="container">
                            <h2>Available Quizzes</h2>
                            <% List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
                                    if(quizzes == null) {
                                    // If accessed directly, redirect to controller to fetch data
                                    response.sendRedirect("quiz?action=list");
                                    return;
                                    }

                                    for(Quiz q : quizzes) {
                                    %>
                                    <div class="card">
                                        <h3>
                                            <%= q.getTitle() %>
                                        </h3>
                                        <p>
                                            <%= q.getDescription() %>
                                        </p>
                                        <a href="quiz?action=start&id=<%= q.getId() %>"><button
                                                style="width: auto;">Start Quiz</button></a>
                                    </div>
                                    <% } %>
                        </div>
                    </body>

                    </html>