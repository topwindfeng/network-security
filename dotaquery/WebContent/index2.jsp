<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home page</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
Statement stmt=con.createStatement(); 
ResultSet rs;%>
<script LANGUAGE="JavaScript">
function newest_video()
{
x=document.getElementById("nw_str1");
x.onclick=function(){update_views('nw_str1')};
x.innerHTML="TI5 Day 6 Recap";
x.href="https://www.youtube.com/watch?v=qxXu8oiBrno";
x=document.getElementById("nw_pic1");
x.src="images/lp_newvid1.jpg";

x=document.getElementById("nw_str2");
x.onclick=function(){update_views('nw_str2')};
x.innerHTML="TI5 Day 5 Recap";
x.href="https://www.youtube.com/watch?v=ixWg_FsFOzI";
x=document.getElementById("nw_pic2");
x.src="images/lp_newvid2.jpg";

x=document.getElementById("nw_str3");
x.onclick=function(){update_views('nw_str3')};
x.innerHTML="TI5 Road to the Finals:Evil Geniuses";
x.href="https://www.youtube.com/watch?v=VaibusDtFMc";
x=document.getElementById("nw_pic3");
x.src="images/lp_newvid3.jpg";

x=document.getElementById("nw_str4");
x.onclick=function(){update_views('nw_str4')};
x.innerHTML="TI5 Road to the Finals:CDEC";
x.href="https://www.youtube.com/watch?v=ycYM9hVfcOE";
x=document.getElementById("nw_pic4");
x.src="images/lp_newvid4.jpg";
}


function newest_new()
{
x=document.getElementById("nw_str1");
x.onclick=function(){update_nviews('nw_str1')};
x.innerHTML="Faceless finish the first day of Kiev Major SEA qualifiers without dropping a single game";
x.href="http://www.gosugamers.net/dota2/news/43603-faceless-finish-the-first-day-of-kiev-major-sea-qualifiers-without-dropping-a-single-game";
x=document.getElementById("nw_pic1");
x.src=("images/lp_newnews1.jpg");

x=document.getElementById("nw_str2");
x.onclick=function(){update_nviews('nw_str2')};
x.innerHTML="NA and SA Kiev Major open qualifiers ended, QO and Jeyo to play in regionals";
x.href="http://www.gosugamers.net/dota2/news/43597-na-and-sa-kiev-major-open-qualifiers-ended-qo-and-jeyo-to-play-in-regionals";
x=document.getElementById("nw_pic2");
x.src="images/lp_newnews2.jpg";

x=document.getElementById("nw_str3");
x.onclick=function(){update_nviews('nw_str3')};
x.innerHTML="SingSing's pub stack 4beanboys made into the Kiev Major EU Regionals";
x.href="http://www.gosugamers.net/dota2/news/43595-singsing-s-pub-stack-4beanboys-made-into-the-kiev-major-eu-regionals";
x=document.getElementById("nw_pic3");
x.src="images/lp_newnews3.jpg";

x=document.getElementById("nw_str4");
x.onclick=function(){update_nviews('nw_str4')};
x.innerHTML="Iceberg brother and his team H1ve advance into the Kiev Major CIS regional qualifiers";
x.href="http://www.gosugamers.net/dota2/news/43592-iceberg-s-brother-and-his-team-h1ve-advance-into-the-kiev-major-cis-regional-qualifiers";
x=document.getElementById("nw_pic4");
x.src="images/lp_newnews4.jpg";
}

<%
String name = request.getParameter("name");
	
%>


function search_user()
{
	
	var select = document.getElementById("select").value;
	var search = document.getElementById("search").value;
	var xmlhttp = new XMLHttpRequest();
	if (select == 1){
		xmlhttp.open("GET", "http://localhost:8080/dotaquery/Search?select=playerid&value="+search,true);
	}else {
		xmlhttp.open("GET", "http://localhost:8080/dotaquery/Search?select=name&value="+search,true);
	}
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			if(xmlhttp.responseText == 0){
				alert("user not found");
			}else {
				window.location.href = xmlhttp.responseText +"&name=<%=name%>";
			}
		}
	}
}

