# Student Attendance System 🎓

A robust Java web application for managing student attendance records with secure authentication, real-time reporting, and database integration.

## Features ✨

- **Role-Based Access** (Admin/Teacher/Student)
- **Real-time Attendance Tracking** with status (Present/Absent/Late)
- **Automated Reports** (Daily/Monthly/Yearly)
- **Responsive UI** works on all devices
- **Secure Authentication** with password hashing
- **Data Export** to Excel/PDF

## Tech Stack 🛠️

| Component       | Technology                          |
|-----------------|-------------------------------------|
| Frontend        | JSP, Bootstrap 5, JSTL             |
| Backend         | Java Servlets (Jakarta EE)          |
| Database        | MySQL 8                             |
| Build Tool      | Maven                               |
| Web Server      | Apache Tomcat 11                    |
| Security        | Session Management, Input Validation|

## Database Schema 📊

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_number VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    class VARCHAR(50) NOT NULL
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    date DATE NOT NULL,
    status ENUM('Present','Absent','Late') NOT NULL
);
```

## Installation Guide 🚀

### Prerequisites
- JDK 17+
- Apache Tomcat 11
- MySQL 8.0

### Steps
1. **Clone the repo**:
   ```bash
   git clone https://github.com/yourusername/student-attendance-system.git
   ```

2. **Database Setup**:
   ```bash
   mysql -u root -p < src/main/resources/db_schema.sql
   ```

3. **Configure DB Credentials**:
   Update `DBUtil.java` with your MySQL credentials:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/attendance_system";
   private static final String USER = "your_username";
   private static final String PASSWORD = "your_password";
   ```

4. **Deploy to Tomcat**:
   - Build with Maven: `mvn clean package`
   - Copy WAR file to Tomcat's `webapps` directory

## Usage Demo 🎥

| Feature          | URL Path              |
|------------------|-----------------------|
| Admin Dashboard  | `/admin`              |
| Mark Attendance  | `/attendance`         |
| View Reports     | `/reports`            |
| Student Portal   | `/student/dashboard`  |

## Project Structure 📂

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── neil/
│   │           └── attendance/
│   │               ├── model/       # POJOs
│   │               ├── dao/         # Database operations
│   │               ├── service/     # Business logic
│   │               ├── servlet/     # Controllers
│   │               └── util/        # Utilities
│   ├── resources/                   # Config files
│   └── webapp/
│       ├── WEB-INF/
│       ├── css/                     # Custom styles
│       ├── js/                      # Client-side scripts
│       └── views/                   # JSP files
└── test/                            # Unit tests
```

## Contributors 👥

- [Neil Basant Maurya](https://github.com/NeilMaurya) (Team Lead)
- [Dhruv Chaudhary]()

---

**Need Help?**  
Open an issue or contact at `neilbmaurya@gmail.com`
