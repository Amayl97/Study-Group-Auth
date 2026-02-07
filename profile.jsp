<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) session.getAttribute("name");
    String avatarLetter = "";
    if (name != null && !name.isEmpty()) {
        avatarLetter = name.substring(0, 1).toUpperCase();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | StudyHub</title>
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>

<!-- Top Navbar -->
<nav class="navbar">
    <div class="logo">StudyHub</div>
    <div class="nav-actions">
        <a href="index.jsp">Home</a>
        <a href="Logout">Logout</a>
    </div>
</nav>

<!-- Profile Container -->
<main class="profile-container">

    <!-- Profile Card -->
    <section class="profile-card">
        <div class="avatar"><%= avatarLetter %></div>
        <h2><%= name %></h2>
        <p><%= session.getAttribute("email") %></p>
        <span><%= session.getAttribute("field") %></span>
    </section>

    <!-- Content Area -->
    <section class="content">

        <!-- Joined Groups -->
        <div class="card">
            <h3>My Study Groups</h3>

            <div class="group">
                <span>Data Structures</span>
                <button>View</button>
            </div>

            <div class="group">
                <span>Web Development</span>
                <button>View</button>
            </div>
        </div>

        <!-- Join New Group -->
        <div class="card">
            <h3>Join New Group</h3>
            <button class="join-btn">Browse Groups</button>
        </div>

    </section>

</main>

<script src="js/profile.js"></script>
</body>
</html>
