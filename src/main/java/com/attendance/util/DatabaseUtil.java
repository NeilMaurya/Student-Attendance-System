package com.attendance.util;

import java.sql.*;

public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/attendance_system?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "0510";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("DEBUG: Connection established successfully");
        return conn;
    }
}