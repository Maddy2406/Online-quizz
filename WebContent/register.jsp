<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Register - Online Quiz</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>

    <body>
        <div class="container">
            <h2>Register</h2>
            <% String error=request.getParameter("error"); if(error !=null) { %>
                <div class="alert alert-error">
                    <%= error %>
                </div>
                <% } %>

                    <form action="auth" method="post">
                        <input type="hidden" name="action" value="register">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" required>
                        </div>
                        <button type="submit">Register</button>
                        <a href="login.jsp" class="btn-link">Already have an account? Login here</a>
                    </form>
        </div>
    </body>

    </html>