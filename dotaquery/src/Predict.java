import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Predict")

public class Predict extends HttpServlet{
	
	public Predict() {
    	super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String player1 = request.getParameter("panme1");
		String player2 = request.getParameter("pname2");
		String player3 = request.getParameter("pname3");
		String player4 = request.getParameter("pname4");
		String player5 = request.getParameter("pname5");
		String player6 = request.getParameter("pname6");
		String player7 = request.getParameter("pname7");
		String player8 = request.getParameter("pname8");
		String player9 = request.getParameter("pname9");
		String player10 = request.getParameter("pname10");
		String hero1 = request.getParameter("hname1");
		String hero2 = request.getParameter("hname2");
		String hero3 = request.getParameter("hname3");
		String hero4 = request.getParameter("hname4");
		String hero5 = request.getParameter("hname5");
		String hero6 = request.getParameter("hname6");
		String hero7 = request.getParameter("hname7");
		String hero8 = request.getParameter("hname8");
		String hero9 = request.getParameter("hname9");
		String hero10 = request.getParameter("hname10");
		
	/*	String player1 = "Smith";
		String player2 = "Jones";
		String player3 = "Williams";
		String player4 = "Taylor";
		String player5 = "Brown";
		String player6 = "Davies";
		String player7 = "Evans";
		String player8 = "Wilson";
		String player9 = "Thomas";
		String player10 = "Gerald";
		String hero1 = "Anti Mage";
		String hero2 = "Axe";
		String hero3 = "Bane";
		String hero4 = "Drow Ranger";
		String hero5 = "Earthshaker";
		String hero6 = "Morphling";
		String hero7 = "Shadow Fiend";
		String hero8 = "Puck";
		String hero9 = "Vengeful Spirit";
		String hero10 = "Windranger";*/
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		ArrayList<Integer> hero = new ArrayList<>();
		ArrayList<Integer> player = new ArrayList<>();
		Connection con = null;
		Statement stmt;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
			String query = null;
			
			System.out.println(player1);
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player1 + "'";
			stmt=con.createStatement(); 
			ResultSet  rs = stmt.executeQuery(query);
			String name = null;
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name1");
			}
			
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player2 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name2");
			}
			
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player3 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name3");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player4 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name4");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player5 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name5");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player6 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name6");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player7 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name7");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player8 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name8");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player9 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name9");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player3 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name0");
			}
			query = "select ACCOUNT_ID from USERS where USER_NAME = '" + player10 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    player.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero1 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
			    hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero2 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero3 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero4 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero5 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero6 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero7 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero8 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero9 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			query = "select HERO_ID from HERO where NAME = '" + hero10 + "'";
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				hero.add(rs.getInt(1));
			} else {
				System.out.println("Wrong user name");
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		float[] ability = null;
		float predict = 0;
	
		  
		try {
			ability = abilities(hero);
			System.out.println(ability);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			predict = predict(hero, player, ability);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(predict);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < ability.length; i++) {
			sb.append(ability[i]);
			
			sb.append(',');
		}
		sb.append(predict*100);
		sb.append(',');
		float temp = 1 - predict;
		System.out.println(temp);
		sb.append(temp*100);
		String output = sb.toString();
		out.print(output);
			
		
		
	}
	// return information radiant: 0 = push, 1 = survive, 2 = farm, 3 = kda, 4 = damage
	// dire: 5 = push, 6 = survive, 7 = farm, 8 = kda, 9 = damage
	public static float[] abilities(ArrayList<Integer> hero) throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		java.sql.Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e");
		java.sql.Statement stmt = con.createStatement();
		float[] ability = new float[10];
		String s = "";
		ResultSet rs;
		for(int i = 0; i != 5; ++i) {
			String h = Integer.toString(hero.get(i));
			s += "(select * from HERODATA where HERO_ID = "+ h + ")union";
		}
		s = (String) s.subSequence(0, s.length() - 5);
		s = "select avg(push), avg(survive), avg(farm), avg(kda), avg(damage) from(" + s + ")";
		rs = stmt.executeQuery(s);
		rs.next();
		for(int i = 0; i != 5; ++i) {
			ability[i] = rs.getFloat(i + 1);
		}
		
		s = "";
		for(int i = 5; i != 10; ++i) {
			String h = Integer.toString(hero.get(i));
			s += "(select * from HERODATA where HERO_ID = "+ h + ")union";
		}
		s = (String) s.subSequence(0, s.length() - 5);
		s = "select avg(push), avg(survive), avg(farm), avg(kda), avg(damage) from(" + s + ")";
		rs = stmt.executeQuery(s);
		rs.next();
		for(int i = 5; i != 10; ++i) {
			ability[i] = rs.getFloat(i - 4);
		}
		rs.close();
		stmt.close();
		con.close();
		return ability;
	}
	
	public static float predict(ArrayList<Integer> hero, ArrayList<Integer> player, float[] abilities) throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		java.sql.Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e");
		java.sql.Statement stmt = con.createStatement();
		
		float[] pwinrate = new float[10];
		float[][] hwinrate = new float[10][10];
		float[] winrate = new float[10];
		ResultSet rs;
		String hero_info = "";
		
		//get every hero win rate based on team
		for(int i = 0; i != 10; ++i) {
			String p = Integer.toString(player.get(i));
			String h1 = Integer.toString(hero.get(i));
			hero_info += "(select type as t"+ i +", pos as p"+ i + " from HERO where HERO_ID = " + h1 + "),";
			
			//get player win rate of this hero
			String s1 = "select * from " +
						"(select count(*) as total from plays where ACCOUNT_ID = " + p + " and HERO_ID = " + h1 + "), " +
						"(select count(*) as win from" + 
						"(select * from plays where ACCOUNT_ID = " + p + " and HERO_ID = " + h1 + ") a, " + 
						"match b where a.match_ID = b.match_ID and ((PLAYER_SLOT < 10 and RADIANT_WIN = 'True') or (PLAYER_SLOT > 10 and RADIANT_WIN = 'False')))";
			rs = stmt.executeQuery(s1);
			rs.next();
			int t1 = rs.getInt(1);
			int t2 = rs.getInt(2);
			if (t1 == 0) {
				pwinrate[i] = (float) 0.4;
			}
			else {
				pwinrate[i] = (float) t2 / t1;
			}
			
			int j = i + 1;
			if(i < 5) {
				for(; j < 10; ++j) {
					String h2 = Integer.toString(hero.get(j));
					
					//get hero i's win rate when hero i and j is in the same team
					String s2 = "select win, total from PARTERN where (" + h1 + "= H_ID1 and " + h2 + " = H_ID2) or (" + h1 + " = H_ID2 and " + h2 + " = H_ID1)";
					rs = stmt.executeQuery(s2);
					rs.next();
					int w1 = rs.getInt(1);
					int w2 = rs.getInt(2);
					if(w2 == 0) {
						hwinrate[i][j] = hwinrate[j][i] = (float) 0.5;
					}
					else {
						hwinrate[i][j] = hwinrate[j][i] = (float) w1 / w2;
					}
				}
				for(; j < 10; ++j) {
					String h2 = Integer.toString(hero.get(j));
					//get hero i's win rate when hero i and j is in the different team
					String s2 = "(select win, total from COUNTER where (" + h1 + "= H_ID1 and " + h2 + " = H_ID2)) union" +
							    "(select total - win as win, total from COUNTER where (" + h1 + " = H_ID2 and " + h2 + " = H_ID1))";
					rs = stmt.executeQuery(s2);
					rs.next();
					int w1 = rs.getInt(1);
					int w2 = rs.getInt(2);
					if(w2 == 0) {
						hwinrate[i][j] = hwinrate[j][i] = (float) 0.5;
					}
					else {
						hwinrate[i][j] = (float) w1 / w2;
						hwinrate[j][i] = (float)1 - (float) w1 / w2;
					}
				}
			}
			else {
				for(; j < 10; ++j) {
					String h2 = Integer.toString(hero.get(j));
					//get hero i's win rate when hero i and j is in the same team
					String s2 = "select win, total from PARTERN where (" + h1 + "= H_ID1 and " + h2 + " = H_ID2) or (" + h1 + " = H_ID2 and " + h2 + " = H_ID1)";
					rs = stmt.executeQuery(s2);
					rs.next();
					int w1 = rs.getInt(1);
					int w2 = rs.getInt(2);
					if(w2 == 0) {
						hwinrate[i][j] = hwinrate[j][i] = (float) 0.5;
					}
					else {
						hwinrate[i][j] = hwinrate[j][i] = (float) w1 / w2;
					}
				}
			}
		}
		
		//get all hero type and position infomation
		hero_info = hero_info.substring(0, hero_info.length() - 1);
		hero_info = "select * from " + hero_info;
		rs = stmt.executeQuery(hero_info);
		rs.next();
		
		
		//count radiant hero type
		int[] rcountt = new int[3];
		//count radiant hero position
		int[] rcountp = new int[3];
		for(int i = 0; i != 3; ++i) rcountt[i] = 0;
		for(int i = 0; i != 3; ++i) rcountp[i] = 0;
		for(int i = 0; i != 5; ++i) {
			String t = rs.getString(1 + 2 * i);
			int p = rs.getInt(2 + 2 * i);
			rcountp[p]++;
			if(t.equals("S")) rcountt[0]++;
			else if(t.equals("A")) rcountt[1]++;
			else if(t.equals("I")) rcountt[2]++;
		}
		
		//radiant hero type factor
		float rtfact = 1;
		//radiant hero position factor
		float rpfact = 1;
		if(rcountt[0] == 5 || rcountt[1] == 5 || rcountt[2] == 5) rtfact = (float) 0.8;
		else if(rcountt[0] == 4 || rcountt[1] == 4 || rcountt[2] == 4) rtfact = (float) 0.9;
		if(rcountt[0] == 0 || rcountt[1] == 0 || rcountt[2] == 0) rtfact *= (float) 0.9;
		if(rcountp[0] == 5 || rcountp[1] == 5 || rcountp[2] == 5) rpfact = (float) 0.6;
		else if(rcountt[0] == 4 || rcountt[1] == 4 || rcountt[2] == 4) rpfact = (float) 0.8;
		if(rcountt[0] == 0 || rcountt[1] == 0 || rcountt[2] == 0) rpfact *= (float) 0.8;
		
		//count radiant hero type
		int[] dcountt = new int[3];
		//count radiant hero position
		int[] dcountp = new int[3];
		for(int i = 0; i != 3; ++i) dcountt[i] = 0;
		for(int i = 0; i != 3; ++i) dcountp[i] = 0;
		for(int i = 5; i != 10; ++i) {
			String t = rs.getString(1 + 2 * i);
			int p = rs.getInt(2 + 2 * i);
			dcountp[p]++;
			if(t.equals("S")) dcountt[0]++;
			else if(t.equals("A")) dcountt[1]++;
			else if(t.equals("I")) dcountt[2]++;
		}
		//dire hero type factor 
		float dtfact = 1;
		//dire hero position factor 
		float dpfact = 1;
		if(dcountt[0] == 5 || dcountt[1] == 5 || dcountt[2] == 5) dtfact = (float) 0.8;
		else if(dcountt[0] == 4 || dcountt[1] == 4 || dcountt[2] == 4) dtfact = (float) 0.9;
		if(dcountt[0] == 0 || dcountt[1] == 0 || dcountt[2] == 0) dtfact *= (float) 0.9;
		if(dcountp[0] == 5 || dcountp[1] == 5 || dcountp[2] == 5) dpfact = (float) 0.6;
		else if(dcountt[0] == 4 || dcountt[1] == 4 || dcountt[2] == 4) dpfact = (float) 0.8;
		if(dcountt[0] == 0 || dcountt[1] == 0 || dcountt[2] == 0) dpfact *= (float) 0.8;
		
		float[] arate = new float[5];
		float afact = 1;
		for(int i = 0; i != 5; ++i) {
			arate[i] = abilities[i] / abilities[i + 5];
		}
		afact = (float) (0.2 * arate[0] + 0.2 * (float)1 / arate[1] + 0.2 * arate[2] + 0.2 * arate[3] + 0.2 * arate[4]);
		afact = (float) (0.6 + 0.4 * afact);
		
		//calculate every player's estimate win rate and team win rate
		float twin = 0;
		float rwin = 0;
		for(int i = 0; i != 10; ++i) {
			float w = 0;
			for(int j = 0; j != 10; ++j) {
				if(i != j) {
					w += hwinrate[i][j];
				}
			}
			w = w / (float)10.0;
			winrate[i] = (float) 0.7 * w + (float) 0.3 * pwinrate[i];
			winrate[i] *= i < 5 ? rtfact * rpfact : dtfact * dpfact;
			twin += winrate[i];
			if(i < 5) rwin += winrate[i];
		}
		
		if(twin == 0) rwin = (float)0.5;
		else rwin = rwin / twin;
		
		rwin = afact * rwin;
		//radiant win rate
		rs.close();
		stmt.close();
		con.close();
		return rwin;
	}
}
