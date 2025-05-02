<%@ page import="com.attendance.dao.StudentDAO" %>
<%@ page import="com.attendance.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 120px; font-weight: bold; }
        select, input, textarea {
            padding: 8px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .error { color: red; margin-bottom: 15px; }
        .success { color: green; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Mark Attendance</h1>

    <%-- Status Messages --%>
    <% if (request.getParameter("error") != null) { %>
    <div class="error"><strong>Error:</strong> <%= request.getParameter("error") %></div>
    <% } %>
    <% if (request.getParameter("success") != null) { %>
    <div class="success"><%= request.getParameter("success") %></div>
    <% } %>

    <form action="mark-attendance" method="post">
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="${today}" required>
        </div>

        <div class="form-group">
            <label for="studentId">Student:</label>
            <select id="studentId" name="studentId" required>
                <option value="">-- Select Student --</option>
                <%
                    StudentDAO studentDAO = new StudentDAO();
                    List<Student> students = studentDAO.getAllStudents();
                    for (Student student : students) {
                %>
                <option value="<%= student.getId() %>">
                    <%= student.getRollNumber() %> - <%= student.getName() %>
                </option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
                <option value="Late">Late</option>
            </select>
        </div>

        <div class="form-group">
            <label for="remarks">Remarks:</label>
            <textarea id="remarks" name="remarks" rows="3"></textarea>
        </div>

        <button type="submit">Submit Attendance</button>
        <a href="view-attendance.jsp" style="margin-left: 20px;">View Attendance Records</a>
    </form>
</div>
</body>
</html>