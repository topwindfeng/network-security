<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*,java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

  <style>
    body {
      padding: 20px;
    }
    .radar-chart .area {
      fill-opacity: 0.7;
    }
    .radar-chart.focus .area {
      fill-opacity: 0.3;
    }
    .radar-chart.focus .area.focused {
      fill-opacity: 0.9;
    }
    .area.germany, .germany .circle {
      fill: #FFD700;
      stroke: none;
    }
    .area.argentina, .argentina .circle {
      fill: #ADD8E6;
      stroke: none;
    }
  </style>
 
  <script type="text/javascript" src="http://d3js.org/d3.v3.js"></script>
  <script type="text/javascript" src="chart/radar-chart.js"></script>
 
<title>Profile page</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<link rel="stylesheet" href="chart/radar-chart.css">

<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl", "shwang", "B7hhp342e"); 
Statement stmt=con.createStatement(); 
ResultSet rs;%>
<script LANGUAGE="JavaScript">
function newest_video()
{
x=document.getElementById("nw_str1");
x.innerHTML="TI5 Day 6 Recap";
x.href="https://www.youtube.com/watch?v=qxXu8oiBrno";
x=document.getElementById("nw_pic1");
x.src="images/lp_newvid1.jpg";

x=document.getElementById("nw_str2");
x.innerHTML="TI5 Day 5 Recap";
x.href="https://www.youtube.com/watch?v=ixWg_FsFOzI";
x=document.getElementById("nw_pic2");
x.src="images/lp_newvid2.jpg";

x=document.getElementById("nw_str3");
x.innerHTML="TI5 Road to the Finals:Evil Geniuses";
x.href="https://www.youtube.com/watch?v=VaibusDtFMc";
x=document.getElementById("nw_pic3");
x.src="images/lp_newvid3.jpg";

x=document.getElementById("nw_str4");
x.innerHTML="TI5 Road to the Finals:CDEC";
x.href="https://www.youtube.com/watch?v=ycYM9hVfcOE";
x=document.getElementById("nw_pic4");
x.src="images/lp_newvid4.jpg";
}


function newest_new()
{
x=document.getElementById("nw_str1");
x.innerHTML="Faceless finish the first day of Kiev Major SEA qualifiers without dropping a single game";
x.href="http://www.gosugamers.net/dota2/news/43603-faceless-finish-the-first-day-of-kiev-major-sea-qualifiers-without-dropping-a-single-game";
x=document.getElementById("nw_pic1");
x.src=("images/lp_newnews1.jpg");

x=document.getElementById("nw_str2");
x.innerHTML="NA and SA Kiev Major open qualifiers ended, QO and Jeyo to play in regionals";
x.href="http://www.gosugamers.net/dota2/news/43597-na-and-sa-kiev-major-open-qualifiers-ended-qo-and-jeyo-to-play-in-regionals";
x=document.getElementById("nw_pic2");
x.src="images/lp_newnews2.jpg";

x=document.getElementById("nw_str3");
x.innerHTML="SingSing's pub stack 4beanboys made into the Kiev Major EU Regionals";
x.href="http://www.gosugamers.net/dota2/news/43595-singsing-s-pub-stack-4beanboys-made-into-the-kiev-major-eu-regionals";
x=document.getElementById("nw_pic3");
x.src="images/lp_newnews3.jpg";

x=document.getElementById("nw_str4");
x.innerHTML="Iceberg's brother and his team H1ve advance into the Kiev Major CIS regional qualifiers";
x.href="http://www.gosugamers.net/dota2/news/43592-iceberg-s-brother-and-his-team-h1ve-advance-into-the-kiev-major-cis-regional-qualifiers";
x=document.getElementById("nw_pic4");
x.src="images/lp_newnews4.jpg";
}
<%
String name = request.getParameter("name");
String profile = request.getParameter("profile");
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
				window.location.href = xmlhttp.responseText + "&name=<%=name%>";
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

