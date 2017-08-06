

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/History")
public class History extends HttpServlet {
    
	public History() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("history run");
		Statement stmt;
		try {
			String name=request.getParameter("name");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(name +"runing chart");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = "select NAME,TYPE,KDA,HERO_DAMAGE,DURATION from(select * from(select START_TIME,DURATION,MATCH_ID,HERO_ID,KDA,HERO_DAMAGE from PLAYS natural join MATCH where ACCOUNT_ID=(select ACCOUNT_ID from USERS where USER_NAME = '"+name+"') order by START_TIME desc)where rownum<=10) natural join HERO";
			System.out.println(query);
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			StringBuilder sb = new StringBuilder();
			
			while(rs.next())
			{
				
				sb.append(rs.getString(1));
				sb.append(',');
				String type = rs.getString(2);
				if (type.equals("S")) {
					sb.append("strength");
				}else if(type.equals("I")) {
					sb.append("intelligence");
				}else {
					sb.append("agility");
				}
				sb.append(',');
				sb.append(rs.getString(3));
				sb.append(',');
				sb.append(rs.getString(4));
				sb.append(',');
				sb.append(rs.getString(5));
				sb.append(',');
			}
            String output = sb.toString();
            System.out.println(output);
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
