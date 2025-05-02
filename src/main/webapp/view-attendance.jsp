<%@ page import="com.attendance.dao.AttendanceDAO" %>
<%@ page import="com.attendance.dao.StudentDAO" %>
<%@ page import="com.attendance.model.AttendanceRecord" %>
<%@ page import="com.attendance.model.Student" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Attendance | Student Attendance System</title>
  <style>
    :root {
      --primary-color: #3498db;
      --secondary-color: #2980b9;
      --success-color: #28a745;
      --error-color: #dc3545;
      --warning-color: #ffc107;
      --light-gray: #f8f9fa;
      --dark-gray: #343a40;
      --text-color: #212529;
      --border-color: #dee2e6;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
      flex: 1;
      max-width: 1200px;
      margin: 2rem auto;
      padding: 0 2rem;
      width: 100%;
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

    .filter-card {
      background-color: white;
      border-radius: 8px;
      padding: 1.5rem;
      margin-bottom: 2rem;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .filter-form {
      display: flex;
      align-items: center;
      gap: 1rem;
      flex-wrap: wrap;
    }

    .filter-form label {
      font-weight: 500;
      color: var(--dark-gray);
    }

    .filter-form input[type="date"] {
      padding: 0.5rem;
      border: 1px solid var(--border-color);
      border-radius: 4px;
    }

    .btn {
      padding: 0.5rem 1rem;
      border-radius: 4px;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s;
      cursor: pointer;
      border: none;
      font-size: 0.9rem;
    }

    .btn-primary {
      background-color: var(--primary-color);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--secondary-color);
    }

    .btn-success {
      background-color: var(--success-color);
      color: white;
      margin-left: 1rem;
    }

    .btn-success:hover {
      background-color: #218838;
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
      min-width: 800px;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid var(--border-color);
    }

    th {
      background-color: var(--light-gray);
      font-weight: 600;
      color: var(--dark-gray);
      position: sticky;
      top: 0;
    }

    tr:hover {
      background-color: rgba(0,0,0,0.02);
    }

    .status-Present {
      color: var(--success-color);
      font-weight: 600;
    }

    .status-Absent {
      color: var(--error-color);
      font-weight: 600;
    }

    .status-Late {
      color: var(--warning-color);
      font-weight: 600;
    }

    .actions {
      white-space: nowrap;
    }

    .actions a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    .actions a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }

    .empty-message {
      text-align: center;
      padding: 2rem;
      color: #6c757d;
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
        justify-content: center;
      }

      nav ul li {
        margin: 0 0.75rem;
      }

      .filter-form {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.75rem;
      }

      .btn-success {
        margin-left: 0;
        margin-top: 0.5rem;
      }

      main {
        padding: 0 1rem;
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
        <li><a href="view-attendance.jsp">View Attendance</a></li>
        <li><a href="mark-attendance.jsp">Mark Attendance</a></li>
      </ul>
    </nav>
  </div>
</header>

<main>
  <h1 class="page-title">Attendance Records</h1>

  <%-- Status Messages --%>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-error"><strong>Error:</strong> <%= request.getParameter("error") %></div>
  <% } %>
  <% if (request.getParameter("success") != null) { %>
  <div class="alert alert-success"><%= request.getParameter("success") %></div>
  <% } %>

  <div class="filter-card">
    <form class="filter-form" method="get">
      <label for="filterDate">Filter by Date:</label>
      <input type="date" id="filterDate" name="filterDate"
             value="<%= request.getParameter("filterDate") != null ?
                                     request.getParameter("filterDate") :
                                     LocalDate.now().toString() %>">
      <button type="submit" class="btn btn-primary">Apply Filter</button>
      <a href="mark-attendance.jsp" class="btn btn-success">Mark New Attendance</a>
    </form>
  </div>

  <%
    LocalDate filterDate = request.getParameter("filterDate") != null ?
            LocalDate.parse(request.getParameter("filterDate")) :
            LocalDate.now();

    AttendanceDAO attendanceDAO = new AttendanceDAO();
    StudentDAO studentDAO = new StudentDAO();
    List<AttendanceRecord> records = attendanceDAO.getAttendanceByDate(filterDate);
  %>

  <div class="table-container">
    <table>
      <thead>
      <tr>
        <th>Date</th>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Status</th>
        <th>Remarks</th>
        <th class="actions">Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (records.isEmpty()) { %>
      <tr>
        <td colspan="6" class="empty-message">No attendance records found for <%= filterDate %></td>
      </tr>
      <% } else {
        for (AttendanceRecord record : records) {
          Student student = studentDAO.getStudentById(record.getStudentId());
      %>
      <tr>
        <td><%= record.getDate() %></td>
        <td><%= student.getRollNumber() %></td>
        <td><%= student.getName() %></td>
        <td class="status-<%= record.getStatus() %>"><%= record.getStatus() %></td>
        <td><%= record.getRemarks() != null ? record.getRemarks() : "-" %></td>
        <td class="actions">
          <a href="edit-attendance.jsp?id=<%= record.getId() %>">Edit</a>
        </td>
      </tr>
      <% }
      } %>
      </tbody>
    </table>
  </div>
</main>

<footer>
  <div class="footer-container">
    <p>&copy; <%= java.time.Year.now().getValue() %> Student Attendance System. All rights reserved.</p>
  </div>
</footer>
</body>
</html>