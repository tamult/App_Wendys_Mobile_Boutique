package com.wendys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(description = "Edit Fashion Item", urlPatterns = { "/EditItemServlet" })
public class AdminEditItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditItemServlet() {     super();       }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		session.setAttribute("id", session.getId());
		
		MySQLManager dB = new MySQLManager();
		if (!dB.isPatent()) {
			System.out.println("Cannot access DB...");
			return;
		}
		try {
			String id = request.getParameter("inventoryid");
			int iid = Integer.parseInt(id);
			ResultSet rS;
			String qStr;
			qStr = "use Wendy";
			dB.executeUpdate(qStr);

			qStr = "select * "
					+ "from inventory where archive='no' " 
					+ "and inventoryid = ? ";
			
			PreparedStatement pS = dB.conn.prepareStatement(qStr);	
			pS.setInt(1,iid);
			rS=pS.executeQuery();
			
			System.out.println("did query return an item?????" + rS.first());
			
			if (rS.first())  {
				
				
				request.setAttribute("item",rS);
				
				System.out.println(rS.getString("season"));
				
				
				
				request.getRequestDispatcher("/adminEditItem.jsp")
				.forward(request, response);
				
			} else {
				System.out.println("Result Set returned no data...");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			out.print(e.getMessage());
		}			
	}
}
