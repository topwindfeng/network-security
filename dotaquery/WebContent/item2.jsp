<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Item page</title>
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
					<span id= "home" class="lp_newvidit2">items</span>
					<br /><br /><br /><br /><br />
					</div>
					
					
					<div>
					<span class="lp_newvidit">Consumables</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Animal_Courier'><img src = 'item/Consumables/Animal_Courier_(Radiant).png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Bottle'><img src = 'item/Consumables/Bottle.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Clarity'><img src = 'item/Consumables/Clarity.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Dust_of_Appearance'><img src = 'item/Consumables/Dust_of_Appearance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Enchanted_Mango'><img src = 'item/Consumables/Enchanted_Mango.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Faerie_Fire'><img src = 'item/Consumables/Faerie_Fire.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Flying_Courier'><img src = 'item/Consumables/Flying_Courier.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Healing_Salve'><img src = 'item/Consumables/Healing_Salve.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Observer_Ward'><img src = 'item/Consumables/Observer_Ward.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Sentry_Ward'><img src = 'item/Consumables/Sentry_Ward.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Smoke_of_Deceit'><img src = 'item/Consumables/Smoke_of_Deceit.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Tango'><img src = 'item/Consumables/Tango.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Tome_of_Knowledge'><img src = 'item/Consumables/Tome_of_Knowledge.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Town_Portal_Scroll'><img src = 'item/Consumables/Town_Portal_Scroll.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Attributes</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Band_of_Elvenskin'><img src = 'item/Attributes/Band_of_Elvenskin.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Belt_of_Strength'><img src = 'item/Attributes/Belt_of_Strength.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Blade_of_Alacrity'><img src = 'item/Attributes/Blade_of_Alacrity.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Bracer'><img src = 'item/Attributes/Bracer.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Circlet'><img src = 'item/Attributes/Circlet.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Gauntlets_of_Strength'><img src = 'item/Attributes/Gauntlets_of_Strength.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Iron_Branch'><img src = 'item/Attributes/Iron_Branch.png' onclick ="heroclick('Abaddon')" width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mantle_of_Intelligence'><img src = 'item/Attributes/Mantle_of_Intelligence.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ogre_Club'><img src = 'item/Attributes/Ogre_Club.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Robe_of_the_Magi'><img src = 'item/Attributes/Robe_of_the_Magi.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Slippers_of_Agility'><img src = 'item/Attributes/Slippers_of_Agility.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Staff_of_Wizardry'><img src = 'item/Attributes/Staff_of_Wizardry.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Armaments</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Blades_of_Attack'><img src = 'item/Armaments/Blades_of_Attack.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Blight_Stone'><img src = 'item/Armaments/Blight_Stone.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Broadsword'><img src = 'item/Armaments/Broadsword.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Chainmail'><img src = 'item/Armaments/Chainmail.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Claymore'><img src = 'item/Armaments/Claymore.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Helm_of_Iron_Will'><img src = 'item/Armaments/Helm_of_Iron_Will.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Infused_Raindrop'><img src = 'item/Armaments/Infused_Raindrop.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Javelin'><img src = 'item/Armaments/Javelin.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mithril_Hammer'><img src = 'item/Armaments/Mithril_Hammer.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Orb_of_Venom'><img src = 'item/Armaments/Orb_of_Venom.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Quarterstaff'><img src = 'item/Armaments/Quarterstaff.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Quelling_Blade'><img src = 'item/Armaments/Quelling_Blade.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ring_of_Protection'><img src = 'item/Armaments/Ring_of_Protection.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Stout_Shield'><img src = 'item/Armaments/Stout_Shield.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Arcane</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Blink_Dagger'><img src = 'item/Arcane/Blink_Dagger.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Boots_of_Speed'><img src = 'item/Arcane/Boots_of_Speed.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Cloak'><img src = 'item/Arcane/Cloak.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Gem_of_True_Sight'><img src = 'item/Arcane/Gem_of_True_Sight.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ghost_Scepter'><img src = 'item/Arcane/Ghost_Scepter.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Gloves_of_Haste'><img src = 'item/Arcane/Gloves_of_Haste.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Magic_Stick'><img src = 'item/Arcane/Magic_Stick.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Morbid_Mask'><img src = 'item/Arcane/Morbid_Mask.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ring_of_Health'><img src = 'item/Arcane/Ring_of_Health.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ring_of_Regen'><img src = 'item/Arcane/Ring_of_Regen.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Sages_Mask'><img src = 'item/Arcane/Sages_Mask.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Shadow_Amulet'><img src = 'item/Arcane/Shadow_Amulet.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Void_Stone'><img src = 'item/Arcane/Void_Stone.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Wind_Lace'><img src = 'item/Arcane/Wind_Lace.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Common</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Boots_of_Travel'><img src = 'item/Common/Boots_of_Travel.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Hand_of_Midas'><img src = 'item/Common/Hand_of_Midas.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Magic_Wand'><img src = 'item/Common/Magic_Wand.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Moon_Shard'><img src = 'item/Common/Moon_Shard.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Null_Talisman'><img src = 'item/Common/Null_Talisman.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Oblivion_Staff'><img src = 'item/Common/Oblivion_Staff.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Perseverance'><img src = 'item/Common/Perseverance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Phase_Boots'><img src = 'item/Common/Phase_Boots.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Poor_Mans_Shield'><img src = 'item/Common/Poor_Mans_Shield.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Power_Treads'><img src = 'item/Common/Power_Treads.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Soul_Ring'><img src = 'item/Common/Soul_Ring.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Wraith_Band'><img src = 'item/Common/Wraith_Band.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Support</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Arcane_Boots'><img src = 'item/Support/Arcane_Boots.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Buckler'><img src = 'item/Support/Buckler.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Drum_of_Endurance'><img src = 'item/Support/Drum_of_Endurance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Guardian_Greaves'><img src = 'item/Support/Guardian_Greaves.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Headdress'><img src = 'item/Support/Headdress.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Iron_Talon'><img src = 'item/Support/Iron_Talon.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Medallion_of_Courage'><img src = 'item/Support/Medallion_of_Courage.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mekansm'><img src = 'item/Support/Mekansm.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Pipe_of_Insight'><img src = 'item/Support/Pipe_of_Insight.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ring_of_Aquila'><img src = 'item/Support/Ring_of_Aquila.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ring_of_Basilius'><img src = 'item/Support/Ring_of_Basilius.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Tranquil_Boots'><img src = 'item/Support/Tranquil_Boots.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Urn_of_Shadows'><img src = 'item/Support/Urn_of_Shadows.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Vladmirs_Offering'><img src = 'item/Support/Vladmirs_Offering.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Caster</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Aether_Lens'><img src = 'item/Caster/Aether_Lens.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Aghanims_Scepter'><img src = 'item/Caster/Aghanims_Scepter.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Dagon_1'><img src = 'item/Caster/Dagon_1.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Euls_Scepter_of_Divinity'><img src = 'item/Caster/Euls_Scepter_of_Divinity.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Force_Staff'><img src = 'item/Caster/Force_Staff.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Glimmer_Cape'><img src = 'item/Caster/Glimmer_Cape.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Necronomicon_1'><img src = 'item/Caster/Necronomicon_1.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Octarine_Core'><img src = 'item/Caster/Octarine_Core.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Orchid_Malevolence'><img src = 'item/Caster/Orchid_Malevolence.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Refresher_Orb'><img src = 'item/Caster/Refresher_Orb.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Rod_of_Atos'><img src = 'item/Caster/Rod_of_Atos.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Scythe_of_Vyse'><img src = 'item/Caster/Scythe_of_Vyse.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Solar_Crest'><img src = 'item/Caster/Solar_Crest.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Veil_of_Discord'><img src = 'item/Caster/Veil_of_Discord.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Weapons</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Abyssal_Blade'><img src = 'item/Weapons/Abyssal_Blade.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Armlet_of_Mordiggian'><img src = 'item/Weapons/Armlet_of_Mordiggian.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Battle_Fury'><img src = 'item/Weapons/Battle_Fury.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Bloodthorn'><img src = 'item/Weapons/Bloodthorn.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Butterfly'><img src = 'item/Weapons/Butterfly.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Crystalys'><img src = 'item/Weapons/Crystalys.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Daedalus'><img src = 'item/Weapons/Daedalus.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Divine_Rapier'><img src = 'item/Weapons/Divine_Rapier.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ethereal_Blade'><img src = 'item/Weapons/Ethereal_Blade.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Monkey_King_Bar'><img src = 'item/Weapons/Monkey_King_Bar.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Radiance'><img src = 'item/Weapons/Radiance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Shadow_Blade'><img src = 'item/Weapons/Shadow_Blade.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Silver_Edge'><img src = 'item/Weapons/Silver_Edge.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Skull_Basher'><img src = 'item/Weapons/Skull_Basher.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Armor</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Assault_Cuirass'><img src = 'item/Armor/Assault_Cuirass.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Black_King_Bar'><img src = 'item/Armor/Black_King_Bar.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Blade_Mail'><img src = 'item/Armor/Blade_Mail.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Bloodstone'><img src = 'item/Armor/Bloodstone.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Crimson_Guard'><img src = 'item/Armor/Crimson_Guard.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Heart_of_Tarrasque'><img src = 'item/Armor/Heart_of_Tarrasque.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Hood_of_Defiance'><img src = 'item/Armor/Hood_of_Defiance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Hurricane_Pike'><img src = 'item/Armor/Hurricane_Pike.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Linkens_Sphere'><img src = 'item/Armor/Linkens_Sphere.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Lotus_Orb'><img src = 'item/Armor/Lotus_Orb.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Manta_Style'><img src = 'item/Armor/Manta_Style.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Shivas_Guard'><img src = 'item/Armor/Shivas_Guard.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Soul_Booster'><img src = 'item/Armor/Soul_Booster.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Vanguard'><img src = 'item/Armor/Vanguard.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Artifacts</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Desolator'><img src = 'item/Artifacts/Desolator.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Diffusal_Blade'><img src = 'item/Artifacts/Diffusal_Blade_1.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Dragon_Lance'><img src = 'item/Artifacts/Dragon_Lance.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Echo_Sabre'><img src = 'item/Artifacts/Echo_Sabre.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Eye_of_Skadi'><img src = 'item/Artifacts/Eye_of_Skadi.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Heavens_Halberd'><img src = 'item/Artifacts/Heavens_Halberd.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Helm_of_the_Dominator'><img src = 'item/Artifacts/Helm_of_the_Dominator.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Maelstrom'><img src = 'item/Artifacts/Maelstrom.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mask_of_Madness'><img src = 'item/Artifacts/Mask_of_Madness.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mjollnir'><img src = 'item/Artifacts/Mjollnir.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Sange'><img src = 'item/Artifacts/Sange.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Sange_and_Yasha'><img src = 'item/Artifacts/Sange_and_Yasha.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Satanic'><img src = 'item/Artifacts/Satanic.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Yasha'><img src = 'item/Artifacts/Yasha.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Secret Shop</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Demon_Edge'><img src = 'item/Secret Shop/Demon_Edge.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Eaglesong'><img src = 'item/Secret Shop/Eaglesong.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Energy_Booster'><img src = 'item/Secret Shop/Energy_Booster.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Hyperstone'><img src = 'item/Secret Shop/Hyperstone.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Mystic_Staff'><img src = 'item/Secret Shop/Mystic_Staff.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Platemail'><img src = 'item/Secret Shop/Platemail.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Point_Booster'><img src = 'item/Secret Shop/Point_Booster.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Reaver'><img src = 'item/Secret Shop/Reaver.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Sacred_Relic'><img src = 'item/Secret Shop/Sacred_Relic.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Talisman_of_Evasion'><img src = 'item/Secret Shop/Talisman_of_Evasion.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Ultimate_Orb'><img src = 'item/Secret Shop/Ultimate_Orb.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Vitality_Booster'><img src = 'item/Secret Shop/Vitality_Booster.png' width = '88' height = '64' alt = ''/ ></abbr>
					</div>
					
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Dropped item</span>
					<br /><br /><br />
					</div>
					<div>
						<abbr title = 'Aegis_of_the_Immortal'><img src = 'item/Dropped item/Aegis_of_the_Immortal_icon.png' width = '88' height = '64' alt = ''/ ></abbr>
						<abbr title = 'Cheese'><img src = 'item/Dropped item/Cheese.png' width = '88' height = '64' alt = ''/ ></abbr>
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


