<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*,java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
 
<title>Prediction page</title>
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


function predict()
{
	var pname1 = document.getElementById("pname1").value;
	var hname1 = document.getElementById("hname1").value;
	var pname2 = document.getElementById("pname2").value;
	var hname2 = document.getElementById("hname2").value;
	var pname3 = document.getElementById("pname3").value;
	var hname3 = document.getElementById("hname3").value;
	var pname4 = document.getElementById("pname4").value;
	var hname4 = document.getElementById("hname4").value;
	var pname5 = document.getElementById("pname5").value;
	var hname5 = document.getElementById("hname5").value;
	var pname6 = document.getElementById("pname6").value;
	var hname6 = document.getElementById("hname6").value;
	var pname7 = document.getElementById("pname7").value;
	var hname7 = document.getElementById("hname7").value;
	var pname8 = document.getElementById("pname8").value;
	var hname8 = document.getElementById("hname8").value;
	var pname9 = document.getElementById("pname9").value;
	var hname9 = document.getElementById("hname9").value;
	var pname10 = document.getElementById("pname10").value;
	var hname10 = document.getElementById("hname10").value;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/Predict?panme1="+pname1+"&pname2="+pname2+"&pname3="+pname3+"&pname4="+pname4+"&pname5="+pname5+"&pname6="+pname6+"&pname7="+pname7+"&pname8="+pname8+"&pname9="+pname9+"&pname10="+pname10+"&hname1="+hname1+"&hname2="+hname2+"&hname3="+hname3+"&hname4="+hname4+"&hname5="+hname5+"&hname6="+hname6+"&hname7="+hname7+"&hname8="+hname8+"&hname9="+hname9+"&hname10="+hname10,true);
	xmlhttp.send(null);
	
	var push="";
    var survive="";
    var farm="";
    var kda="";
    var dmg="";
	var push2="";
    var survive2="";
    var farm2="";
    var kda2=""; 
    var dmg2="";
    var winrate="";
    var winrate2="";
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var arr=new Array();
		    arr=xmlhttp.responseText.split(",");
			push=(arr[0]-194)*7;
			survive=(11-arr[1])*3254;
			farm=(arr[2]-287)*46;
			kda=(arr[3]-1)*3254;
			dmg=arr[4]-4270;
			
			push2=(arr[5]-194)*7;
			survive2=(11-arr[6])*3254;
			farm2=(arr[7]-287)*46;
			kda2=(arr[8]-1)*3254;
			dmg2=arr[9]-4270;
			winrate=arr[10];
			winrate2=arr[11];
			
			
			document.getElementById('wrate1').innerHTML="Winning Possiblity:   "+winrate;
			document.getElementById('winrate2').innerHTML="Winning Possiblity:   "+winrate2;
			
		    var data = [];
		    var chart = RadarChart.chart();
		//  c is the input string. w is the width of the graph. h is the height of the graph						    
		//  var c = document.getElementById("data").value,

		    var c = "name,push,survive,farm,kda,dmage\nRadiant,"+push+","+survive+","+farm+","+kda+","+dmg+"\nBackGround,19524,19524,19524,19524,19524"+"\nDire,"+push2+","+survive2+","+farm2+","+kda2+","+dmg2,		//Input here	//min 194 5 287	1 4270	  
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
			        <div>
					<span id= "home" class="lp_newvidit2">Pediction</span>
					<br /><br /><br /><br /><br />
					</div>
				
				
				
				   	<div class="lp_featpad">
						<div class="lp_featnav">
							<a >Radiant</a>
						
						</div>
						
								
						<span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname1" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname1" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname2" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname2" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname3" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname3" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname4" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname4" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname5" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname5" type="text" class="rp_pwdrip" />			
					    </span>
					    
					     <span class="cp_featpara">
								<span id="wrate1" class="lp_newdixt">Winning Possibility:</span>							       		
					    </span>
					    
					    
					</div>
				
					<div class="lp_featpad">
						<div class="lp_featnav">
							<a >Dire</a>
						
						</div>
						
								
						<span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname6" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname6" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname7" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname7" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname8" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname8" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname9" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname9" type="text" class="rp_pwdrip" />			
					    </span>
					    <span class="cp_featpara">
								<span class="rp_membrusr">Player Name:</span>
						        <input id = "pname10" name="#" type="text" class="rp_usrip" />
							
					        	<span class="rp_membrpwd">Hero Name:</span>
						        <input name="#" id = "hname10" type="text" class="rp_pwdrip" />			
					    </span>
					    
					    <span class="cp_featpara">
								<span id="winrate2" class="lp_newdixt">Winning Possibility:</span>							       		
					    </span>
					</div>
					
					<br /><br /><br/><br/><br/><br/>
					<div align="center" ><a href="#" onclick="predict()"><img src="images/predict.jpg" width="100" height="100" alt=""  /></a></div>

                    
                    
                    
                    
					<div  id="chart-container" style="background:#ffffff;" ></div>
					
			</div>
				
				
				<!-- <div id="lp_padd">	
                 <div class="lp_featnav">
							<a href="#video">Dire</a>
						
						</div>
				</div> -->
					
				
				
				
				
				
					&nsbp;
					<br /><br /><br/><br/><br/><br/>
				
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


