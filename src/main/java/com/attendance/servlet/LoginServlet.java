package com.attendance.servlet;

import com.attendance.dao.TeacherDAO;
import com.attendance.model.Teacher;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        TeacherDAO teacherDAO = new TeacherDAO();
        Teacher teacher = teacherDAO.authenticate(username, password);

        if (teacher != null) {
            HttpSession session = request.getSession();
            session.setAttribute("teacher", teacher);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}