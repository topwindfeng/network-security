import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class Search extends HttpServlet{
    public Search() {
    	super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select = request.getParameter("select");
		String value = request.getParameter("value");
		System.out.println(select);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement stmt;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = null;
			if (select.equals("playerid")) {
				query = "select USER_NAME from USERS where ACCOUNT_ID = '" + value +"'";
			} else{
			      query = "select USER_NAME from USERS where USER_NAME = '" + value +"'";
			}
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			
			String name = null;
			if (rs.next()) {
			    name = rs.getString(1);
			}
			System.out.println(name);
	
			if (!name.isEmpty()) {
                out.print("user.jsp?profile=" + name);
			} else {
				out.print("0");
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
