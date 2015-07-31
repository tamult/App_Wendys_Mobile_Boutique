package com.wendys;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class AListener
 *
 */
@WebListener
public class AListener implements ServletContextListener, HttpSessionListener, ServletRequestListener {
    public AListener() {
        // TODO Auto-generated constructor stub
    }
    public void requestDestroyed(ServletRequestEvent arg0)  { 
         System.out.println("Servlet request event destroy...");
    }
    public void contextInitialized(ServletContextEvent arg0)  { 
         System.out.println("Servlet context event initialized");
    }
    public void sessionCreated(HttpSessionEvent arg0)  { 
         System.out.println("HTTP session event created");
    }
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
        System.out.println("HTTP session event destroyed");
    }
    public void contextDestroyed(ServletContextEvent arg0)  { 
        System.out.println("Servlet context event destroyed");
    }
    public void requestInitialized(ServletRequestEvent arg0)  { 
        System.out.println("Servlet request event initialized");
    }
}
