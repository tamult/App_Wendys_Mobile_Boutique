package com.wendys;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminAddItemServlet
 */
@WebServlet(description = "Add a garment to database", 
urlPatterns = { "/AdminAddItemServlet" }
)
public class AdminAddItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminAddItemServlet() {   super();    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
			MySQLManager dB = new MySQLManager();
			if (!dB.isPatent()) {
				System.out.println("Cannot access DB...");
				return;
			}
			
			try {
				ResultSet rS;
				String qStr;
				qStr = "use Wendy";
				dB.executeUpdate(qStr);

				qStr = "select max inventoryid as bigid from inventory where archive='no' ";
						
				
				rS = dB.executeQuery(qStr);	
				if (rS.first())  {
					
					
					
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				response.setContentType("text/html");
				response.getWriter().print(e.getMessage());
			}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
