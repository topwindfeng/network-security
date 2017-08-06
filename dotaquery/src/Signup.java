

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup")
public class Signup extends HttpServlet{
    public Signup() {
    	super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Signup run");
		String uname = request.getParameter("uname");
		String pid = request.getParameter("pid");
		String email = request.getParameter("email");
		String psw = request.getParameter("psw");
		String rpsw = request.getParameter("rpsw");
		System.out.println(uname.equals("user"));
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement stmt;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = "select EMAIL_ADD from USERS where EMAIL_ADD = '"+email+"'";
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			String em = null;
			while (rs.next()) {
			    em= rs.getString(1);
			}
			query="select ACCOUNT_ID from USERS where ACCOUNT_ID = '" + pid +"'";
			rs =stmt.executeQuery(query);
			String id = null;
			while (rs.next()) {
			    id= rs.getString(1);
			}
			query="select USER_NAME from USERS where USER_NAME = '" + uname +"'";
			rs =stmt.executeQuery(query);
			System.out.println(query);
			//ArrayList al=null;
			String un = null;
			while (rs.next()) {
			    un= rs.getString(1);
			}
			
			
			System.out.println(un);
			System.out.println(id);
			System.out.println(em);
			System.out.println(psw);
			System.out.println(rpsw);
			if (!psw.equals(rpsw)) {
                out.print("0");
			} 
			else if(em!=null)
			{
				out.print("1");
			}
			else if(id!=null)
			{
				out.print("2");
			}
			else if(un!=null)
			{
				out.print("3");
			}
			else 
			{
				query="insert into USERS values ('"+pid+"','"+uname+"','"+email+"','"+psw+"')";
				rs =stmt.executeQuery(query);
				out.print("4");
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
