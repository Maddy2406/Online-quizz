<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Quiz Result</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>

    <body>
        <div class="container" style="text-align: center;">
            <h2>Quiz Completed!</h2>

            <div class="card" style="background-color: #f8f9fa;">
                <h1>Score: <%= request.getAttribute("score") %> / <%= request.getAttribute("total") %>
                </h1>
            </div>

            <a href="dashboard.jsp"><button>Back to Dashboard</button></a>
        </div>
    </body>

    </html>