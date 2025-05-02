<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        form input[type="text"],
        form input[type="email"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.3s ease;
        }

        form input[type="text"]:focus,
        form input[type="email"]:focus {
            border-color: #5c9ded;
            outline: none;
        }

        button[type="submit"] {
            width: 100%;
            background-color: #5c9ded;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #4687d6;
        }

        .error {
            color: red;
            margin-bottom: 20px;
            text-align: center;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #5c9ded;
            text-decoration: none;
            font-weight: 500;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Register New Student</h1>

    <%-- Error messages --%>
    <% if (request.getParameter("error") != null) { %>
    <div class="error">
        <% if (request.getParameter("error").equals("empty_fields")) { %>
        Please fill all required fields!
        <% } else { %>
        Error registering student. Please try again.
        <% } %>
    </div>
    <% } %>

    <form action="register-student" method="post">
        <label for="rollNumber">Roll Number* (Alphanumeric)</label>
        <input type="text" id="rollNumber" name="rollNumber"
               pattern="[A-Za-z0-9]+" title="Only alphanumeric characters allowed" required>

        <label for="name">Full Name*</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email"
               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
               title="Enter a valid email address">

        <label for="class">Class*</label>
        <input type="text" id="class" name="class" required>

        <button type="submit">Register Student</button>
    </form>

    <div class="link">
        <p>View all students? <a href="view-students.jsp">Click here</a></p>
    </div>
</div>
</body>
</html>