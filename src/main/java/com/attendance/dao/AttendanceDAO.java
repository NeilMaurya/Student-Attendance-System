package com.attendance.dao;

import com.attendance.model.AttendanceRecord;
import com.attendance.util.DatabaseUtil;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {
    public boolean markAttendance(AttendanceRecord record) {
        String sql = "INSERT INTO attendance (student_id, date, status, remarks) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, record.getStudentId());
            stmt.setDate(2, Date.valueOf(record.getDate()));
            stmt.setString(3, record.getStatus());
            stmt.setString(4, record.getRemarks());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error marking attendance: " + e.getMessage());
            return false;
        }
    }

    public List<AttendanceRecord> getAttendanceByDate(LocalDate date) {
        List<AttendanceRecord> records = new ArrayList<>();
        String sql = "SELECT a.id, a.student_id, a.status, a.remarks, s.name " +
                "FROM attendance a JOIN students s ON a.student_id = s.id " +
                "WHERE a.date = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, Date.valueOf(date));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setId(rs.getInt("id"));
                record.setStudentId(rs.getInt("student_id"));
                record.setStatus(rs.getString("status"));
                record.setRemarks(rs.getString("remarks"));
                records.add(record);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching attendance: " + e.getMessage());
        }
        return records;
    }

    public AttendanceRecord getAttendanceById(int id) throws SQLException {
        String sql = "SELECT * FROM attendance WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setId(rs.getInt("id"));
                record.setStudentId(rs.getInt("student_id"));
                record.setDate(rs.getDate("date").toLocalDate());
                record.setStatus(rs.getString("status"));
                record.setRemarks(rs.getString("remarks"));
                return record;
            }
        }
        return null;
    }

    public boolean updateAttendance(AttendanceRecord record) throws SQLException {
        String sql = "UPDATE attendance SET status=?, remarks=? WHERE id=?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, record.getStatus());
            stmt.setString(2, record.getRemarks());
            stmt.setInt(3, record.getId());
            return stmt.executeUpdate() > 0;
        }
    }
}