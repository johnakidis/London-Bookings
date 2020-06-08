<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotels</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
* {
	box-sizing: border-box;
}
.child:hover{
	filter: brightness(90%);
}
input{
	box-sizing:border-box;
	padding:12px 3px;
	background:rgba(0,0,0,0.10);
	outline:none;
	border:none;
	border-bottom:1px dotted #fff;
	color: #fff;
	border-radius:5px;
	margin:5px;
	font-family:"Montserrat",sans-serirf;
 	font-weight: 500;
 	font-size: 12px;
}

 .signupf{
 width:100%;
 box-sizing:border-box;
 background-color: #24252A;
 margin-top: -30px;
 box-sizing:border-box;
 font-family:"Montserrat",sans-serirf;
 font-weight: 500;
 font-size: 12px;
 color: #edf0f1;
 display:flex;
 justify-content: space-between;
 align-items:center;
 padding:20px;
 
 }

#ex input{
	box-sizing:border-box;
	padding:12px 3px;
	background:rgba(0,0,0,0.10);
	outline:none;
	border:none;
	border-bottom:1px dotted #fff;
	color: #fff;
	border-radius:5px;
	margin:5px;
	margin-left:75px;
	margin-right:20px;
	font-family:"Montserrat",sans-serirf;
 	font-weight: 500;
 	font-size: 12px;
}

#ex select{
	box-sizing:border-box;
	padding:12px 3px;
	background:rgba(0,0,0,0.10);
	outline:none;
	border:none;
	border-bottom:1px dotted #fff;
	color: #fff;
	border-radius:5px;
	margin:5px;
	margin-right:20px;
	font-family:"Montserrat",sans-serirf;
 	font-weight: 500;
 	font-size: 12px;
}

#ex option{
	color:black;
}

footer{
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 12px;
	color: #edf0f1;
	background-color: #24252A;
    max-width: 100%;
    height: 10px;
    text-align: right;
}

marquee {
    white-space: nowrap;
    -webkit-animation: rightThenLeft 4s linear;
}
body{
	margin:0;
}

.ur{
 	cursor:pointer;
 	color: black;
 	text-decoration: underline;
 }
 
 .bottom{
 	background-color: #F0F8FF;
 }
 
.ur:hover{
 	color: black;
 }
 h2{
 font: bold 18px;
 margin-left:40%;
 }
 .checked {
  color: orange;
}
  h3{
 font: 15px;
 }
.data{
	box-sizing:border-box;
	margin:10;
	padding:10;
	
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 14px;
}
li,a,button{
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 14px;
	color: #edf0f1;
	text-decoration:none;
}
header{
	width:100%;
	box-sizing:border-box;
	margin:0;
	padding:0;
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 12px;
	color: #edf0f1;
	background-color: #24252A;
	display:flex;
	justify-content: space-between;
	align-items:center;
	padding:20px 5%;
}

.logo {
	background-color: #24252A;
	cursor:pointer;
}

.logo_1 {
	cursor:pointer;
	background-color: #F0F8FF;
	position: fixed;
    bottom: 0;
    left: 0;
}

.logo_2 {
	cursor:pointer;
	background-color: #F0F8FF;
	position: fixed;
    bottom: 0;
    right: 0;
}


.nav_links{
	color: #24252A;
	background-color: #24252A;
	list-style:none;
}

.nav_links li{
	background-color: #24252A;
	display: inline-block;
	padding: 0px 10px;
}

.nav_links li a {
	transition: all 0.3s ease 0s;
}

.nav_links li a:hover {
	color: #0088a9
}

