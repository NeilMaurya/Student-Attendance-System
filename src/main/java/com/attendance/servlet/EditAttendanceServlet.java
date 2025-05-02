package com.attendance.servlet;

import com.attendance.dao.AttendanceDAO;
import com.attendance.model.AttendanceRecord;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/update-attendance")
public class EditAttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AttendanceRecord record = new AttendanceRecord();
            record.setId(Integer.parseInt(request.getParameter("id")));
            record.setStatus(request.getParameter("status"));
            record.setRemarks(request.getParameter("remarks"));

            boolean success = new AttendanceDAO().updateAttendance(record);
            response.sendRedirect("view-attendance.jsp?" + (success ? "success" : "error") + "=Attendance updated");
        } catch (Exception e) {
            response.sendRedirect("view-attendance.jsp?error=" + e.getMessage());
        }
    }
}