package com.attendance.servlet;

import com.attendance.dao.StudentDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/delete-student")
public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            StudentDAO studentDAO = new StudentDAO();
            boolean success = studentDAO.deleteStudent(id);

            if (success) {
                response.sendRedirect("view-students.jsp?success=delete");
            } else {
                response.sendRedirect("view-students.jsp?error=delete_failed");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("view-students.jsp?error=invalid_id");
        }
    }
}