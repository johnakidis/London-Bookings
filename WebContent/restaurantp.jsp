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
<title>Restaurants</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
* {
	box-sizing:border-box;
	margin:0;
	padding:0;
	background-color: #24252A;
	color: #edf0f1;
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 12px;
}
li,a,button{
	font-family:"Montserrat",sans-serirf;
	font-weight: 500;
	font-size: 14px;
	color: #edf0f1;
	text-decoration:none;
}
header{
	display:flex;
	justify-content: space-between;
	align-items:center;
	padding:30px 5%;
}

.logo {
	cursor:pointer;
}

.nav_links{
	list-style:none;
}

.nav_links li{
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
	padding: 9px 25px;
	background-color: rgba(100,149,237,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

button:hover{
	background-color: rgba(65,105,225,0.8);
}

.b2{
   margin-left: 10px;
	padding: 9px 25px;
	background-color: rgba(205,92,92,1);
	border: none;
	border-radius: 50px;
	cursor:pointer;
	transition: all 0.3s ease 0s;
}

.b2:hover{
	background-color: rgba(178,34,34,0.8);
}
</style>
</head>
<body>
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
<br/><br/><br/><br/><br/><br/><br/>
<button onclick="goBack()">Go Back</button>
<script>
function goBack() {
  window.history.back();
}
</script>
<a href="restaurant.jsp">Show all restaurants</a>
<% ArrayList<String> allcats=(ArrayList<String>) session.getAttribute("allcats"); %>
<div class="search">
<form action="RestaurantSearch" method="post" onsubmit="return sform(this)">
	Search by name:<input type="text" id="nm" placeholder="name" name="nm"/><br/>
	Search by category:<select id="ct" name="cat"/>
	<% for(String vl : allcats){ 
	if(vl.equals("Any")){%>
	<option value=<%=vl%> selected><%=vl%>
	<% }else{ %>
	<option value=<%=vl%> ><%=vl%>
	<% } }%>
	</select><br/>
	Choose opening hour:<select id="oh" name="oh">
	<option value="Anytime" selected>Anytime
	<option value="10">10AM
	<option value="11">11AM
	<option value="12">12PM
	</select><br/>
	Sort results:<select id="sr" name="sr">
	<option value="No" selected>No Sorting
	<option value="A-Z">A-Z
	<option value="Z-A">Z-A
	</select><br/>
	<input type="submit">
</form>
</div>
<div class="results">
<%

ArrayList<String> namelist=(ArrayList<String>) session.getAttribute("namelist");
ArrayList<String> serveslist=(ArrayList<String>) session.getAttribute("serves");
ArrayList<String> latlist=(ArrayList<String>) session.getAttribute("latlist");
ArrayList<String> lonlist=(ArrayList<String>) session.getAttribute("lonlist");
ArrayList<String> urlist=(ArrayList<String>) session.getAttribute("ur");
ArrayList<String> emaillist=(ArrayList<String>) session.getAttribute("email");
ArrayList<String> phonelist=(ArrayList<String>) session.getAttribute("phone");
ArrayList<String> addresslist=(ArrayList<String>) session.getAttribute("address");
ArrayList<String> descriptionlist=(ArrayList<String>) session.getAttribute("description");
ArrayList<String> ophlist=(ArrayList<String>) session.getAttribute("oph");
double lt=0.0;
double ln=0.0;
String temp=""; 
if(namelist==null)
	response.sendRedirect("restaurant.jsp");
if(namelist!=null)
if(namelist.get(0).matches("(.*)</TD>(.*)")){
%>
NO RESULTS
<% } else {
	%>
	<% 
	int k=0;
	for(String s : namelist){
		temp="Map"+s;
		String ur="";
		try{
		lt=Double.parseDouble(latlist.get(k));
		ln=Double.parseDouble(lonlist.get(k));
		}
		catch(NumberFormatException e){
			int i=1;
		}
	 %>
 Name: <%=s%> <br/>
<button onclick="mymap(<%=lt%>,<%=ln%>)">Show Map</button><br/>
<br/><div id="Map" style="height:150px;width=40%"></div><br/>
<% if(!serveslist.get(k).matches("(.*)</TD>(.*)")){ %>
Cuisine: <%=serveslist.get(k)%> <br/>
<% }if(!urlist.get(k).matches("(.*)</TD>(.*)")){ %>
URL: <a href=<%=urlist.get(k)%> ><%=urlist.get(k)%></a><br/>
<% }if(!emaillist.get(k).matches("(.*)</TD>(.*)")){ %>
email: <%=emaillist.get(k)%> <br/>
<% }if(!phonelist.get(k).matches("(.*)</TD>(.*)")){ %>
phone: <%=phonelist.get(k)%> <br/>
<% }if(!addresslist.get(k).matches("(.*)</TD>(.*)")){ %>
address: <%=addresslist.get(k)%> <br/>
<% }if(!descriptionlist.get(k).matches("(.*)</TD>(.*)")){ %>
description: <%=descriptionlist.get(k)%> <br/>
<% }if(!ophlist.get(k).matches("(.*)</TD>(.*)")){ %>
openingHours: <%=ophlist.get(k)%> <br/>
<br/>
<% }k++;}}  %>
</div>
<script src="OpenLayers.js"></script>
<script>
function mymap(lt,ln) {
    var lat            = lt;
    var lon            = ln;
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
}
</script>
<script>
  function sform() {
	  var name= document.getElementById("nm").value;
	  if(name==null)
		  name="";
	  var cat= document.getElementById("ct").value;
	  if(cat==null)
		  cat="";
	  var oh = document.getElementById("oh").value;
	  var sr = document.getElementById("sr").value;
      if (name=="" && oh=="Anytime" && sr=="No" && cat=="Any" ){ 
      	alert("Fill atleast one option to search");
   	  	return false;
      }
   	 return true;
  }

</script>
<%
session.removeAttribute("namelist");
session.removeAttribute("serves");
session.removeAttribute("latlist");
session.removeAttribute("lonlist");
session.removeAttribute("ur");
session.removeAttribute("email");
session.removeAttribute("phone");
session.removeAttribute("address");
session.removeAttribute("description");
session.removeAttribute("oph");
%>
</body>
</html>