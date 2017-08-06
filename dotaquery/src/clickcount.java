

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Clickcount")
public class clickcount extends HttpServlet {
    
	public clickcount() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("servlet run");
		Statement stmt;
		try {
			String str=request.getParameter("str");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = "Update VIDEO set VI=VI+1 where VIDEO_NAME='"+str+"'";
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			rs=stmt.executeQuery("commit");
			System.out.println("111111111"+str);
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}
}
