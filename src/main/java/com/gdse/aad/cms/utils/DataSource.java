package com.gdse.aad.cms.utils;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class DataSource implements ServletContextListener {

    public DataSource() {
        // Required public no-arg constructor (Tomcat uses this)
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialize connection pool
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/complaint_management_system");
        ds.setUsername("root");
        ds.setPassword("Ijse@1234");
        ds.setInitialSize(5);   // minimum idle connections
        ds.setMaxTotal(10);     // max total connections

        ServletContext sc = sce.getServletContext();
        sc.setAttribute("ds", ds);
        System.out.println("DataSource initialized for complaint_management_system");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Clean up
        try {
            ServletContext sc = sce.getServletContext();
            BasicDataSource ds = (BasicDataSource) sc.getAttribute("ds");
            if (ds != null) {
                ds.close();
                System.out.println("DataSource closed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to close DataSource", e);
        }
    }
}