function update_views(id)
{
	var s=document.getElementById(id).innerHTML;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/Clickcount?str="+s,true);
	xmlhttp.send(null);
}

function update_nviews(id)
{
	var s=document.getElementById(id).innerHTML;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/nClickcount?str="+s,true);
	xmlhttp.send(null);
}

</script>


</head>
<body>
  <div id="main_block">
  	 <div id="innerblock">
                 
								
					 <!--Top Panel starts here -->
   
			<div id="top_panel">
			
				
					<a href="index.jsp" class="logo"><img src="images/logo.png" width="128" height="36" alt="" /></a><br />
				
				<div class="tp_navbg">
					<a href="index2.jsp?name=<%=name%>">Home</a>
					<a href="hero2.jsp?name=<%=name%>">Heroes</a>
					<a href="item2.jsp?name=<%=name%>">Items</a>
					<a href="user.jsp?name=<%=name%>&profile=<%=name%>">MyProfile</a>
					<a href="user.jsp?name=<%=name%>&profile=<%=name%>">Prediction</a>
				</div>
				
				<div class="tp_smlgrnbg">
					<span class="tp_sign"><a href="index.jsp" class="tp_txt">Log Out</a>
				</div>
				
                <div class="tp_barbg">
					<input name="#" id = "search" type="text" class="tp_barip" />
					<select name="#" class="tp_drp" id = "select"><option value="1">PlayerID</option><option value="2">Name</option></select>
					<a href="#" class="tp_search" onclick="search_user()"><img src="images/tp_search.jpg" width="52" height="24" alt="" /></a>
					<span class="tp_welcum" ><%=name%></b></br></span>
				
				</div>
				
			</div>
	  
	                   <!--Top Panel ends here -->
					   
					   
					    <!--content Panel starts here -->
						
			<div id="contentpanel">
			
				<div id="lp_padd">
				
					<!--<div class="lp_shadebg">
					
						<span class="cp_smlpad">	
							<img src="images/lp_watch.jpg" width="81" height="81" alt="" class="lp_watch" />
							
							<img src="images/cp_watchit.jpg" width="93" height="15" alt="" class="cp_watchit"/>
							<span class="cp_watcxt">Mauris convallis arcu sit amet leo.</span>
							<a href="#" class="lp_watmore"><img src="images/lp_watmore.jpg" width="35" height="28" alt="" /></a>
						
						</span>
						
						<span class="cp_smlpad">	
							<img src="images/lp_uplad.jpg" width="81" height="81" alt="" class="lp_uplad" />
							
							<img src="images/cp_watchit1.jpg" width="106" height="16" alt="" class="cp_watchit" />
							<span class="cp_watcxt">Mauris convallis arcu sit amet leo.</span>
							<a href="#" class="lp_watmore"><img src="images/lp_watmore.jpg" width="35" height="28" alt="" /></a>
						
						</span>
						
						<span class="cp_smlpad">	
							<img src="images/lp_share.jpg" width="81" height="81" alt="" class="lp_uplad"/>
							
							<img src="images/cp_watchit2.jpg" width="93" height="16" alt="" class="cp_watchit" />
							<span class="cp_watcxt">Mauris convallis arcu sit amet leo.</span>
							<a href="#" class="lp_watmore"><img src="images/lp_watmore.jpg" width="35" height="28" alt="" /></a>
						
						</span>
					
					</div>-->

                    <div>
					<span id= "home" class="lp_newvidit2">Home</span>
					<br /><br /><br /><br /><br />
					</div>
					
					<div>
					<span class="lp_newvidit">Newest</span>
					<br /><br /><br />
					</div>
					
					<div class="lp_newvidpad">
						<div class="lp_featnav">
							<a  href="#home" onclick="newest_video()">Videos</a>
							<a  href="#home" onclick="newest_new()">News</a>
						
						</div>
						<img src="images/lp_newline.jpg" width="661" height="2" alt="" class="lp_newline" />
					
						<a href="#"><img src="images/lp_arro.jpg" width="13" height="20" alt="" class="lp_arro" />	</a>
						
						<span class="lp_vidpara">
							<img id="nw_pic1" src="images/lp_newvid1.jpg" width="134" height="83" alt="" class="lp_newvid1" />
						
							<img src="images/lp_newvidarro.jpg" width="4" height="6" alt="" class="lp_newvidarro" />
							<span class="lp_newdixt"><a id="nw_str1" href="https://www.youtube.com/watch?v=qxXu8oiBrno" style="color:#BEBEBE;" onclick="update_views('nw_str1')">TI5 Day 6 Recap</a></span>
						</span>
						
						<span class="lp_vidpara">
							<img id="nw_pic2" src="images/lp_newvid2.jpg" width="134" height="83" alt="" class="lp_newvid1" />
						
							<img src="images/lp_newvidarro.jpg" width="4" height="6" alt="" class="lp_newvidarro" />
							<span class="lp_newdixt"><a id="nw_str2" href="https://www.youtube.com/watch?v=ixWg_FsFOzI" style="color:#BEBEBE;" onclick="update_views('nw_str2')">TI5 Day 5 Recap</a></span>
						</span>
						
						<span class="lp_vidpara">
							<img id="nw_pic3" src="images/lp_newvid3.jpg" width="134" height="83" alt="" class="lp_newvid1" />
						
							<img src="images/lp_newvidarro.jpg" width="4" height="6" alt="" class="lp_newvidarro" />
							<span class="lp_newdixt"><a id="nw_str3"href="https://www.youtube.com/watch?v=VaibusDtFMc" style="color:#BEBEBE;" onclick="update_views('nw_str3')">TI5 Road to the Finals:Evil Geniuses</a></span>
						</span>
						
						<span class="lp_vidpara">
							<img id="nw_pic4" src="images/lp_newvid4.jpg" width="134" height="83" alt="" class="lp_newvid1" />
						
							<img src="images/lp_newvidarro.jpg" width="4" height="6" alt="" class="lp_newvidarro" />
							<span class="lp_newdixt"><a id="nw_str4" href="https://www.youtube.com/watch?v=ycYM9hVfcOE" style="color:#BEBEBE;" onclick="update_views('nw_str4')">TI5 Road to the Finals:CDEC</a></span>
						</span>
						
						<a href="#"><img src="images/lp_arro1.jpg" width="13" height="20" alt="" class="lp_arro" />	</a>
					</div>
					
					&nsbp;
					<div>
					<br /><br />
					<span id="video" class="lp_newvidit">Videos</span>
					<br /><br />
					</div>
					
					<div class="lp_featpad">
						<div class="lp_featnav">
							<a href="#video">Recently</a>
						
						</div>
						
						<img src="images/lp_newvid1.jpg" width="152" height="92" alt="" class="lp_featimg1"/>
								
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b><a id="vid1" href="https://www.youtube.com/watch?v=qxXu8oiBrno" style="color:#BEBEBE;" onclick="update_views('vid1')">TI5 Day 6 Recap</a></b><Br /></span>
									
									<span class="cp_featxt">TI5 <br/>Grand Finals, Game 1 <br/>The International<br/> English Commentary</span><br />
									</span>
									<span class="cp_featview">Views : 
									<%	
     rs=stmt.executeQuery("select VI from VIDEO where VIDEO_NAME='TI5 Day 6 Recap'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%>
									<br /></span>
									
						</span>
						
							<img src="images/lp_featline.jpg" width="634" height="1" alt="" class="lp_featline" />
					
						<img src="images/lp_newvid2.jpg" width="152" height="92" alt="" class="lp_featimg1" />
					
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b><a  id="vid2" href="https://www.youtube.com/watch?v=ixWg_FsFOzI" style="color:#BEBEBE;" onclick="update_views('vid2')">TI5 Day 5 Recap</a> </b><Br /></span>
									
									<span class="cp_featxt">TI5 <br/>Semi Finals<br/>The International<br/> English Commentary</span><br />
									</span>
									<span class="cp_featview">Views : 
									<%	
    rs=stmt.executeQuery("select VI from VIDEO where VIDEO_NAME='TI5 Day 5 Recap'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%><br /></span>
						</span>
						
							<img src="images/lp_featline.jpg" width="634" height="1" alt="" class="lp_featline" />
							
							<img src="images/lp_newvid3.jpg" width="152" height="92" alt="" class="lp_featimg1" />
							
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b> <a id="vid3" href="https://www.youtube.com/watch?v=ycYM9hVfcOE" style="color:#BEBEBE;" onclick="update_views('vid3')">TI5 Road to the Finals:Evil Geniuses</a> </b><Br /></span>
									
									<span class="cp_featxt">TI5 <br/>CDEC Gaming vs. Evil Geniuses<br/>The International<br/> English Commentary</span><br />
									</span>
									<span class="cp_featview">Views : 
									<%	
    rs=stmt.executeQuery("select VI from VIDEO where VIDEO_NAME='TI5 Road to the Finals:Evil Geniuses'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%><br /></span>
						</span>
					
					</div>
					
					&nsbp;
					<div>
					<br /><br />
					<span id="news" class="lp_newvidit">News</span>
					<br /><br />
					</div>
					
					<div class="lp_featpad">
						<div class="lp_featnav">
							<a href="#news">Recently</a>
						
						</div>
						
						<img src="images/lp_newnews1.jpg" width="152" height="92" alt="" class="lp_featimg1"/>
								
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b><a id="nid1" href="http://www.gosugamers.net/dota2/news/43603-faceless-finish-the-first-day-of-kiev-major-sea-qualifiers-without-dropping-a-single-game" style="color:#BEBEBE;" onclick="update_nviews('nid1')">Faceless finish the first day of Kiev Major SEA qualifiers without dropping a single game</a> </b><Br /></span>
									
									<span class="cp_featxt">The Kiev Major regional qualifiers kicked off today and will last up until the 14th of March. The Southeast Asian region was the first to open the group stage battle.</span><br />
									</span>
									<span class="cp_featview">Views : <%	
    rs=stmt.executeQuery("select VI from News where NEWS_NAME='Faceless finish the first day of Kiev Major SEA qualifiers without dropping a single game'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%><br /></span>
									
						</span>
						
							<img src="images/lp_featline.jpg" width="634" height="1" alt="" class="lp_featline" />
					
						<img src="images/lp_newnews2.jpg" width="152" height="92" alt="" class="lp_featimg1" />
					
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b><a id="nid2" href="http://www.gosugamers.net/dota2/news/43597-na-and-sa-kiev-major-open-qualifiers-ended-qo-and-jeyo-to-play-in-regionals" style="color:#BEBEBE;" onclick="update_nviews('nid2')">NA and SA Kiev Major open qualifiers ended, QO and Jeyo to play in regionals </a></b><Br /></span>
									
									<span class="cp_featxt">The last two teams from the North American open qualifiers and the last four from South America bracket have been decided. Infamous and Not Today have made it in the SA regionals, so did the ex-Wanted players QO and Jeyo.</span><br />
									</span>
									<span class="cp_featview">Views : <%	
    rs=stmt.executeQuery("select VI from News where NEWS_NAME='NA and SA Kiev Major open qualifiers ended, QO and Jeyo to play in regionals'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%>
									<br /></span>
						</span>
						
							<img src="images/lp_featline.jpg" width="634" height="1" alt="" class="lp_featline" />
							
							<img src="images/lp_newnews4.jpg" width="152" height="92" alt="" class="lp_featimg1" />
							
						<span class="cp_featpara">
									<span style="float:left; width:250px; display:inline;"><span class="cp_featname"><b><a id="nid3" href="http://www.gosugamers.net/dota2/news/43592-iceberg-s-brother-and-his-team-h1ve-advance-into-the-kiev-major-cis-regional-qualifiers" style="color:#BEBEBE;" onclick="update_nviews('nid3')" >Iceberg brother and his team H1ve advance into the Kiev Major CIS regional qualifiers</a></b><Br /></span>
									
									<span class="cp_featxt">The CIS regional qualifiers are set to begin and there's a brother vs brother rivalry  on the menu as the two Vasylenko mid players are bound to fight each other for a spot in the Kiev Major main event.</span><br />
									</span>
									<span class="cp_featview">Views : <%	
    rs=stmt.executeQuery("select VI from News where NEWS_NAME='Iceberg brother and his team H1ve advance into the Kiev Major CIS regional qualifiers'");
	while (rs.next())
	{
       out.print(rs.getString("VI"));
	}
%>
					<br /></span>
						</span>
					
					</div>
					
					
				
				</div>
				
				
				
				
					&nsbp;
					<br /><br /><br/><br/><br/><br/><br/><br/>
				
				<div id="rp_padd">
				
					
					
					
					
					
					<img src="images/rp_top.jpg" width="282" height="10" alt="" class="rp_upbgtop"  />
					<div class="rp_loginpad" style="padding-bottom:0px; border-bottom:none;">
						<span class="rp_titxt">HOT VIDEO</span>
					</div>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 1");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v1" onclick="update_views('v1')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 1");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 2");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v2" onclick="update_views('v2')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 2");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 3");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v3" onclick="update_views('v3')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 3");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 4");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v4" onclick="update_views('v4')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 4");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 5");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v5" onclick="update_views('v5')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 5");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 6");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v6" onclick="update_views('v6')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 6");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 7");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v7" onclick="update_views('v7')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 7");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 8");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v8" onclick="update_views('v8')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 8");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 9");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v9" onclick="update_views('v9')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 9");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 10");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v10" onclick="update_views('v10')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 10");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 11");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v11" onclick="update_views('v11')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 11");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 12");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v12" onclick="update_views('v12')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 12");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 13");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="v13" onclick="update_views('v13')"><%	
    rs=stmt.executeQuery("Select VIDEO_NAME from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 13");
	while (rs.next())
	{
       out.print(rs.getString("VIDEO_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					
					
					<img src="images/rp_top.jpg" width="282" height="10" alt="" class="rp_upbgtop"  />
					<div class="rp_loginpad" style="padding-bottom:0px; border-bottom:none;">
						<span class="rp_titxt">HOT NEWS</span>
					</div>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 1");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n1" onclick="update_nviews('n1')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 1");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 2");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n2" onclick="update_nviews('n2')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 2");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 3");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n3" onclick="update_nviews('n3')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 3");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 4");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n4" onclick="update_nviews('n4')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 4");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 5");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n5" onclick="update_nviews('n5')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 5");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 6");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n6" onclick="update_nviews('n6')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 6");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 7");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n7" onclick="update_nviews('n7')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 7");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 8");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n8" onclick="update_nviews('n8')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 8");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 9");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n9" onclick="update_nviews('n9')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 9");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 10");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n10" onclick="update_nviews('n10')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 10");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 11");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n11" onclick="update_nviews('n11')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 11");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 12");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n12" onclick="update_nviews('n12')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 12");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="<%	
    rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 13");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}
%>" class="rp_catxt" id="n13" onclick="update_nviews('n13')"><%	
    rs=stmt.executeQuery("Select NEWS_NAME from (Select rownum rn, URL, NEWS_NAME from (select URL,NEWS_NAME from NEWS order by VI desc)) where rn = 13");
	while (rs.next())
	{
       out.print(rs.getString("NEWS_NAME"));
	}
%></a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					
					
					
					
					
					
				
				
					
				
				
				</div>
				
			</div>	
		 	 		 
					<!--content Panel ends here -->
					
					 <!--footer panel starts here -->
		
		   	
	<div id="ft_padd">
			
			
			
				<span class="ft_cpy">&copy;copyrights @ cop5725 DBMS All Rights Reserved.<br /><font color="#F88F05">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Powered by </font>University of Florida</span>
			
			
			</div>	<br />   
 	 
	                     <!--footer panel ends here -->
    </div> 
	 
	      <!--innerblock ends here -->
	 
</div>
	
	      <!--mainblock ends here -->

			
</body>
</html>
<%	rs.close();
	stmt.close();
	con.close();%>


