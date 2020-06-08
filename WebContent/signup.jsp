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
<title>Sign-up</title>
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
	background-color: #F0F8FF;
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
	background-color: #F0F8FF;
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
  display: flex;
  flex-wrap: wrap;
  padding-left: 20px;
}
.child {
  list-style: none;
  flex: 0 0 33.333333%;
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
<% if(session.getAttribute("user")!=null){ 
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
<script type="text/javascript"> alert("This username is taken. Please try again!");</script>
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
<div class="signupf">
<h2> Create an account <img border="0"  src="img/acc.png" width="20" height="20"></h2>
<form id="ex" action="SignupServlet" method="post" onsubmit="return sform(this)">
	<input type="text" placeholder="Username" name="usr" maxlength="20" required/> <br/>
	<input type="email" placeholder="Email" name="email" maxlength="20" required/> <br/>
	<input type="password" placeholder="Password" id="pass" name="pwd" minlength="5" maxlength="20" required/> <br/>
	<input type="password" placeholder="Re-type Password" name="pwd2" id="repass"minlength="5"  maxlength="20" required/> <br/>
	<input type="text" placeholder="First Name" name="nm" maxlength="20"  required/> <br/>
	<input type="text" placeholder="Last Name" name="snm" maxlength="20"  required/> <br/>
	<input type="text" placeholder="Phone" name="phone" maxlength="20" required/> <br/> <br/>
	<button type="submit" value="Submit">Create account</button>
</form>
</div>
</div>
<script>
  function sform() {
	  var pass = document.getElementById("pass").value;
	  var repass = document.getElementById("repass").value;
	  if(pass!=repass){
		  alert("Passwords must match");
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
</body>
</html>
