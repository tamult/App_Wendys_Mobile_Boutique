package com.wendys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/update")
public class ItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ItemUpdateServlet() {       super();          }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		MySQLManager dB = new MySQLManager();
		if (!dB.isPatent()) {
			System.out.println("Cannot access DB...");
			return;
		}
		try {
			int count = -1;
			String qStr;
			qStr = "use Wendy";
			dB.executeUpdate(qStr);	
			
			qStr="update inventory set locale = ?, "
					+ "type = ?, season = ?, style = ?, description = ?, "
					+ "color = ?, length = ?, size = ?, designer = ?, "
					+ "cost = ?, price = ?, amountpaid = ?, saledate = ?, "
					+ "receipt = ?, customer = ?, status = ?, source = ?, "
					+ "recorddate = ? where inventoryid = ?";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			PreparedStatement pS = dB.conn.prepareStatement(qStr);	
			pS.setString(1,request.getParameter("locale"));
			pS.setString(2,request.getParameter("type"));
			pS.setString(3,request.getParameter("season"));
			pS.setString(4,request.getParameter("style"));
			pS.setString(5,request.getParameter("description"));
			pS.setString(6,request.getParameter("color"));
			pS.setString(7,request.getParameter("length"));
			pS.setString(8,request.getParameter("size"));
			pS.setString(9,request.getParameter("designer"));
			pS.setDouble(10,Double.parseDouble(request.getParameter("cost")));
			pS.setDouble(11,Double.parseDouble(request.getParameter("price")));
			pS.setDouble(12,Double.parseDouble(request.getParameter("amountpaid")));
			pS.setDate(13,(Date) sdf.parse(request.getParameter("saledate")));
			pS.setString(14,request.getParameter("receipt"));
			pS.setString(15,request.getParameter("customer"));
			pS.setString(16,request.getParameter("status"));
			pS.setString(17,request.getParameter("source"));
			pS.setDate(18,(Date) sdf.parse(request.getParameter("recorddate")));
			pS.setInt(19,9999999);
			count = pS.executeUpdate();

		} catch (SQLException | ParseException e) {
			e.printStackTrace();
			out.print(e.getMessage());
		}			
	}

}
