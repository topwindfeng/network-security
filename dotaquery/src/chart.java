

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chart")
public class chart extends HttpServlet {
    
	public chart() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("chart run");
		Statement stmt;
		try {
			String name=request.getParameter("name");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(name +"runing chart");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = "Select PRANK,SRANK,FRANK,KRANK,DRANK from RANK where RANK.ACCOUNT_ID in (Select USERS.ACCOUNT_ID from USERS where USERS.USER_NAME='"+name+"')";
			System.out.println(query);
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			String[] al = new String[5];
			while(rs.next())
			{
				al[0]=(rs.getString("PRANK"));
				al[1]=(rs.getString("SRANK"));
				al[2]=(rs.getString("FRANK"));
				al[3]=(rs.getString("KRANK"));
				al[4]=(rs.getString("DRANK"));
			}
            String output=al[0]+","+al[1]+","+al[2]+","+al[3]+","+al[4];
    		response.setContentType("text/html");
    		PrintWriter out = response.getWriter();
			out.print(output);
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}
}
