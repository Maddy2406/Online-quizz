package com.quiz.controller;

import com.quiz.dao.QuizDAO;
import com.quiz.dao.UserDAO;
import com.quiz.model.Question;
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

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private QuizDAO quizDAO;

    public void init() {
        quizDAO = new QuizDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("view_results".equals(action)) {
            List<Result> results = quizDAO.getAllResults();
            request.setAttribute("results", results);
            request.getRequestDispatcher("view_results.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("add_question".equals(action)) {
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            String text = request.getParameter("questionText");
            String opA = request.getParameter("optionA");
            String opB = request.getParameter("optionB");
            String opC = request.getParameter("optionC");
            String opD = request.getParameter("optionD");
            String correct = request.getParameter("correctOption");

            Question q = new Question();
            q.setQuizId(quizId);
            q.setQuestionText(text);
            q.setOptionA(opA);
            q.setOptionB(opB);
            q.setOptionC(opC);
            q.setOptionD(opD);
            q.setCorrectOption(correct);

            quizDAO.addQuestion(q);
            response.sendRedirect("admin_dashboard.jsp?msg=Question Added Successfully");
        }
    }
}
