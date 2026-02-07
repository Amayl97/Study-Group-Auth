<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("userId") != null) {
        response.sendRedirect("profile.jsp");
        return; // IMPORTANT: stop further execution
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login | StudyHub</title>
    <link rel="stylesheet" href="css/login-reg-style.css">
</head>
<body>

<div class="auth-container">
    <div class="auth-card">
        <h1>StudyHub</h1>
        <p class="subtitle">Welcome back. Please login.</p>

        <form action="login" method="post">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p class="switch">
            Don't have an account?
            <a href="register.jsp">Sign up</a>
        </p>
    </div>
</div>

</body>
</html>
