<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.quiz.model.Result" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>View Results</title>
                <link rel="stylesheet" type="text/css" href="css/style.css">
            </head>

            <body>
                <div class="container">
                    <h2>Student Results</h2>
                    <a href="admin_dashboard.jsp" class="btn-link" style="text-align: left; margin-bottom: 20px;">&larr;
                        Back to Dashboard</a>

                    <table>
                        <thead>
                            <tr>
                                <th>Student</th>
                                <th>Quiz</th>
                                <th>Score</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Result> results = (List<Result>) request.getAttribute("results");
                                    if(results != null) {
                                    for(Result r : results) {
                                    %>
                                    <tr>
                                        <td>
                                            <%= r.getUsername() %>
                                        </td>
                                        <td>
                                            <%= r.getQuizTitle() %>
                                        </td>
                                        <td>
                                            <%= r.getScore() %> / <%= r.getTotalQuestions() %>
                                        </td>
                                        <td>
                                            <%= r.getSubmissionDate() %>
                                        </td>
                                    </tr>
                                    <% } } else { %>
                                        <tr>
                                            <td colspan="4">No results found.</td>
                                        </tr>
                                        <% } %>
                        </tbody>
                    </table>
                </div>
            </body>

            </html>