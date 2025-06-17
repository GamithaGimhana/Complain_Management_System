#  Complaint Management System (CMS)

A simple web-based complaint tracking system for employees and administrators, built using JSP, Servlets, MySQL, and Apache DBCP connection pooling.

---

##  Project Overview

The Complaint Management System allows:
-  **Employees** to register, log in, and submit complaints.
-  **Admins** to view all complaints, and update their status.
- ️Complaint records include timestamps (`created_at`, `updated_at`) and remarks.[more...](https://www.geeksforgeeks.org/mysql/datetime-vs-timestamp-data-type-in-mysql/#:~:text=Understanding%20TIMESTAMP)

###  Features
- User registration & login with **BCrypt** password hashing
- Role-based dashboards (Admin / Employee)
- Submit, edit, and delete complaints (employee)
- Admin complaint management (status updates & remarks)
- Follows **MVC architecture**
- Built using only **JSP**, **Servlets**, **JDBC**, **MySQL**, and **Bootstrap**

---

##  Setup & Configuration Guide

###  Technology Requirements

- Java JDK 17+
- Apache Tomcat 11
- MySQL Server 8.0
- Apache Maven 
- MySQL Workbench 

---

###  Project Folder Structure - Model-View-Controller (MVC) pattern

- CMS_Complaint_Management_System/
- │
- ├── src/
- │ └── com/gdse/aad/cms/
- │ ├── controller/ # Servlets
- │ ├── dao/ # Data access (DBCP)
- │ ├── model/ # JavaBeans (User, Complaint)
- │ └── utils/ # DataSource connection pool
- │
- ├── web/
- │ ├── all_complaints.jsp
- │ ├── complaint_form.jsp
- │ ├── dashboard.jsp
- │ ├── edit_complaint.jsp
- │ ├── login.jsp
- │ ├── my_complaints.jsp
- │ ├── register.jsp
- │ ├── update_complaint.jsp
- │ └── WEB-INF/web.xml
- │
- └── schema.sql # DB structure

---

###  Step-by-Step Setup

#### 1.  Database Setup

- Open MySQL Workbench
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

#### 2.  Configure the Database Connection

- File: DataSource.java

```
ds.setUrl("jdbc:mysql://localhost:3306/complaint_management_system");
ds.setUsername("root");
ds.setPassword("your_password"); // change this!
```

#### 3.  Deploy on Apache Tomcat

- Open IntelliJ IDEA
- Import as Maven project
- Run on Apache Tomcat
- Visit: http://localhost:8080/CMS_Complaint_Management_System

####  Status

-  Completed core features (Servlets, JSP, MVC, No AJAX or any asynchronous HTTP mechanism)

####  License

- This project is developed by Gamitha Gimhana.