package com.wendys;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


/**
 * Application Lifecycle Listener implementation class AListener
 *
 */
@WebListener
public class AListener implements ServletContextListener {
	
    public AListener() {
        // TODO Auto-generated constructor stub
    }
 
    public void contextInitialized(ServletContextEvent arg0)  { 
         System.out.println("Servlet context event initialized");
    }
  
    public void contextDestroyed(ServletContextEvent arg0)  { 
        System.out.println("Servlet context event destroyed");
    }
   
}
