# 📢📋 Complaint Management System (CMS)

A simple web-based complaint tracking system for employees and administrators, built using JSP, Servlets, MySQL, and Apache DBCP connection pooling.

---

## 📌 Project Overview

The Complaint Management System allows:
- 👨‍💼 **Employees** to register, log in, and submit complaints.
- 👩‍💻 **Admins**  to view all complaints, and update their status.

### ✨ Features
- User registration and login with **BCrypt** password hashing.
- Role-based dashboards (Admin / Employee).
- Complaint submit, view submitted complaints, edit, and delete pending complaints (employee). 
- View all complaints, update their status (Pending, In Progress, Resolved and Rejected), add remarks, and delete complaints (admin).
- Follows **MVC architecture**.
- Built using **JSP**, **Servlets**, **JDBC**, **MySQL**, and **Bootstrap**.
- ️Complaint records include timestamps (`created_at`, `updated_at`) and remarks.[more...](https://www.geeksforgeeks.org/mysql/datetime-vs-timestamp-data-type-in-mysql/#:~:text=Understanding%20TIMESTAMP)

---

## ⚙️ Setup & Configuration Guide

### 🧱 Technology Requirements

- Java JDK 17+
- Apache Tomcat 10+ or 11
- MySQL Server (5.7+ or 8.0+)
- Apache Maven (optional, for build/dependency management)

---

### 📁 Project Folder Structure - Model-View-Controller (MVC) pattern

```
CMS_Complaint_Management_System/
│
├── src/
│ └── com/gdse/aad/cms/
│ ├── controller/            # Servlets handling employee and admin requests
│ ├── dao/                   # DAO classes for database access and operations (DBCP)
│ ├── db/                    # DB structure
│ ├── model/                 # JavaBeans (User, Complaint)
│ └── utils/                 # DataSource connection pool
│
├── web/
│ ├── all_complaints.jsp
│ ├── complaint_form.jsp
│ ├── dashboard.jsp
│ ├── login.jsp
│ ├── register.jsp
│ ├── update_complaint_status.jsp
│ ├── update_user_complaint.jsp
│ ├── user_complaints.jsp
│ └── WEB-INF/web.xml
│
└── pom.xml/                 # Maven configuration file for dependencies and build
```

---

### 🛠️ Step-by-Step Setup

#### 1. 💾 Database Setup

- Create a MySQL database.
- Run the `schema.sql` provided:

```sql
CREATE DATABASE IF NOT EXISTS complaint_management_system;
USE complaint_management_system;

CREATE TABLE IF NOT EXISTS user (
  uid VARCHAR(50) PRIMARY KEY,
  uname VARCHAR(100),
  uemail VARCHAR(100) UNIQUE,
  upassword VARCHAR(300),
  urole ENUM('EMPLOYEE', 'ADMIN')
);

CREATE TABLE IF NOT EXISTS complaint (
  cid VARCHAR(50) PRIMARY KEY,
  user_id VARCHAR(50),
  ctitle VARCHAR(300),
  cdescription TEXT,
  cstatus ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED', 'REJECTED') DEFAULT 'PENDING',
  cremarks TEXT,
  ccreated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  cupdated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(uid) ON DELETE CASCADE
);
```

#### 2. ⚙️ Configure the Database Connection

- Configure database connection details in the servlet context or connection pool settings.
- File: DataSource.java

```
ds.setUrl("jdbc:mysql://localhost:3306/complaint_management_system");
ds.setUsername("root"); // change to your username!
ds.setPassword("your_password"); // change to your password!
```

3. ▶️ Deploy on Apache Tomcat

- Open your IDE.
- Import as Maven project (if using Maven).
- Build the project (`mvn clean package`).
- Deploy the WAR file to Tomcat’s `webapps` folder.
- Start Tomcat server.
- Visit: http://localhost:8080/CMS_Complaint_Management_System
- Log in as an employee or admin to access the respective dashboard.

---

### ✅ Status

-  Completed core features (Servlets, JSP, MVC, No AJAX or any asynchronous HTTP mechanism)

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repo.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add feature'`).
4. Push to your branch (`git push origin feature-name`).
5. Open a Pull Request with a clear description.

---

## 📧 Contact

For questions or support:

- **Email:** gamitha.gimhana99@gmail.com
- **GitHub:** [Gamitha Gimhana](https://github.com/GamithaGimhana)
- **Linkedin:** [Gamitha Gimhana](https://www.linkedin.com/in/gamithagimhana/)

---

## 📚 License

- This project is developed by Gamitha Gimhana.

---

Thank you for using the Complaint Management System! 🎉

---