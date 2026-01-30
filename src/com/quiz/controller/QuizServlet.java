package com.quiz.controller;

import com.quiz.dao.QuizDAO;
import com.quiz.model.Question;
import com.quiz.model.Quiz;
import com.quiz.model.Result;
import com.quiz.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    private QuizDAO quizDAO;

    public void init() {
        quizDAO = new QuizDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("list".equals(action)) {
            List<Quiz> quizzes = quizDAO.getAllQuizzes();
            request.setAttribute("quizzes", quizzes);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else if ("start".equals(action)) {
            int quizId = Integer.parseInt(request.getParameter("id"));
            List<Question> questions = quizDAO.getQuestionsByQuizId(quizId);
            Quiz quiz = quizDAO.getQuizById(quizId);
            
            request.setAttribute("questions", questions);
            request.setAttribute("quiz", quiz);
            request.getRequestDispatcher("quiz.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("submit".equals(action)) {
            submitQuiz(request, response);
        }
    }

    private void submitQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        List<Question> questions = quizDAO.getQuestionsByQuizId(quizId);
        int score = 0;

        for (Question q : questions) {
            String selectedOption = request.getParameter("q_" + q.getId());
            if (selectedOption != null && selectedOption.equals(q.getCorrectOption())) {
                score++;
            }
        }

        Result result = new Result();
        result.setUserId(user.getId());
        result.setQuizId(quizId);
        result.setScore(score);
        result.setTotalQuestions(questions.size());
        
        quizDAO.saveResult(result);

        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
