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
<title>My Bookings</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
* {
	box-sizing: border-box;
}

 .signupf{
 background-color: #24252A;
 max-width:400px;
 border-radius:20px;
 margin:auto;
 box-sizing:border-box;
 font-family:"Montserrat",sans-serirf;
 font-weight: 500;
 font-size: 12px;
 color: #edf0f1;
 padding:40px;
 margin-top:100px;
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
   margin-left:0px;
	padding: 5px 12px;
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
<% if(session.getAttribute("user")==null){ 
	response.sendRedirect("index.jsp");
} %>
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
<div class="data">
<h2>Past bookings</h2>
<% java.sql.Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
   Statement statement=conn.createStatement();
   String cur=(String)session.getAttribute("user");
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   String start="https://www.openstreetmap.org/?mlat=";
   int k=0;
   String mid="&mlon=";
   String end="&zoom=15";
   Date dt=new Date();
   double lt=0.0;
   double ln=0.0;
   String all="";
   boolean flag=false;
   ResultSet rs=statement.executeQuery("SELECT * FROM bookings WHERE username='"+cur+"' "); 
   if(rs.isBeforeFirst()){
	   %>
	   
	   <div class="parent">
	   <% 
	   flag=true;
   }
   while(rs.next()){ 
	    k++;
	    String tos=Integer.toString(k);
		String idd="Map"+tos;
   		String enddate=rs.getString("edate");
   		Date edf=sdf.parse(enddate);
   		lt=Double.valueOf(rs.getString("lat"));
   		ln=Double.valueOf(rs.getString("lon"));
   		int rating=Integer.parseInt(rs.getString("rating"));
   		int idf=Integer.parseInt(rs.getString("id"));
   		all=start+lt+mid+ln+end;
   		if(!dt.after(edf))
   			continue;
 	   %>
 	   
 	   <div class="child">
 	   <div class="cht">
 	   <% 
   %> 
   <div class="bookings" id="old">
    <h3> <%=rs.getString("name")%> </h3><br/>
    <a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
   People : <%=rs.getString("people")%> <br/>
   Starting date : <%=rs.getString("sdate")%> <br/>
   Ending date : <%=rs.getString("edate")%> <br/>
   <% if(rating>0) {%>
   <% int starval=rating; 
for(int sv=1;sv<=starval;sv++){ %>
<span class="fa fa-star checked"></span>
<% } 
for(int sv=starval+1;sv<=5;sv++){ %>
<span class="fa fa-star"></span>
<% } %>
<br/>
   <% } else{ %>
   
   <form action="UpdateRating" method="post">
    <input type="hidden" id="id" name="id" value=<%=idf%> required>
	<input type="range" id="vol" name="rate" min="1" max="5" list="tick" required> 
	<datalist id="tick">
	<option value="1" label="1"></option>
	<option value="2" label="2"></option>
	<option value="3" label="3"></option>
	<option value="4" label="4"></option>
	<option value="5" label="5"></option>
	</datalist>
	<br/><button class="b3" type="submit" value="Submit">Rate</button>
   </form>
   <% } %>
  <br/><button class="b3" id="mbt" onclick="mymap(<%=lt%>,<%=ln%>,<%=tos%>);this.disabled = true;">Show Map</button> 
<div id=<%=idd%> style="height:100px;width:375px"></div>
   </div>
   </div>
   </div>
   <% } conn.close();
 if(flag){ %>
 
</div>
<% flag=false;} %>
<h2>Current bookings </h2> 
<% java.sql.Connection conn2=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
   Statement statement2=conn2.createStatement();
   ResultSet rs2=statement2.executeQuery("SELECT * FROM bookings WHERE username='"+cur+"' "); 
   if(rs2.isBeforeFirst()){
	   %>
	   <div class="parent">
	   <% 
	   flag=true;
   }
   while(rs2.next()){ 
	   k++;
	    String tos=Integer.toString(k);
		String idd="Map"+tos;
   		String enddate=rs2.getString("edate");
   		String startdate=rs2.getString("sdate");
   		Date edf=sdf.parse(enddate);
   		Date stdf=sdf.parse(startdate);
   		lt=Double.valueOf(rs2.getString("lat"));
   		ln=Double.valueOf(rs2.getString("lon"));
   		int rating=Integer.parseInt(rs2.getString("rating"));
   		int idf=Integer.parseInt(rs2.getString("id"));
   		all=start+lt+mid+ln+end;
   		if((dt.after(stdf))&&(dt.before(edf))){
   		   %>
   		   <div class="child">
   		   <div class="cht">
   		   <% 
   			
   %> 
   <div class="bookings" id="cur">
   <h3> <%=rs2.getString("name")%> </h3><br/>
   <a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
   People : <%=rs2.getString("people")%> <br/>
   Starting date : <%=rs2.getString("sdate")%> <br/>
   Ending date : <%=rs2.getString("edate")%> <br/> <br/> 
   <button class="b3" id="mbt" onclick="mymap(<%=lt%>,<%=ln%>,<%=tos%>);this.disabled = true;">Show Map</button>
<div id=<%=idd%> style="height:100px;width:375px"></div>
   </div>
   </div>
   </div>
   <% } %>
   <%	} conn2.close();
   if(flag){ %>
  
   </div>
   <% flag=false;} %>
<h2>Future bookings</h2> 
<% java.sql.Connection conn3=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
   Statement statement3=conn3.createStatement();
   ResultSet rs3=statement3.executeQuery("SELECT * FROM bookings WHERE username='"+cur+"' "); 
   if(rs3.isBeforeFirst()){
	   %>
	   <div class="parent">
	   <% 
	   flag=true;
   }
   while(rs3.next()){ 
	   k++;
	    String tos=Integer.toString(k);
		String idd="Map"+tos;
   		String enddate=rs3.getString("edate");
   		String startdate=rs3.getString("sdate");
   		Date edf=sdf.parse(enddate);
   		Date stdf=sdf.parse(startdate);
   		lt=Double.valueOf(rs3.getString("lat"));
   		ln=Double.valueOf(rs3.getString("lon"));
   		int rating=Integer.parseInt(rs3.getString("rating"));
   		int idf=Integer.parseInt(rs3.getString("id"));
   		all=start+lt+mid+ln+end;
   		if(dt.before(stdf)){
   		   %>
   		   <div class="child">
   		   <div class="cht">
   		   <% 
   			
   %> 
   <div class="bookings" id="fut">
   <h3> <%=rs3.getString("name")%> </h3><br/>
   <a class="ur"target="_blank" href=<%=all%> >Map</a><br/>
   People : <%=rs3.getString("people")%> <br/>
   Starting date : <%=rs3.getString("sdate")%> <br/>
   Ending date : <%=rs3.getString("edate")%> <br/>
   <br/>
   <button class="b3" id="mbt" onclick="mymap(<%=lt%>,<%=ln%>,<%=tos%>);this.disabled = true;">Show Map</button> 
<div id=<%=idd%> style="height:100px;width:375px"></div>
   <form action="CancelBooking" method="post">
    <input type="hidden" id="id" name="id" value=<%=idf%> required><br/>
	<button class="b2" type="submit" value="Submit">Cancel Reservation</button>
   </form>

   </div>
   </div>
   </div>
   <% } %>
   <%	} conn3.close();
   if(flag){ %>
   </div>
   <% flag=false;} %>
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