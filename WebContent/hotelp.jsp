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
<a href="hotel.jsp">Show all hotels</a>
<div class="search">
<form action="HotelSearch" method="post" onsubmit="return sform(this)">
	Search by name:<input type="text" id="nm" placeholder="name" name="nm"/><br/>
	Choose checkin hour:<select id="chin" name="chin">
	<option value="Anytime" selected>Anytime
	<option value="9">9AM
	<option value="10">10AM
	<option value="11">11AMM
	</select><br/>
	Choose checkout hour:<select id="chout" name="chout">
	<option value="Anytime" selected>Anytime
	<option value="9">9AM
	<option value="10">10AM
	<option value="11">11AM
	</select><br/>
	Do you want pets?<select id="pts" name="pts">
	<option value="Anytime" selected>None
	<option value="Yes">Yes
	<option value="No">No
	</select><br/>
	Star rating atleast:<select id="str" name="stR">
	<option value="Anytime" selected>Any Rating
	<option value="1">1
	<option value="2">2
	<option value="3">3
	<option value="4">4
	<option value="4">5
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
NO RESULTS
<% } else {
	%>
	<% 
	int k=0;
	for(String s : namelist){
		temp="Map"+s;
		String ur="";
		lt=Double.parseDouble(latlist.get(k));
		ln=Double.parseDouble(lonlist.get(k));
	 %>
 Name: <%=s%> <br/>
<button onclick="mymap(<%=lt%>,<%=ln%>)">Show Map</button><br/>
<br/><div id="Map" style="height:150px;width=40%"></div><br/>
<% if(!urlist.get(k).matches("(.*)</TD>(.*)")){ %>
URL: <a href=<%=urlist.get(k)%> ><%=urlist.get(k)%></a><br/>
<% }if(!emaillist.get(k).matches("(.*)</TD>(.*)")){ %>
email: <%=emaillist.get(k)%> <br/>
<% }if(!phonelist.get(k).matches("(.*)</TD>(.*)")){ %>
phone: <%=phonelist.get(k)%> <br/>
<% }if(!addresslist.get(k).matches("(.*)</TD>(.*)")){ %>
address: <%=addresslist.get(k)%> <br/>
<% }if(!descriptionlist.get(k).matches("(.*)</TD>(.*)")){ %>
description: <%=descriptionlist.get(k)%> <br/>
<% }if(!petslist.get(k).matches("(.*)</TD>(.*)")){ %>
PetsAllowed: <%=petslist.get(k)%> <br/>
<% }if(!checkinlist.get(k).matches("(.*)</TD>(.*)")){ %>
checkinTime: <%=checkinlist.get(k)%> <br/>
<% }if(!checkoutlist.get(k).matches("(.*)</TD>(.*)")){ %>
checkoutTime: <%=checkoutlist.get(k)%> <br/>
<% }if(!roomslist.get(k).matches("(.*)</TD>(.*)")){ %>
rooms: <%=roomslist.get(k)%> <br/>
<% }if(!starslist.get(k).matches("(.*)</TD>(.*)")){ %>
stars: <%=starslist.get(k)%> <br/>
<br/>
<% }k++; %>
<% if(session.getAttribute("user")!=null){ %>
<div id="hotel">
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
Book:<input type="Submit" />
</form>
</div>
<% } %>
<% }}  %>
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