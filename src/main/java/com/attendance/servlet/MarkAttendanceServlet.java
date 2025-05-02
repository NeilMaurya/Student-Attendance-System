package com.attendance.servlet;

import com.attendance.dao.*;
import com.attendance.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/mark-attendance")
public class MarkAttendanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setAttribute("students", new StudentDAO().getAllStudents());
            request.setAttribute("today", LocalDate.now().toString());
            request.getRequestDispatcher("mark-attendance.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            AttendanceRecord record = new AttendanceRecord(
                    Integer.parseInt(request.getParameter("studentId")),
                    LocalDate.parse(request.getParameter("date")),
                    request.getParameter("status"),
                    request.getParameter("remarks")
            );

            boolean success = new AttendanceDAO().markAttendance(record);
            response.sendRedirect("view-attendance.jsp?success=Attendance marked");

        } catch (Exception e) {
            response.sendRedirect("mark-attendance.jsp?error=" + e.getMessage());
        }
    }
}