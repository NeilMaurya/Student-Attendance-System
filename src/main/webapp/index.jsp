<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Login | Student Attendance System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --success-color: #2ecc71;
            --success-hover: #27ae60;
            --error-color: #e74c3c;
            --light-gray: #f8f9fa;
            --dark-gray: #343a40;
            --text-color: #333333;
            --border-color: #dddddd;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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
            font-weight: 500;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .login-container {
            background-color: white;
            padding: 2.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
            margin: 2rem 0;
        }

        .login-title {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--dark-gray);
            font-weight: 500;
        }

        .alert-error {
            color: var(--error-color);
            text-align: center;
            margin-bottom: 1.5rem;
            padding: 0.75rem;
            background-color: #fdecea;
            border-radius: 5px;
            border-left: 4px solid var(--error-color);
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-weight: 500;
            color: var(--dark-gray);
        }

        .form-control {
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .btn {
            padding: 0.75rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--success-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--success-hover);
        }

        footer {
            background-color: var(--dark-gray);
            color: white;
            text-align: center;
            padding: 1.5rem;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        @media (max-width: 768px) {
            .login-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            header {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">Student Attendance System</div>
    </div>
</header>

<main>
    <div class="login-container">
        <h1 class="login-title">Teacher Login</h1>

        <% if (request.getParameter("error") != null) { %>
        <div class="alert-error">Invalid username or password!</div>
        <% } %>

        <form class="login-form" action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</main>

<footer>
    <div class="footer-container">
        <p>&copy; <%= java.time.Year.now().getValue() %> Student Attendance System. All rights reserved.</p>
    </div>
</footer>
</body>
</html>