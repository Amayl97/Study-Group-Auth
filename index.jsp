<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Study Group</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <div class="logo">StudyHub</div>

    <div class="nav-links">
        <%
            if (session.getAttribute("userId") != null) {
        %>
            <span>Hi, <%= session.getAttribute("name") %></span>
            <a href="Logout">Logout</a>
        <%
            } else {
        %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        <%
            }
        %>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <h1>Learn Together, Anywhere</h1>
    <p>Join global study groups, ask questions, and share notes.</p>
    <button class="primary-btn">Explore Groups</button>
</section>

<!-- Groups Section -->
<section class="groups">
    <h2>Available Study Groups</h2>

    <div class="group-grid">
        <div class="group-card">
            <h3>Computer Science</h3>
            <p>DSA, OOP, and core CS subjects</p>
            <span>120 Members</span>
            <button class="secondary-btn">Join Group</button>
        </div>

        <div class="group-card">
            <h3>BBA</h3>
            <p>Marketing, Finance & Management</p>
            <span>85 Members</span>
            <button class="secondary-btn">Join Group</button>
        </div>

        <div class="group-card">
            <h3>Engineering</h3>
            <p>Maths, Physics, and core engineering</p>
            <span>95 Members</span>
            <button class="secondary-btn">Join Group</button>
        </div>
    </div>
</section>

</body>
</html>
