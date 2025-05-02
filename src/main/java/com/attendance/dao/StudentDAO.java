package com.attendance.dao;

import com.attendance.model.Student;
import com.attendance.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public boolean addStudent(Student student) throws SQLException {
        String sql = "INSERT INTO students (roll_number, name, email, class) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getRollNumber());
            stmt.setString(2, student.getName());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getClassName());

            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";

        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setRollNumber(rs.getString("roll_number"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setClassName(rs.getString("class"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.err.println("ERROR in getAllStudents: " + e.getMessage());
            e.printStackTrace();
        }
        return students;
    }

    public Student getStudentById(int id) {
        String sql = "SELECT * FROM students WHERE id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Student(
                        rs.getInt("id"),
                        rs.getString("roll_number"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("class")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error getting student: " + e.getMessage());
        }
        return null;
    }

    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id=?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting student: " + e.getMessage());
            return false;
        }
    }
}