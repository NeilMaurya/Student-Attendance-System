<%@ page import="com.attendance.model.Teacher" %>
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
    if (teacher == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .dashboard-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            margin-bottom: 30px;
        }

        h2 {
            margin-top: 0;
            color: #444;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <h1>Welcome, <%= teacher.getUsername() %>!</h1>
    <p>Subject: <%= teacher.getSubject() %></p>

    <h2>Menu</h2>
    <ul>
        <li><a href="view-students.jsp">View Students</a></li>
        <li><a href="register-student.jsp">Register Students</a></li>
        <li><a href="logout">Logout</a></li>
    </ul>
</div>
</body>
</html>
