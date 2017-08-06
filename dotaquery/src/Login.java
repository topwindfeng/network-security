import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet{
    public Login() {
    	super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login run");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(name);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement stmt;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = "select PASSWORD from USERS where USER_NAME = '" + name +"'";
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			ArrayList al=null;
			String psw = null;
			while (rs.next()) {
			    psw = rs.getString(1);
			}
			System.out.println(psw);
			System.out.println(password);
			if (psw.equals(password)) {
				System.out.println("user test");
                out.print("user.jsp?name=" + name +"&profile=" + name);
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
