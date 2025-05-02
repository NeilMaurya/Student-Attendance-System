package com.attendance.model;

public class Student {
    private int id;  // Now properly included
    private String rollNumber;
    private String name;
    private String email;
    private String className;

    public Student() {}

    public Student(String rollNumber, String name, String email, String className) {
        this.rollNumber = rollNumber;
        this.name = name;
        this.email = email;
        this.className = className;
    }

    public Student(int id, String rollNumber, String name, String email, String className) {
        this.id = id;
        this.rollNumber = rollNumber;
        this.name = name;
        this.email = email;
        this.className = className;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getRollNumber() { return rollNumber; }
    public void setRollNumber(String rollNumber) { this.rollNumber = rollNumber; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
}