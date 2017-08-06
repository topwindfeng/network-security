<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Hero page</title>
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

function heroclick(name)
{
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET","http://localhost:8080/dotaquery/Herodata?name="+name,true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			document.getElementById("main_block").innerHTML = xmlhttp.responseText;
		}
	}
}

function login()
{
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "http://localhost:8080/dotaquery/Login?name="+name+"&password="+password,true);
	xmlhttp.send(null);
	
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			if(xmlhttp.responseText == 0){
				alert("wrong password");
			}else {
				window.location.href = xmlhttp.responseText;
			}
		}
	}
}


function signup()
{
	window.open("http://localhost:8080/dotaquery/signup.jsp","_blank","top=10,left=100,width=1000,height=800,menubar=no,scrollbars=no,toolbar=no,status=yes");
	
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
					<a href="index.jsp">Home</a>
					<a href="hero.jsp">Heroes</a>
					<a href="item.jsp">Items</a>
				</div>
				
				<div class="tp_smlgrnbg">
					<span class="tp_sign"><a href="#" class="tp_txt" onclick="signup()">Sign Up</a>
					<span class="tp_divi">|</span>
					<a href="#memlogin" class="tp_txt">Login</a>

				</div>
				
				<div class="tp_barbg">
				
				</div>
				
			</div>
	  
	                   <!--Top Panel ends here -->
					   
					   
					    <!--content Panel starts here -->
						
			<div id="contentpanel">
			
				<div id="lp_padd">

                    <div>
					<span id= "home" class="lp_newvidit2">Heroes</span>
					<br /><br /><br /><br /><br />
					</div>
					
					
					<div>
					<span class="lp_newvidit">Strength</span>
					<br /><br /><br />
					</div>
					<div class="Strength_icon">
						<abbr title = 'Abaddon'><img src = 'hero/strength/Abaddon.png' onclick ="heroclick('Abaddon')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Alchemist'><img src = 'hero/strength/Alchemist.png' onclick ="heroclick('Alchemist')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Axe'><img src = 'hero/strength/Axe.png' onclick ="heroclick('Axe')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Beastmaster'><img src = 'hero/strength/Beastmaster.png' onclick ="heroclick('Beastmaster')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Brewmaster'><img src = 'hero/strength/Brewmaster.png' onclick ="heroclick('Brewmaster')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Bristleback'><img src = 'hero/strength/Bristleback.png' onclick ="heroclick('Bristleback')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Centaur Warrunner'><img src = 'hero/strength/Centaur Warrunner.png' onclick ="heroclick('Centaur Warrunner')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Chaos Knight'><img src = 'hero/strength/Chaos_Knight.png' onclick ="heroclick('Chaos Knight')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Clockwerk'><img src = 'hero/strength/Clockwerk.png' onclick ="heroclick('Clockwerk')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Doom'><img src = 'hero/strength/Doom.png' onclick ="heroclick('Doom')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Dragon Knight'><img src = 'hero/strength/Dragon Knight.png' onclick ="heroclick('Dragon Knight')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Earth Spirit'><img src = 'hero/strength/Earth Spirit.png' onclick ="heroclick('Earth Spirit')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Earthshaker'><img src = 'hero/strength/Earthshaker.png' onclick ="heroclick('Earthshaker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Elder Titan'><img src = 'hero/strength/Elder Titan.png' onclick ="heroclick('Elder Titan')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Huskar'><img src = 'hero/strength/Huskar.png' onclick ="heroclick('Huskar')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Io'><img src = 'hero/strength/Io.png' onclick ="heroclick('Io')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Kunkka'><img src = 'hero/strength/Kunkka.png' onclick ="heroclick('Kunkka')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Legion Commander'><img src = 'hero/strength/Legion Commander.png' onclick ="heroclick('Legion Commander')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lifestealer'><img src = 'hero/strength/Lifestealer.png' onclick ="heroclick('Lifestealer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lycan'><img src = 'hero/strength/Lycan.png' onclick ="heroclick('Lycan')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Magnus'><img src = 'hero/strength/Magnus.png' onclick ="heroclick('Magnus')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Night Stalker'><img src = 'hero/strength/Night Stalker.png' onclick ="heroclick('Night Stalker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Omniknight'><img src = 'hero/strength/Omniknight.png' onclick ="heroclick('Omniknight')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Phoenix'><img src = 'hero/strength/Phoenix.png' onclick ="heroclick('Phoenix')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Pudge'><img src = 'hero/strength/Pudge.png' onclick ="heroclick('Pudge')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Sand King'><img src = 'hero/strength/Sand King.png' onclick ="heroclick('Sand King')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Slardar'><img src = 'hero/strength/Slardar.png' onclick ="heroclick('Slardar')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Spirit Breaker'><img src = 'hero/strength/Spirit Breaker.png' onclick ="heroclick('Spirit Breaker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Sven'><img src = 'hero/strength/Sven.png' onclick ="heroclick('Sven')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Tidehunter'><img src = 'hero/strength/Tidehunter.png' onclick ="heroclick('Tidehunter')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Timbersaw'><img src = 'hero/strength/Timbersaw.png' onclick ="heroclick('Timbersaw')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Tiny'><img src = 'hero/strength/Tiny.png' onclick ="heroclick('Tiny')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Treant Protector'><img src = 'hero/strength/Treant Protector.png' onclick ="heroclick('Treant Protector')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Tusk'><img src = 'hero/strength/Tusk.png' onclick ="heroclick('Tusk')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Underlord'><img src = 'hero/strength/Underlord.png' onclick ="heroclick('Underlord')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Undying'><img src = 'hero/strength/Undying.png' onclick ="heroclick('Undying')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Wraith King'><img src = 'hero/strength/Wraith King.png' onclick ="heroclick('Wraith King')" width = '92' height = '46' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Agility</span>
					<br /><br /><br />
					</div>
					<div class="agility_icon">
						<abbr title = 'Anti Mage'><img src = 'hero/agility/Anti Mage.png' onclick ="heroclick('Anti Mage')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Arc Warden'><img src = 'hero/agility/Arc Warden.png' onclick ="heroclick('Arc Warden')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Bloodseeker'><img src = 'hero/agility/Bloodseeker.png' onclick ="heroclick('Bloodseeker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Bounty Hunter'><img src = 'hero/agility/Bounty Hunter.png' onclick ="heroclick('Bounty Hunter')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Broodmother'><img src = 'hero/agility/Broodmother.png' onclick ="heroclick('Broodmother')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Clinkz'><img src = 'hero/agility/Clinkz.png' onclick ="heroclick('Clinkz')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Drow Ranger'><img src = 'hero/agility/Drow_Ranger.png' onclick ="heroclick('Drow Ranger')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Ember Spirit'><img src = 'hero/agility/Ember_Spirit.png' onclick ="heroclick('Ember Spirit')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Faceless Void'><img src = 'hero/agility/Faceless Void.png' onclick ="heroclick('Faceless Void')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Gyrocopter'><img src = 'hero/agility/Gyrocopter.png' onclick ="heroclick('Gyrocopter')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Juggernaut'><img src = 'hero/agility/Juggernaut.png' onclick ="heroclick('Juggernaut')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lone Druid'><img src = 'hero/agility/Lone Druid.png' onclick ="heroclick('Lone Druid')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Luna'><img src = 'hero/agility/Luna.png' onclick ="heroclick('Luna')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Medusa'><img src = 'hero/agility/Medusa.png' onclick ="heroclick('Medusa')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Meepo'><img src = 'hero/agility/Meepo.png' onclick ="heroclick('Meepo')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Mirana'><img src = 'hero/agility/Mirana.png' onclick ="heroclick('Mirana')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Monkey King'><img src = 'hero/agility/Monkey King.png' onclick ="heroclick('Monkey King')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Morphling'><img src = 'hero/agility/Morphling.png' onclick ="heroclick('Morphling')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Naga Siren'><img src = 'hero/agility/Naga Siren.png' onclick ="heroclick('Naga Siren')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Nyx Assassin'><img src = 'hero/agility/Nyx Assassin.png' onclick ="heroclick('Nyx Assassin')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Phantom Assassin'><img src = 'hero/agility/Phantom Assassin.png' onclick ="heroclick('Phantom Assassin')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Phantom Lancer'><img src = 'hero/agility/Phantom Lancer.png' onclick ="heroclick('Phantom Lancer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Razor'><img src = 'hero/agility/Razor.png' onclick ="heroclick('Razor')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Riki'><img src = 'hero/agility/Riki.png' onclick ="heroclick('Riki')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Shadow Fiend'><img src = 'hero/agility/Shadow Fiend.png' onclick ="heroclick('Shadow Fiend')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Slark'><img src = 'hero/agility/Slark.png' onclick ="heroclick('Slark')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Sniper'><img src = 'hero/agility/Sniper.png' onclick ="heroclick('Sniper')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Spectre'><img src = 'hero/agility/Spectre.png' onclick ="heroclick('Spectre')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Templar Assassin'><img src = 'hero/agility/Templar Assassin.png' onclick ="heroclick('Templar Assassin')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Terrorblade'><img src = 'hero/agility/Terrorblade.png' onclick ="heroclick('Terrorblade')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Troll Warlord'><img src = 'hero/agility/Troll_Warlord.png' onclick ="heroclick('Troll Warlord')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Ursa'><img src = 'hero/agility/Ursa.png' onclick ="heroclick('Ursa')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Vengeful Spirit'><img src = 'hero/agility/Vengeful Spirit.png' onclick ="heroclick('Vengeful Spirit')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Venomancer'><img src = 'hero/agility/Venomancer.png' onclick ="heroclick('Venomancer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Viper'><img src = 'hero/agility/Viper.png' onclick ="heroclick('Viper')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Weaver'><img src = 'hero/agility/Weaver.png' onclick ="heroclick('Weaver')" width = '92' height = '46' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">intelligence</span>
					<br /><br /><br />
					</div>
					<div class="intelligence_icon">
						<abbr title = 'Ancient Apparition'><img src = 'hero/intelligence/Ancient Apparition.png' onclick ="heroclick('Ancient Apparition')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Bane'><img src = 'hero/intelligence/Bane.png' onclick ="heroclick('Bane')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Batrider'><img src = 'hero/intelligence/Batrider.png' onclick ="heroclick('Batrider')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Chen'><img src = 'hero/intelligence/Chen.png' onclick ="heroclick('Chen')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Crystal Maiden'><img src = 'hero/intelligence/Crystal Maiden.png' onclick ="heroclick('Crystal Maiden')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Dark Seer'><img src = 'hero/intelligence/Dark Seer.png' onclick ="heroclick('Dark Seer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Dazzle'><img src = 'hero/intelligence/Dazzle.png' onclick ="heroclick('Dazzle')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Death Prophet'><img src = 'hero/intelligence/Death Prophet.png' onclick ="heroclick('Death Prophet')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Disruptor'><img src = 'hero/intelligence/Disruptor.png' onclick ="heroclick('Disruptor')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Enchantress'><img src = 'hero/intelligence/Enchantress.png' onclick ="heroclick('Enchantress')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Enigma'><img src = 'hero/intelligence/Enigma.png' onclick ="heroclick('Enigma')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Invoker'><img src = 'hero/intelligence/Invoker.png' onclick ="heroclick('Invoker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Jakiro'><img src = 'hero/intelligence/Jakiro.png' onclick ="heroclick('Jakiro')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Keeper of the Light'><img src = 'hero/intelligence/Keeper of the Light.png' onclick ="heroclick('Keeper of the Light')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Leshrac'><img src = 'hero/intelligence/Leshrac.png' onclick ="heroclick('Leshrac')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lich'><img src = 'hero/intelligence/Lich.png' onclick ="heroclick('Lich')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lina'><img src = 'hero/intelligence/Lina.png' onclick ="heroclick('Lina')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Lion'><img src = 'hero/intelligence/Lion.png' onclick ="heroclick('Lion')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = "Nature's Prophet"><img src = 'hero/intelligence/Natures Prophet.png' onclick ="heroclick('Natures Prophet')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Necrophos'><img src = 'hero/intelligence/Necrophos.png' onclick ="heroclick('Necrophos')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Ogre Magi'><img src = 'hero/intelligence/Ogre Magi.png' onclick ="heroclick('Ogre Magi')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Oracle'><img src = 'hero/intelligence/Oracle.png' onclick ="heroclick('Oracle')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Outworld Devourer'><img src = 'hero/intelligence/Outworld Devourer.png' onclick ="heroclick('Outworld Devourer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Puck'><img src = 'hero/intelligence/Puck.png' onclick ="heroclick('Puck')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Pugna'><img src = 'hero/intelligence/Pugna.png' onclick ="heroclick('Pugna')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Queen of Pain'><img src = 'hero/intelligence/Queen of Pain.png' onclick ="heroclick('Queen of Pain')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Rubick'><img src = 'hero/intelligence/Rubick.png' onclick ="heroclick('Rubick')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Shadow Demon'><img src = 'hero/intelligence/Shadow Demon.png' onclick ="heroclick('Shadow Demon')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Shadow Shaman'><img src = 'hero/intelligence/Shadow Shaman.png' onclick ="heroclick('Shadow Shaman')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Silencer'><img src = 'hero/intelligence/Silencer.png' onclick ="heroclick('Silencer')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Skywrath Mage'><img src = 'hero/intelligence/Skywrath Mage.png' onclick ="heroclick('Skywrath Mage')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Storm Spirit'><img src = 'hero/intelligence/Storm Spirit.png' onclick ="heroclick('Storm Spirit')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Techies'><img src = 'hero/intelligence/Techies.png' onclick ="heroclick('Techies')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Tinker'><img src = 'hero/intelligence/Tinker.png' onclick ="heroclick('Tinker')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Visage'><img src = 'hero/intelligence/Visage.png' onclick ="heroclick('Visage')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Warlock'><img src = 'hero/intelligence/Warlock.png' onclick ="heroclick('Warlock')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Windranger'><img src = 'hero/intelligence/Windranger.png' onclick ="heroclick('Windranger')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Winter Wyvern'><img src = 'hero/intelligence/Winter Wyvern.png' onclick ="heroclick('Winter Wyvern')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Witch Doctor'><img src = 'hero/intelligence/Witch Doctor.png' onclick ="heroclick('Witch Doctor')" width = '92' height = '46' alt = ''/ ></abbr>
						<abbr title = 'Zeus'><img src = 'hero/intelligence/Zeus.png' onclick ="heroclick('Zeus')" width = '92' height = '46' alt = ''/ ></abbr>
					</div>
				
				</div>
				
				
				
				
					&nsbp;
					<br /><br /><br/><br/><br/><br/><br/><br/>
				
				<div id="rp_padd">
				
						<img src="images/rp_top.jpg" width="282" height="10" alt="" style="float:left;" />
				    <div class="rp_loginpad">
						<span id="memlogin" class="rp_titxt">MEMBERS LOGIN</span>
						
						<span class="rp_membrusr">User name:</span>
						<input id = "name" name="#" type="text" class="rp_usrip" />
							
						<span class="rp_membrpwd">Password:</span>
						<input name="#" id = "password" type="password" class="rp_pwdrip" />
						<a href="#" class="rp_login" onclick = "login()"><img src="images/rp_login.jpg" width="39" height="17" alt="" /></a>
									
						<span class="rp_notmem"><a href="#" style="font:11px Arial, Helvetica, sans-serif; color:#FFFFFF;">Forgot your password</a></span>
					
					
					</div>
					
					
					
					
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
			
			
			<!--<div class="ftr_lnks">
				<a href="index.html" class="fp_txt">Home</a>
				<p class="fp_divi">|</p>
				<a href="inner.html" class="fp_txt">Upload</a>
				<p class="fp_divi">|</p>
				<a href="#" class="fp_txt">Watch</a>
				<p class="fp_divi">|</p>
				<a href="#" class="fp_txt">Channel</a>
				<p class="fp_divi">|</p>
				<a href="#" class="fp_txt">News</a>
				<p class="fp_divi">|</p>
				<a href="#" class="fp_txt">Sign Up</a>
				<p class="fp_divi">|</p>
				<a href="#" class="fp_txt">Log In</a>						
	 
			</div> -->
			
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