function loadHistory(){
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/History?name=<%=profile%>",true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var arr=new Array();
			var table = document.getElementById("history");
		    arr=xmlhttp.responseText.split(",");
		    var rownum = 1;
		    for (var i=0;i<arr.length;i=i+5){
		    	var row = table.insertRow(rownum++);
		    	var cell1 = row.insertCell(0);
		        var cell2 = row.insertCell(1);
		        var cell3 = row.insertCell(2);
		        var cell4 = row.insertCell(3);
		        var cell5 = row.insertCell(4);
		        cell2.innerHTML = arr[i];
		        cell1.innerHTML = "<img src = 'hero/"+ arr[i+1] + "/" + arr[i] +".png' width = '92' height = '46' alt = ''/ >";
		        cell3.innerHTML = arr[i+2];
		        cell4.innerHTML = arr[i+3];
		        cell5.innerHTML = parseInt(arr[i+4]/60) +"m" + arr[i+4]%60 +"s";
		    }
		    table.deleteRow(rownum-1);
		}
	}
}

function showRadar(id){
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/chart?name=<%=profile%>",true);
	xmlhttp.send(null);
    
	var push="";
    var survive="";
    var farm="";
    var kda="";
    var dmg=""
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var arr=new Array();
		    arr=xmlhttp.responseText.split(",");
			push=arr[0];
			survive=arr[1];
			farm=arr[2];
			kda=arr[3];
			dmg=arr[4];
			
			
		    var data = [];
		    var chart = RadarChart.chart();
		//  c is the input string. w is the width of the graph. h is the height of the graph						    
		//  var c = document.getElementById("data").value,

		    var c = "name,push,survive,farm,kda,dmage\nMyProfile,"+push+","+survive+","+farm+","+kda+","+dmg+"\nBackGround,97266,97266,97266,97266,97266",		//Input here				  
		      w = "600",
		      h = "600",
		  csv = c.split("\n").map(function(i){return i.split(",")})
		  headers = []
		  csv.forEach(function(item, i){
		    if(i==0){
		      headers = item;
		    }else{
		      newSeries = {};
		      item.forEach( function(v, j){
		        if(j==0){
		          newSeries.className = v;
		          newSeries.axes = [];
		        }else{
		          newSeries.axes.push({"axis":[headers[j]], "value": parseFloat(v)});
		        }
		      });
		      data.push(newSeries);
		    }
		  })
		RadarChart.defaultConfig.radius = 3;
		RadarChart.defaultConfig.w = w;
		RadarChart.defaultConfig.h = h;
		RadarChart.draw("#chart-container", data);
		function animate(elem,time) {
		    if( !elem) return;
		    var to = elem.offsetTop;
		    var from = window.scrollY;
		    var start = new Date().getTime(),
		        timer = setInterval(function() {
		            var step = Math.min(1,(new Date().getTime()-start)/time);
		            window.scrollTo(0,(from+step*(to-from))+1);
		            if( step == 1){ clearInterval(timer);};
		        },25);
		        window.scrollTo(0,(from+1));
		    }

		var divVal = document.getElementById('chart-container');
		animate(divVal,600);
			
			
			
			
		}
	}
	
	
	
	


		
}
</script>




</head>
<body onload="showRadar('chart-container');loadHistory()">
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
					<a href="predict2.jsp?name=<%=name%>">Prediction</a>
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
				
					

                    <div>
					<span id= "home" class="lp_newvidit2">Profile</span>
					<br /><br /><br /><br /><br />
					</div>
					
					
					
					<div>
					<span class="lp_newvidit">Player ID:</span>
					<br />
					<span class="cp_featview">
					<%	
                    rs=stmt.executeQuery("select ACCOUNT_ID from USERS where USER_NAME='"+ profile +"'");
	                while (rs.next())
	                {
                    out.print(rs.getInt(1));
	                }%>
	                <br /></span>
					<br /><br />
					</div>
				
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Name:</span>
					<br />
					<span class="cp_featview"><%=profile%><br /></span>
					<br /><br />
					</div>
					
					<div name="leggings" id="chart-container" style="background:#ffffff;" ></div>

						<table id="history" border = "1" width = "100%" style = "color:#ffffff">
						    <tr >
						        <td height = "50px">HERO</td>
						        <td>HERO NAME</td>
						        <td>KDA</td>
						        <td>DAMAGE</td>
						        <td>DURATION</td>
						    </tr>
						   
						   
						</table>

										
					
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
					<a href="<%rs=stmt.executeQuery("Select URL from (Select rownum rn, URL, VIDEO_NAME from (select URL,VIDEO_NAME from VIDEO order by VI desc)) where rn = 3");
	while (rs.next())
	{
       out.print(rs.getString("URL"));
	}%>" 
	class="rp_catxt" id="v3" onclick="update_views('v3')"><%	
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


