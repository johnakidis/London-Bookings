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
<title>London Booking</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
* {
	box-sizing: border-box;
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
<% if(session.getAttribute("intro")!=null){
	session.removeAttribute("intro");
}else{
	response.sendRedirect("index.jsp");
}

%>
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
  You don't have an account?
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
<div class="data">
<br/><br/>
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
ArrayList<String> serveslist=(ArrayList<String>) session.getAttribute("serves");
ArrayList<String> ophlist=(ArrayList<String>) session.getAttribute("oph");
double lt=0.0;
double ln=0.0;
String temp="";
//hotels 
%> 
<h2>HOTELS  
<a class="b1" href="hotel.jsp">See All</a> </h2><br/>
<div class="parent">
<br/><%
String start="https://www.openstreetmap.org/?mlat=";
String mid="&mlon=";
String end="&zoom=15";

for(int k=0;k<6;k++){
	%> <div class="child"> <div class="cht"><% 
		
    String tos=Integer.toString(k);
	String idd="Map"+tos;
	String ur="";
	String all="";
	all=start+latlist.get(k)+mid+lonlist.get(k)+end;
	lt=Double.parseDouble(latlist.get(k));
	ln=Double.parseDouble(lonlist.get(k));
 %>
<h3> <%=namelist.get(k)%> </h3><br/>
  
<% if(!all.equals("")){ %>
<a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
<% }if(!urlist.get(k).matches("(.*)</TD>(.*)")){ %>
URL : <a class="ur" target="_blank" href=<%=urlist.get(k)%> ><%=urlist.get(k)%></a><br/>
<% } else{ %>
URL : Data not available <br/>
<% }if(!emaillist.get(k).matches("(.*)</TD>(.*)")){ %>
Email : <%=emaillist.get(k)%> <br/>
<% } else{ %>
Email : Data not available <br/>
<% }if(!phonelist.get(k).matches("(.*)</TD>(.*)")){ %>
Phone : <%=phonelist.get(k)%> <br/>
<% } else{ %>
Phone : Data not available <br/>
<% }if(!addresslist.get(k).matches("(.*)</TD>(.*)")){ %>
Address : <%=addresslist.get(k)%> <br/>
<% } else{ %>
Address : Data not available <br/>
<% }if(!descriptionlist.get(k).matches("(.*)</TD>(.*)")){ %>
Description : <%=descriptionlist.get(k)%> <br/>
<% } else{ %>
Description : Data not available <br/>
<% }if(!petslist.get(k).matches("(.*)</TD>(.*)")){ %>
Are pets allowed ? <%=petslist.get(k)%> <br/>
<% } else{ %>
Are pets allowed? Data not available <br/>
<% }if(!checkinlist.get(k).matches("(.*)</TD>(.*)")){ %>
Check-in hour : <%=checkinlist.get(k)%> <br/>
<% } else{ %>
Check-in hour : Data not available <br/>
<% }if(!checkoutlist.get(k).matches("(.*)</TD>(.*)")){ %>
Check-out hour : <%=checkoutlist.get(k)%> <br/>
<% } else{ %>
Check-out hour : Data not available <br/>
<% }if(!roomslist.get(k).matches("(.*)</TD>(.*)")){ %>
Number of rooms : <%=roomslist.get(k)%> <br/>
<% } else{ %>
Number of rooms : Data not available <br/>
<% }if(!starslist.get(k).matches("(.*)</TD>(.*)")){ %>
<% int starval=Integer.parseInt(starslist.get(k)); 
for(int sv=1;sv<=starval;sv++){ %>
<span class="fa fa-star checked"></span>
<% } 
for(int sv=starval+1;sv<=5;sv++){ %>
<span class="fa fa-star"></span>
<% } %>
<br/>
<br/>
<% } %>
<% if(session.getAttribute("user")!=null){ %>
<form action="makebooking.jsp" method="post">
<input type="hidden" name="name" value="<%=namelist.get(k)%>" >
<input type="hidden" name="lat" value=<%=latlist.get(k)%> >
<input type="hidden" name="lon" value=<%=lonlist.get(k)%> >
<input type="hidden" name="cin" value=<%=checkinlist.get(k)%> >
<input type="hidden" name="cout" value=<%=checkoutlist.get(k)%> >
<input type="hidden" name="stars" value=<%=starslist.get(k)%> >
<input type="hidden" name="pets" value=<%=petslist.get(k)%> >
<input type="hidden" name="rooms" value=<%=roomslist.get(k)%> >
<% if(!urlist.get(k).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="url" value=<%=urlist.get(k)%> >
<% }if(!emaillist.get(k).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="mail" value=<%=emaillist.get(k)%> >
<% }if(!phonelist.get(k).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="phone" value=<%=phonelist.get(k)%> >
<% }if(!addresslist.get(k).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="address" value="<%=addresslist.get(k)%>" >
<% }if(!descriptionlist.get(k).matches("(.*)</TD>(.*)")){ %>
<input type="hidden" name="description" value="<%=descriptionlist.get(k)%>" >
<% } %>
<button class="b3" type="submit" value="Submit">Book</button><br/><br/>
</form>
<% }  %>
<button class="b3" id="mbt" onclick="mymap(<%=lt%>,<%=ln%>,<%=tos%>);this.disabled = true;">Show Map</button> <br/><br/>
<div id=<%=idd%> style="height:100px;width:375px"></div>
</div> </div>
<% 
} %>
</div>
<br/>
<div class="h4"> On this site you can also guide yourself through many tourist attractions such as: <br/><br/>
<div class="child_2">
<a class="b1" href="restaurant.jsp">Restaurants</a>
<a class="b1" href="cinema.jsp">Cinemas</a>
<a class="b1" href="museum.jsp">Museums</a>
<a class="b1" href="park.jsp">Parks</a>
<a class="b1" href="casino.jsp">Casinos</a>
<a class="b1" href="hospital.jsp">Hospitals</a>
</div>
</div>
</div>
</body>
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
</html>
