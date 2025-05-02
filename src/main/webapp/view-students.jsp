<%@ page import="com.attendance.dao.StudentDAO" %>
<%@ page import="com.attendance.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentDAO studentDAO = new StudentDAO();
    List<Student> students = studentDAO.getAllStudents();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Records</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --light-gray: #f8f9fa;
            --dark-gray: #343a40;
            --success-color: #28a745;
            --error-color: #dc3545;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        nav ul {
            display: flex;
            list-style: none;
        }

        nav ul li {
            margin-left: 1.5rem;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: opacity 0.3s;
        }

        nav ul li a:hover {
            opacity: 0.8;
        }

        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .page-title {
            margin-bottom: 1.5rem;
            color: var(--dark-gray);
        }

        .alert {
            padding: 0.75rem 1.25rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #d4edda;
            color: var(--success-color);
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background-color: #f8d7da;
            color: var(--error-color);
            border: 1px solid #f5c6cb;
        }

        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: var(--light-gray);
            font-weight: 600;
            color: var(--dark-gray);
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .actions {
            white-space: nowrap;
        }

        .btn {
            display: inline-block;
            padding: 0.375rem 0.75rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
            border: 1px solid var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .btn-danger {
            background-color: var(--error-color);
            color: white;
            border: 1px solid var(--error-color);
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .action-buttons {
            margin-top: 1.5rem;
            display: flex;
            gap: 1rem;
        }

        footer {
            background-color: var(--dark-gray);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                text-align: center;
            }

            nav ul {
                margin-top: 1rem;
            }

            nav ul li {
                margin: 0 0.5rem;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">Student Attendance System</div>
        <nav>
            <ul>
                <li><a href="view-students.jsp">View Students</a></li>
                <li><a href="register-student.jsp">Register Student</a></li>
                <li><a href="mark-attendance.jsp">Mark Attendance</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <h1 class="page-title">Student Records</h1>

    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success"><%= request.getParameter("success") %></div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-error"><%= request.getParameter("error") %></div>
    <% } %>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Roll Number</th>
                <th>Name</th>
                <th>Email</th>
                <th>Class</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Student student : students) { %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getRollNumber() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() != null ? student.getEmail() : "-" %></td>
                <td><%= student.getClassName() != null ? student.getClassName() : "-" %></td>
                <td class="actions">
                    <a href="delete-student?id=<%= student.getId() %>"
                       class="btn btn-danger"
                       onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="action-buttons">
        <a href="register-student.jsp" class="btn btn-primary">Add New Student</a>
        <a href="mark-attendance.jsp" class="btn btn-primary">Mark Attendance</a>
    </div>
</main>

<footer>
    <div class="footer-container">
        <p>&copy; <%= java.time.Year.now().getValue() %> Student Attendance System. All rights reserved.</p>
    </div>
</footer>
</body>
</html>