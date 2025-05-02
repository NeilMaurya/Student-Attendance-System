package com.attendance.dao;

import com.attendance.model.Teacher;
import com.attendance.util.DatabaseUtil;
import java.sql.*;

public class TeacherDAO {
    public Teacher authenticate(String username, String password) {
        String sql = "SELECT * FROM teachers WHERE username = ? AND password = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Teacher teacher = new Teacher();
                teacher.setId(rs.getInt("id"));
                teacher.setUsername(rs.getString("username"));
                teacher.setPassword(rs.getString("password"));
                teacher.setSubject(rs.getString("subject"));
                return teacher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}