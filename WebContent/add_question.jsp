<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.quiz.dao.QuizDAO" %>
        <%@ page import="com.quiz.model.Quiz" %>
            <%@ page import="java.util.List" %>
                <% QuizDAO dao=new QuizDAO(); // Simple instantiation for view List<Quiz> quizzes = dao.getAllQuizzes();
                    %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <title>Add Question</title>
                        <link rel="stylesheet" type="text/css" href="css/style.css">
                    </head>

                    <body>
                        <div class="container">
                            <h2>Add New Question</h2>
                            <form action="admin" method="post">
                                <input type="hidden" name="action" value="add_question">

                                <div class="form-group">
                                    <label>Select Quiz</label>
                                    <select name="quizId">
                                        <% for(Quiz q : quizzes) { %>
                                            <option value="<%= q.getId() %>">
                                                <%= q.getTitle() %>
                                            </option>
                                            <% } %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Question Text</label>
                                    <textarea name="questionText" rows="3" required></textarea>
                                </div>

                                <div class="form-group"
                                    style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                    <input type="text" name="optionA" placeholder="Option A" required>
                                    <input type="text" name="optionB" placeholder="Option B" required>
                                    <input type="text" name="optionC" placeholder="Option C" required>
                                    <input type="text" name="optionD" placeholder="Option D" required>
                                </div>

                                <div class="form-group">
                                    <label>Correct Option</label>
                                    <select name="correctOption">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>

                                <button type="submit">Add Question</button>
                                <a href="admin_dashboard.jsp" class="btn-link">Cancel</a>
                            </form>
                        </div>
                    </body>

                    </html>