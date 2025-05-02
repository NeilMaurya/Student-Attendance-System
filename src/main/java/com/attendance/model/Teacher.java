package com.attendance.model;

public class Teacher {
    private int id;
    private String username;
    private String password;
    private String subject;

    public Teacher() {}

    public Teacher(String username, String password, String name, String subject) {
        this.username = username;
        this.password = password;
        this.subject = subject;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
}