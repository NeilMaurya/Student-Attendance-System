package com.attendance.model;

import java.time.LocalDate;

public class AttendanceRecord {
    private int id;
    private int studentId;
    private LocalDate date;
    private String status; // "Present", "Absent", "Late"
    private String remarks;

    public AttendanceRecord() {}

    public AttendanceRecord(int studentId, LocalDate date, String status, String remarks) {
        this.studentId = studentId;
        this.date = date;
        this.status = status;
        this.remarks = remarks;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }
}