button{
	margin-left: 10px;
	padding: 5px 12px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

button:hover{
	background-color: rgba(65,105,225,0.8);
}

.b3{
	margin-left:0px;
	padding: 5px 12px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

b3:hover{
	background-color: rgba(65,105,225,0.8);
}

.b5{
	margin-left:15px;
	padding: 5px 12px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

.b5:hover{
	background-color: rgba(65,105,225,0.8);
}

.b6{
	display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
	margin-left:15px;
	padding: 10px 20px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

.b6:hover{
	background-color: rgba(65,105,225,0.8);
}

.b1{
   margin-left: 10px;
	padding: 5px 12px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

.b1:hover{
	background-color: rgba(65,105,225,0.8);
}

.b2{
   margin-left: 10px;
	padding: 7px 15px;
	background-color: rgba(205,92,92,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

.b2:hover{
	background-color: rgba(178,34,34,0.8);
}

a.button{
font-size: 10px;
	margin-left: 5px;
	padding: 5px 12px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

a.button:hover{
	background-color: rgba(65,105,225,0.8);
}

.parent {
  display: flex;
  flex-wrap: wrap;
  padding-left: 10%;
}
.child {
  margin-left:20px;
  margin-bottom:10px;
  list-style: none;
  flex: 0 0 27%;
  background-color: #D3D3D3;
  border-radius: 25px;
}

.cht{
padding-right:10px;
	padding-left:15px;
	margin-bottom:10px;
}

.h4 {
  font: bold 18px;
  display: flex;
  flex-wrap: wrap;
  padding-left: 20px;
}
.child_2 {
  list-style: none;
  flex: 0 0 33.333333%;
}
</style>
</head>
<body>
<footer>
<marquee><span class="marquee">This website is part of Giannis Giannakidis undergraduate thesis giannakidis13giannis@gmail.com sdi1500025@di.uoa.gr</span></marquee>
</footer>
<header>
<div class="logo">
<a href="index.jsp">
<img border="0" alt="Logo" src="img/logo.png" width="100" height="100">
</a>
</div>
<nav>
<ul class="nav_links">
<li><a href="index.jsp">Start Page</a></li>
<li><a href="hotel.jsp">Hotels</a></li>
<!--  if logged in check -->
<% if(session.getAttribute("user")!=null) { %>
<li><a href="bookings.jsp">Bookings</a></li>
<% } %>
<li><a href="restaurant.jsp">Restaurants</a></li>
<li><a href="cinema.jsp">Cinemas</a></li>
<li><a href="museum.jsp">Museums</a></li>
<li><a href="park.jsp">Parks</a></li>
<li><a href="hospital.jsp">Hospitals</a></li>
<li><a href="casino.jsp">Casinos</a></li>
<!--  if logged in check -->
<% if(session.getAttribute("user")!=null){ %>
<li><a href="profil.jsp">Profil</a></li>
<% } %>
</ul>
</nav>
<% if(session.getAttribute("error")!=null){ %>
<% if(session.getAttribute("error").equals("uname")){ %>
<script type="text/javascript"> alert("This username doesn't exist. Please try again!");</script>            
 <%      } else if (session.getAttribute("error").equals("pwd")) { %>
        <script type="text/javascript"> alert("Wrong password. Please try again!");</script>  
<% } session.removeAttribute("error"); } %>
<% if(session.getAttribute("user")==null){ %>
<div class="login">
<form action="LoginServlet" method="post">
	<input type="text" placeholder="Username" name="usr" maxlength="20" required/> 
	<input type="password" placeholder="Password" name="pwd" maxlength="20" required/> 
	<button type="submit" value="Submit">Log-In</button>
</form>
</div>
<div class="signup">
  You don't have an account:
<a href="signup.jsp">
<button type="submit" value="Submit">Sign-up</button>
</a>
</div>
<% }else{ %>
<div class="logout">
<form action="LogoutServlet" method="get">
	<button class="b2" type="submit" value="Submit">Log-Out</button>
</form>
</div>
<% } %>
</header>
<button onclick="topFunction()" id="myBtn" class="b6" title="Go to top">Top</button>
<div class="signupf">
<form action="HotelSearch" id="ex" method="post" onsubmit="return sform(this)">
	<input type="search" id="nm" placeholder="Search by name" name="nm"/>
	Check-in:<select id="chin" name="chin">
	<option value="Anytime" selected>Anytime
	<option value="9">9AM
	<option value="10">10AM
	<option value="11">11AM
	</select>
	Check-out:<select id="chout" name="chout">
	<option value="Anytime" selected>Anytime
	<option value="9">9AM
	<option value="10">10AM
	<option value="11">11AM
	</select>
	Pets?<select id="pts" name="pts">
	<option value="Anytime" selected>None
	<option value="Yes">Yes
	<option value="No">No
	</select>
	Star rating atleast:<select id="str" name="stR">
	<option value="Anytime" selected>Any Rating
	<option value="1">1
	<option value="2">2
	<option value="3">3
	<option value="4">4
	<option value="5">5
	</select>
	Sort: <select id="sr" name="sr">
	<option value="No" selected>No Sorting
	<option value="A-Z">A-Z
	<option value="Z-A">Z-A
	</select>
	<button class="b3" type="submit" value="Submit">Search <img border="0"  src="img/search.png" width="20" height="20"></button>
	<a class="b5" href="hotel.jsp">Reset filters</a>
</form>
</div>
<div class="data">
<%

ArrayList<String> namelist=(ArrayList<String>) session.getAttribute("namelist");
ArrayList<String> latlist=(ArrayList<String>) session.getAttribute("latlist");
ArrayList<String> lonlist=(ArrayList<String>) session.getAttribute("lonlist");
ArrayList<String> urlist=(ArrayList<String>) session.getAttribute("ur");
ArrayList<String> emaillist=(ArrayList<String>) session.getAttribute("email");
ArrayList<String> phonelist=(ArrayList<String>) session.getAttribute("phone");
ArrayList<String> addresslist=(ArrayList<String>) session.getAttribute("address");
ArrayList<String> descriptionlist=(ArrayList<String>) session.getAttribute("description");
ArrayList<String> checkinlist=(ArrayList<String>) session.getAttribute("checkin");
ArrayList<String> checkoutlist=(ArrayList<String>) session.getAttribute("checkout");
ArrayList<String> petslist=(ArrayList<String>) session.getAttribute("pets");
ArrayList<String> roomslist=(ArrayList<String>) session.getAttribute("rooms");
ArrayList<String> starslist=(ArrayList<String>) session.getAttribute("stars");
double lt=0.0;
double ln=0.0;
String temp=""; 
if(namelist==null)
	response.sendRedirect("hotel.jsp");
if(namelist!=null)
if(namelist.get(0).matches("(.*)</TD>(.*)")){
%>
<h2>No results found</h2> <a class="b1" href="hotel.jsp">Reset filters</a>
<% } else {
	%>
<h2>Hotels <img border="0"  src="img/hotel.png" width="20" height="20"></h2>
<div class="parent">
	<% 
	String start="https://www.openstreetmap.org/?mlat=";
	String mid="&mlon=";
	String end="&zoom=15";
	int k=0;
	for(String s : namelist){
		String tos=Integer.toString(k);
		String idd="Map"+tos;
		%> <div class="child"> <div class="cht"> <% 
		temp="Map"+s;
		String ur="";
		lt=Double.parseDouble(latlist.get(k));
		ln=Double.parseDouble(lonlist.get(k));
		String all="";
		all=start+lt+mid+ln+end;
	 %>
 <h3> <%=s%>  </h3><br/>
 <% if(!all.equals("")){ %>
<a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
<% }if(!urlist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/website.png" width="20" height="20"> <a class="ur" target="_blank" href=<%=urlist.get(k)%> >Website</a><br/>
<% } else { %>
<img border="0"  src="img/website.png" width="20" height="20"> <br/>
<% }if(!emaillist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/mail.png" width="20" height="20"> <%=emaillist.get(k)%> <br/>
<% } else { %>
<img border="0"  src="img/mail.png" width="20" height="20"> <br/>
<% }if(!phonelist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/phone.png" width="20" height="20"> <%=phonelist.get(k)%> <br/>
<% } else { %>
<img border="0"  src="img/phone.png" width="20" height="20"> <br/>
<% }if(!addresslist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/location000000.png" width="20" height="20"> <%=addresslist.get(k)%> <br/>
<% } else { %>
<img border="0"  src="img/location000000.png" width="20" height="20"> <br/>
<% }if(!petslist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/pets.png" width="20" height="20"> Allowed ? <%=petslist.get(k)%> <br/>
<% }if(!checkinlist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/clock.png" width="20" height="20"> Check-in : <%=checkinlist.get(k)%> <br/>
<% }if(!checkoutlist.get(k).matches("(.*)</TD>(.*)")){ %>
<img border="0"  src="img/clock.png" width="20" height="20"> Check-out : <%=checkoutlist.get(k)%> <br/>
<% }if(!descriptionlist.get(k).matches("(.*)</TD>(.*)")){ %>
Description : <%=descriptionlist.get(k)%> <br/>
<% } else { %>
Description :  <br/>
<% }if(!roomslist.get(k).matches("(.*)</TD>(.*)")){ %>
Number of rooms : <%=roomslist.get(k)%> <br/>
<% }if(!starslist.get(k).matches("(.*)</TD>(.*)")){ %>
<% 
double ratingg=Double.parseDouble(starslist.get(k));
	int starval=(int)ratingg;
for(int sv=1;sv<=starval;sv++){ %>
<span class="fa fa-star checked"></span>
<% } 
for(int sv=starval+1;sv<=5;sv++){ %>
<span class="fa fa-star"></span>
<% } %>
<br/>
<% } %>
<% k++;
 if(session.getAttribute("user")!=null){ %>
<form action="makebooking.jsp" method="post">
<input type="hidden" name="name" value="<%=s%>" >
<input type="hidden" name="lat" value=<%=latlist.get(k-1)%> >
<input type="hidden" name="lon" value=<%=lonlist.get(k-1)%> >
<input type="hidden" name="cin" value=<%=checkinlist.get(k-1)%> >
<input type="hidden" name="cout" value=<%=checkoutlist.get(k-1)%> >
<input type="hidden" name="stars" value=<%=starslist.get(k-1)%> >
<input type="hidden" name="pets" value=<%=petslist.get(k-1)%> >
<input type="hidden" name="rooms" value=<%=roomslist.get(k-1)%> >
<% if(!urlist.get(k-1).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="url" value=<%=urlist.get(k-1)%> >
<% }if(!emaillist.get(k-1).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="mail" value=<%=emaillist.get(k-1)%> >
<% }if(!phonelist.get(k-1).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="phone" value=<%=phonelist.get(k-1)%> >
<% }if(!addresslist.get(k-1).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="address" value="<%=addresslist.get(k-1)%>" >
<% }if(!descriptionlist.get(k-1).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="description" value="<%=descriptionlist.get(k-1)%>" >
<% } %>
<br/><button class="b3" type="submit" value="Submit">Book</button><br/>
</form>
<% } %>
<br/><button class="b3" id="mbt" onclick="mymap(<%=lt%>,<%=ln%>,<%=tos%>);this.disabled = true;">Show Map</button><br/>
<div id=<%=idd%> style="height:100px;width:375px;border-radius:25px;"></div>
 </div></div> <% 
	}
}  %>
</div>
</div>
<script src="OpenLayers.js"></script>
<script>
function mymap(lt,ln,i) {
	var nm="Map"+i
    var lat            = lt;
    var lon            = ln;
    var zoom           = 15;
    var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
    var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
    var position       = new OpenLayers.LonLat(lon, lat).transform( fromProjection, toProjection);
    map = new OpenLayers.Map(nm);
    var mapnik         = new OpenLayers.Layer.OSM();
    map.addLayer(mapnik);
    var markers = new OpenLayers.Layer.Markers( "Markers" );
    map.addLayer(markers);
    markers.addMarker(new OpenLayers.Marker(position));
    map.setCenter(position, zoom);
}
</script>
<script>
function sform() {
	  var name= document.getElementById("nm").value;
	  if(name==null)
		  name="";
	  var sr = document.getElementById("sr").value;
	  var cin = document.getElementById("chin").value;
	  var cout = document.getElementById("chout").value;
	  var pt = document.getElementById("pts").value;
	  var sor = document.getElementById("str").value;
    if (name=="" && cin=="Anytime" && cout=="Anytime" && pt=="Anytime" && sor=="Anytime" && sr=="No" ){ 
    	alert("Fill atleast one option to search");
 	  	return false;
    }
 	 return true;
}
</script>
<script>
var mybutton = document.getElementById("myBtn");
window.onscroll = function() {scrollFunction()};
function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
<%
session.removeAttribute("namelist");
session.removeAttribute("latlist");
session.removeAttribute("lonlist");
session.removeAttribute("ur");
session.removeAttribute("email");
session.removeAttribute("phone");
session.removeAttribute("address");
session.removeAttribute("description");
session.removeAttribute("checkin");
session.removeAttribute("checkout");
session.removeAttribute("pets");
session.removeAttribute("stars");
session.removeAttribute("rooms");
%>
</body>
</html>