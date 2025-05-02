package com.attendance.servlet;

import com.attendance.dao.StudentDAO;
import com.attendance.model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register-student")
public class RegisterStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String rollNumber = request.getParameter("rollNumber");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String className = request.getParameter("class");


            if (rollNumber == null || rollNumber.trim().isEmpty() ||
                    name == null || name.trim().isEmpty()) {
                response.sendRedirect("register-student.jsp?error=Required fields missing");
                return;
            }

            Student student = new Student();
            student.setRollNumber(rollNumber);
            student.setName(name);
            student.setEmail(email);
            student.setClassName(className);

            StudentDAO dao = new StudentDAO();
            boolean success = dao.addStudent(student);

            if (success) {
                response.sendRedirect("view-students.jsp?success=Student registered");
            } else {
                response.sendRedirect("register-student.jsp?error=Registration failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register-student.jsp?error=Server error: " + e.getMessage());
        }
    }
}