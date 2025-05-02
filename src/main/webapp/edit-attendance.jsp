<%@ page import="com.attendance.dao.AttendanceDAO" %>
<%@ page import="com.attendance.dao.StudentDAO" %>
<%@ page import="com.attendance.model.AttendanceRecord" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AttendanceDAO attendanceDAO = new AttendanceDAO();
    StudentDAO studentDAO = new StudentDAO();
    AttendanceRecord record = attendanceDAO.getAttendanceById(Integer.parseInt(request.getParameter("id")));
%>
<html>
<head>
    <title>Edit Attendance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }
        .info-display {
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border-left: 4px solid #3498db;
            margin-bottom: 15px;
        }
        select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border 0.3s;
        }
        select:focus, textarea:focus {
            border-color: #3498db;
            outline: none;
        }
        textarea {
            min-height: 80px;
            resize: vertical;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        .cancel-btn {
            background-color: #95a5a6;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            color: white;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .cancel-btn:hover {
            background-color: #7f8c8d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Attendance Record</h1>

    <form action="update-attendance" method="post">
        <input type="hidden" name="id" value="<%= record.getId() %>">

        <div class="form-group">
            <label>Student</label>
            <div class="info-display">
                <%= studentDAO.getStudentById(record.getStudentId()).getName() %>
            </div>
        </div>

        <div class="form-group">
            <label>Date</label>
            <div class="info-display">
                <%= record.getDate() %>
            </div>
        </div>

        <div class="form-group">
            <label for="status">Attendance Status</label>
            <select id="status" name="status" required>
                <option value="Present" <%= "Present".equals(record.getStatus()) ? "selected" : "" %>>Present</option>
                <option value="Absent" <%= "Absent".equals(record.getStatus()) ? "selected" : "" %>>Absent</option>
                <option value="Late" <%= "Late".equals(record.getStatus()) ? "selected" : "" %>>Late</option>
            </select>
        </div>

        <div class="form-group">
            <label for="remarks">Remarks</label>
            <textarea id="remarks" name="remarks" placeholder="Enter any additional notes..."><%= record.getRemarks() != null ? record.getRemarks() : "" %></textarea>
        </div>

        <div class="button-group">
            <button type="submit">Update Attendance</button>
            <a href="view-attendance.jsp" class="cancel-btn">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>