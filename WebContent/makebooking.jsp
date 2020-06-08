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
<title>Book</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
* {
	box-sizing: border-box;
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
 
 .signupf{
 background-color: #24252A;
 max-width:400px;
 border-radius:20px;
 margin-left:40%;
 box-sizing:border-box;
 font-family:"Montserrat",sans-serirf;
 font-weight: 500;
 font-size: 12px;
 color: #edf0f1;
 padding:40px;
 margin-bottom: 10px;
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
 
#ex input{
	width:100%;
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
 
.ur:hover{
 	color: black;
 }
 h2{
 font: bold 18px;
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
 max-width:400px;
 border-radius:20px;
 margin-left:40%;
 box-sizing:border-box;
 margin-top:10px;
 background-color: #D3D3D3;
 padding-right:10px;
 padding-left:15px;
 margin-bottom:10px;
}

.parent:hover{
	filter: brightness(90%);
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
<% if(session.getAttribute("user")==null){ 
	response.sendRedirect("index.jsp");
} %>
<footer>
<marquee behavior="alternate"><span class="marquee">This website is part of Giannis Giannakidis undergraduate thesis giannakidis13giannis@gmail.com sdi1500025@di.uoa.gr</span></marquee>
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
<div class="data">
<div class="parent">
<div class="child">
<div class="cht">
<% String name=request.getParameter("name");
   if(name==null)
   		response.sendRedirect("index.jsp");%>
<%
String lat=request.getParameter("lat");
String lon=request.getParameter("lon");
String cin=request.getParameter("cin");
String cout=request.getParameter("cout");
String stars=request.getParameter("stars");
String pets=request.getParameter("pets");
String rooms=request.getParameter("rooms");
String url=request.getParameter("url");
String mail=request.getParameter("mail");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String description=request.getParameter("description");
String uname=(String)session.getAttribute("user");
double lt=Double.parseDouble(lat);
double ln=Double.parseDouble(lon);
String start="https://www.openstreetmap.org/?mlat=";
String mid="&mlon=";
String end="&zoom=15";
String all="";
all=start+lt+mid+ln+end;
%>
<br/><h3> <%=name%>  </h3><br/>
<a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
<img border="0"  src="img/clock.png" width="20" height="20"> Check-in : <%=cin%> <br/>
<img border="0"  src="img/clock.png" width="20" height="20"> Check-out : <%=cout%> <br/>
<img border="0"  src="img/pets.png" width="20" height="20"> Allowed ? <%=pets%> <br/>
Number of rooms : <%=rooms%> <br/>
<% if(url!=null){ %>
<img border="0"  src="img/website.png" width="20" height="20"> <a class="ur" target="_blank" href=<%=url%> >Website</a><br/>
<% }if(mail!=null) {%>
<img border="0"  src="img/mail.png" width="20" height="20"> <%=mail%> <br/>
<% }if(phone!=null) {%>
<img border="0"  src="img/phone.png" width="20" height="20"> <%=phone%> <br/>
<% }if(address!=null) {%>
<img border="0"  src="img/location000000.png" width="20" height="20"> <%=address%> <br/>
<% }if(description!=null) { %>
Description : <%=description%> <br/>
<% }  %>
<% 
if(stars!=null){ %>
<% double ratingg=Double.parseDouble(stars);
	int starval=(int)ratingg; 
for(int sv=1;sv<=starval;sv++){ %>
<span class="fa fa-star checked"></span>
<% } 
for(int sv=starval+1;sv<=5;sv++){ %>
<span class="fa fa-star"></span>
<% }} %>
<br/><br/><div id="Map" style="height:100px;width:375px"></div><br/>
</div>
</div>
</div>
<div class="signupf">
<h2> Booking information </h2>
<form id="ex" action="InsertBooking" method="post" onsubmit="return sform(this)">
<input type="hidden" name="name" value=<%=name%> >
<input type="hidden" name="lat" value=<%=lat%> >
<input type="hidden" name="lon" value=<%=lon%> >
<input type="hidden" name="uname" value=<%=uname%> >
<input type="number" placeholder="Number of people" name="people" min="1" required> <br/>
<input  id="sdate" placeholder="Starting date"  onfocus="(this.type='date')" name="sdate" min="2000-13-13" required> <br/>
<input  id="edate" placeholder="Ending date"  onfocus="(this.type='date')" name="edate" min="2000-13-13'" required><br/> <br/>
<button type="submit" value="Submit">Book</button><button onclick="goBack()">Go Back</button>
</form>
</div>
</div>
<script>
function goBack() {
  window.history.back();
}
</script>
<script>
  function sform() {
	  var startdate = document.getElementById("sdate").value;
	  var syear=startdate.slice(0,4)
	  var smonth=startdate.slice(5,7)
	  var sday=startdate.slice(8,10)
	  var enddate = document.getElementById("edate").value;
	  var eyear=enddate.slice(0,4)
	  var emonth=enddate.slice(5,7)
	  var eday=enddate.slice(8,10)
      if (eyear<syear){ 
      	alert("Ending date must be after starting date");
   	  	return false;
      }
	  if( emonth < smonth){
		  alert("Ending date must be after starting date");
	   	  	return false;
	  }
	  if( eday < sday){
		  alert("Ending date must be after starting date");
	   	  	return false;
	  }
   	 return true;
  }

</script>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("sdate").setAttribute("min", today);
document.getElementById("edate").setAttribute("min", today);
</script>
<script src="OpenLayers.js"></script>
<script>
    var lat            = "<%=lt%>";
    var lon            = "<%=ln%>";
    var zoom           = 15;

    var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
    var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
    var position       = new OpenLayers.LonLat(lon, lat).transform( fromProjection, toProjection);
    map = new OpenLayers.Map("Map");
    var mapnik         = new OpenLayers.Layer.OSM();
    map.addLayer(mapnik);
    var markers = new OpenLayers.Layer.Markers( "Markers" );
    map.addLayer(markers);
    markers.addMarker(new OpenLayers.Marker(position));
    map.setCenter(position, zoom);
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
</body>
</html>