-- Create database
CREATE DATABASE IF NOT EXISTS complaint_management_system;
USE complaint_management_system;

-- User table
CREATE TABLE IF NOT EXISTS user (
    uid VARCHAR(50) PRIMARY KEY,
    uname VARCHAR(100) NOT NULL,
    uemail VARCHAR(100) NOT NULL UNIQUE,
    upassword VARCHAR(300) NOT NULL,
    urole ENUM('EMPLOYEE', 'ADMIN') NOT NULL
);

-- Complaint table
CREATE TABLE IF NOT EXISTS complaint (
    cid VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    ctitle VARCHAR(300) NOT NULL,
    cdescription TEXT NOT NULL,
    cstatus ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED', 'REJECTED') DEFAULT 'PENDING',
    cremarks TEXT,
    ccreated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cupdated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(uid) ON DELETE CASCADE
);
