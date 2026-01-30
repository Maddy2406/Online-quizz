<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.quiz.model.Question" %>
            <%@ page import="com.quiz.model.Quiz" %>
                <% List<Question> questions = (List<Question>) request.getAttribute("questions");
                        Quiz quiz = (Quiz) request.getAttribute("quiz");
                        if(questions == null || quiz == null) {
                        response.sendRedirect("dashboard.jsp");
                        return;
                        }
                        %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <title>
                                <%= quiz.getTitle() %>
                            </title>
                            <link rel="stylesheet" type="text/css" href="css/style.css">
                            <script src="js/script.js"></script>
                        </head>

                        <body>
                            <div class="navbar">
                                <h3>Taking Quiz: <%= quiz.getTitle() %>
                                </h3>
                                <h3 style="color: red;">Time Left: <span id="time">10:00</span></h3>
                            </div>

                            <div class="container">
                                <form id="quizForm" action="quiz" method="post">
                                    <input type="hidden" name="action" value="submit">
                                    <input type="hidden" name="quizId" value="<%= quiz.getId() %>">

                                    <% int count=1; for(Question q : questions) { %>
                                        <div class="card">
                                            <h4>
                                                <%= count++ %>. <%= q.getQuestionText() %>
                                            </h4>
                                            <div class="quiz-option">
                                                <input type="radio" name="q_<%= q.getId() %>" value="A">
                                                <%= q.getOptionA() %>
                                            </div>
                                            <div class="quiz-option">
                                                <input type="radio" name="q_<%= q.getId() %>" value="B">
                                                <%= q.getOptionB() %>
                                            </div>
                                            <div class="quiz-option">
                                                <input type="radio" name="q_<%= q.getId() %>" value="C">
                                                <%= q.getOptionC() %>
                                            </div>
                                            <div class="quiz-option">
                                                <input type="radio" name="q_<%= q.getId() %>" value="D">
                                                <%= q.getOptionD() %>
                                            </div>
                                        </div>
                                        <% } %>

                                            <button type="submit"
                                                onclick="return confirm('Are you sure you want to submit?');">Submit
                                                Quiz</button>
                                </form>
                            </div>
                        </body>

                        </html>