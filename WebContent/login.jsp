<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Login - Online Quiz</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>

    <body>
        <div class="container">
            <h2>Login</h2>
            <% String error=request.getParameter("error"); String msg=request.getParameter("msg"); if(error !=null) { %>
                <div class="alert alert-error">
                    <%= error %>
                </div>
                <% } %>
                    <% if(msg !=null) { %>
                        <div class="alert alert-success">
                            <%= msg %>
                        </div>
                        <% } %>

                            <form action="auth" method="post">
                                <input type="hidden" name="action" value="login">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="username" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" required>
                                </div>
                                <button type="submit">Login</button>
                                <a href="register.jsp" class="btn-link">Don't have an account? Register here</a>
                                <a href="index.jsp" class="btn-link">Back to Home</a>
                            </form>
        </div>
    </body>

    </html>