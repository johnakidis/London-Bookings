import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import java.net.*; 
import java.nio.charset.StandardCharsets;
import java.util.*;


@WebServlet(urlPatterns = {"/IndexIntro"})
public class IndexIntro extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public IndexIntro() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	ArrayList<String> name=new ArrayList<String>();
    	ArrayList<String> serves=new ArrayList<String>();
    	ArrayList<String> lat=new ArrayList<String>();
    	ArrayList<String> lon=new ArrayList<String>();
    	ArrayList<String> ur=new ArrayList<String>();
    	ArrayList<String> email=new ArrayList<String>();
    	ArrayList<String> telephone=new ArrayList<String>();
    	ArrayList<String> address=new ArrayList<String>();
    	ArrayList<String> description=new ArrayList<String>();
    	ArrayList<String> openingHours=new ArrayList<String>();
    	ArrayList<String> checkin=new ArrayList<String>();
    	ArrayList<String> checkout=new ArrayList<String>();
    	ArrayList<String> stars=new ArrayList<String>();
    	ArrayList<String> rooms=new ArrayList<String>();
    	ArrayList<String> pets=new ArrayList<String>();
    	
    	try {
    	String qr="PREFIX schema: <https://schema.org/>  \r\n" + 
    			"PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n" + 
    			"\r\n" + 
    			"SELECT ?name (SAMPLE(?lat) as ?lat) (SAMPLE(?lon) as ?lon) (SAMPLE(?url) as ?url) (SAMPLE(?email) as ?email) (SAMPLE(?telephone) as ?telephone) (SAMPLE(?address) as ?address) (SAMPLE(?description) as ?description) (SAMPLE(?checkinTime) as ?checkinTime) (SAMPLE(?checkoutTime) as ?checkoutTime) (SAMPLE(?starRating) as ?starRating) (SAMPLE(?numberofRooms) as ?numberofRooms) (SAMPLE(?petsAllowed) as ?petsAllowed)\r\n" + 
    			"WHERE {\r\n" + 
    			" ?x schema:Place \"Hotel\" .\r\n" + 
    			" ?x schema:name ?name .\r\n" + 
    			" ?x geo:lat ?lat .\r\n" + 
    			" ?x geo:lon ?lon .\r\n" + 
    			" ?x schema:checkinTime ?checkinTime .\r\n" + 
    			" ?x schema:checkoutTime ?checkoutTime .\r\n" + 
    			" ?x schema:starRating ?starRating .\r\n" + 
    			" ?x schema:petsAllowed ?petsAllowed .\r\n" + 
    			" ?x schema:numberofRooms ?numberofRooms .\r\n" + 
    			" OPTIONAL { ?x schema:url ?url } .\r\n" + 
    			" OPTIONAL { ?x schema:email ?email } . \r\n" + 
    			" OPTIONAL { ?x schema:telephone ?telephone } . \r\n" + 
    			" OPTIONAL { ?x schema:address ?address } . \r\n" + 
    			" OPTIONAL { ?x schema:description ?description } . \r\n" + 
    			"}\r\n" + 
    			"GROUP BY ?name \r\n LIMIT 6\r\n";
    	URL url=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr,StandardCharsets.UTF_8.toString()));
    	URLConnection con=url.openConnection();
    	con.setConnectTimeout(5000);
    	con.setReadTimeout(5000);
    	BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
    	String inline;
    	openingHours.add("a");
    	openingHours.add("a");
    	openingHours.add("a");
    	serves.add("a");
    	serves.add("a");
    	serves.add("a");
    	int first=0;
    	int flag=0;
    	while(true){
    		if(flag==1)
    			break;
    		inline=in.readLine();
    		if(inline==null)
    			break;
    		if(first==0) {
    			//if(inline.matches("(.*)<TR>(.*)"))
    			//	System.out.println(inline);
    			first=1;
    			while(true) {
    				inline=in.readLine();
    				if(inline==null)
    					break;
    				if(inline.matches("(.*)</TR>(.*)"))
        				break;
    			}
    	
    		}
    		else {
    			if(inline.matches("(.*)<TR>(.*)")) {
    				while(true) {
    					//class
    					inline=in.readLine();
    					//name
    					inline=in.readLine();
    					StringTokenizer stk=new StringTokenizer(inline,"\"");
    					name.add(stk.nextToken());
    					//class
    					inline=in.readLine();
    					//lat
    					inline=in.readLine();
    					StringTokenizer stk_1=new StringTokenizer(inline,"\"");
    					lat.add(stk_1.nextToken());
    					//class
    					inline=in.readLine();
    					//lon
    					inline=in.readLine();
    					StringTokenizer stk_2=new StringTokenizer(inline,"\"");
    					lon.add(stk_2.nextToken());
    					//class
    					inline=in.readLine();
    					//url
    					inline=in.readLine();
    					StringTokenizer stk_3=new StringTokenizer(inline,"\"");
    					if(stk_3.hasMoreTokens())
    						ur.add(stk_3.nextToken());
    					else
    						ur.add("#");
    					//class
    					inline=in.readLine();
    					//email
    					inline=in.readLine();
    					StringTokenizer stk_4=new StringTokenizer(inline,"\"");
    					if(stk_4.hasMoreTokens())
    						email.add(stk_4.nextToken());
    					else
    						email.add("#");
    					//class
    					inline=in.readLine();
    					//phone
    					inline=in.readLine();
    					StringTokenizer stk_5=new StringTokenizer(inline,"\"");
    					if(stk_5.hasMoreTokens())
    						telephone.add(stk_5.nextToken());
    					else
    						telephone.add("#");
    					//class
    					inline=in.readLine();
    					//address
    					inline=in.readLine();
    					StringTokenizer stk_6=new StringTokenizer(inline,"\"");
    					if(stk_6.hasMoreTokens())
    						address.add(stk_6.nextToken());
    					else
    						address.add("#");
    					//class
    					inline=in.readLine();
    					//description
    					inline=in.readLine();
    					StringTokenizer stk_7=new StringTokenizer(inline,"\"");
    					if(stk_7.hasMoreTokens())
    						description.add(stk_7.nextToken());
    					else
    						description.add("#");
    					//class
    					inline=in.readLine();
    					//checking
    					inline=in.readLine();
    					StringTokenizer stk_8=new StringTokenizer(inline,"\"");
    					if(stk_8.hasMoreTokens())
    						checkin.add(stk_8.nextToken());
    					else
    						checkout.add("#");
    					//class
    					inline=in.readLine();
    					//checkout
    					inline=in.readLine();
    					StringTokenizer stk_9=new StringTokenizer(inline,"\"");
    					if(stk_9.hasMoreTokens())
    						checkout.add(stk_9.nextToken());
    					else
    						checkout.add("#");
    					//class
    					inline=in.readLine();
    					//stars
    					inline=in.readLine();
    					StringTokenizer stk_10=new StringTokenizer(inline,"\"");
    					if(stk_10.hasMoreTokens())
    						stars.add(stk_10.nextToken());
    					else
    						stars.add("#");
    					//class
    					inline=in.readLine();
    					//rooms
    					inline=in.readLine();
    					StringTokenizer stk_11=new StringTokenizer(inline,"\"");
    					if(stk_11.hasMoreTokens())
    						rooms.add(stk_11.nextToken());
    					else
    						rooms.add("#");
    					//class
    					inline=in.readLine();
    					//pets
    					inline=in.readLine();
    					StringTokenizer stk_12=new StringTokenizer(inline,"\"");
    					if(stk_12.hasMoreTokens())
    						pets.add(stk_12.nextToken());
    					else
    						pets.add("#");
    					//</tr>
    					inline=in.readLine();
    					if(inline==null)
    						break;
    					if(inline.matches("(.*)</TR>(.*)"))
            				break;
    				}
    			}
    		}
    	}
    	in.close();
    	}catch(ConnectException | UnknownHostException ex) {
    		int p=2;
    		p=p+1;
    	}
    	// rest
    	try {
    	String qr="PREFIX schema: <https://schema.org/>  \r\n" + 
    			"PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n" + 
    			"\r\n" + 
    			"SELECT  ?name (SAMPLE(?servesCuisine) as ?servesCuisine) (SAMPLE(?lat) as ?lat) (SAMPLE(?lon) as ?lon) (SAMPLE(?url) as ?url) (SAMPLE(?email) as ?email) (SAMPLE(?telephone) as ?telephone) (SAMPLE(?address) as ?address) (SAMPLE(?description) as ?description) (SAMPLE(?openingHours) as ?openingHours)\r\n" + 
    			"WHERE {\r\n" + 
    			" ?x schema:Place \"Restaurant\" .\r\n" + 
    			" ?x schema:name ?name .\r\n" + 
    			" ?x geo:lat ?lat .\r\n" + 
    			" ?x geo:lon ?lon .\r\n" + 
    			" ?x schema:servesCuisine ?servesCuisine .\r\n" +
    			" OPTIONAL { ?x schema:url ?url } .\r\n" + 
    			" OPTIONAL { ?x schema:email ?email } . \r\n" + 
    			" OPTIONAL { ?x schema:telephone ?telephone } . \r\n" + 
    			" OPTIONAL { ?x schema:address ?address } . \r\n" + 
    			" OPTIONAL { ?x schema:description ?description } . \r\n" + 
    			" OPTIONAL { ?x schema:openingHours ?openingHours }\r\n" + 
    			"} GROUP BY ?name\r\n LIMIT 3\r\n";
    	URL url=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr,StandardCharsets.UTF_8.toString()));
    	URLConnection con=url.openConnection();
    	con.setConnectTimeout(5000);
    	con.setReadTimeout(5000);
    	BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
    	String inline;
    	int first=0;
    	int flag=0;
    	while(true){
    		if(flag==1)
    			break;
    		inline=in.readLine();
    		if(inline==null)
    			break;
    		if(first==0) {
    			//if(inline.matches("(.*)<TR>(.*)"))
    			//	System.out.println(inline);
    			first=1;
    			while(true) {
    				inline=in.readLine();
    				if(inline==null)
    					break;
    				if(inline.matches("(.*)</TR>(.*)"))
        				break;
    			}
    	
    		}
    		else {
    			if(inline.matches("(.*)<TR>(.*)")) {
    				while(true) {
    					//class
    					inline=in.readLine();
    					//name
    					inline=in.readLine();
    					StringTokenizer stk=new StringTokenizer(inline,"\"");
    					name.add(stk.nextToken());
    					//class
    					inline=in.readLine();
    					//cuisine
    					inline=in.readLine();
    					StringTokenizer stk_0=new StringTokenizer(inline,"\"");
    					serves.add(stk_0.nextToken());
    					//class
    					inline=in.readLine();
    					//lat
    					inline=in.readLine();
    					StringTokenizer stk_1=new StringTokenizer(inline,"\"");
    					lat.add(stk_1.nextToken());
    					//class
    					inline=in.readLine();
    					//lon
    					inline=in.readLine();
    					StringTokenizer stk_2=new StringTokenizer(inline,"\"");
    					lon.add(stk_2.nextToken());
    					//class
    					inline=in.readLine();
    					//url
    					inline=in.readLine();
    					StringTokenizer stk_3=new StringTokenizer(inline,"\"");
    					if(stk_3.hasMoreTokens())
    						ur.add(stk_3.nextToken());
    					else
    						ur.add("#");
    					//class
    					inline=in.readLine();
    					//email
    					inline=in.readLine();
    					StringTokenizer stk_4=new StringTokenizer(inline,"\"");
    					if(stk_4.hasMoreTokens())
    						email.add(stk_4.nextToken());
    					else
    						email.add("#");
    					//class
    					inline=in.readLine();
    					//phone
    					inline=in.readLine();
    					StringTokenizer stk_5=new StringTokenizer(inline,"\"");
    					if(stk_5.hasMoreTokens())
    						telephone.add(stk_5.nextToken());
    					else
    						telephone.add("#");
    					//class
    					inline=in.readLine();
    					//address
    					inline=in.readLine();
    					StringTokenizer stk_6=new StringTokenizer(inline,"\"");
    					if(stk_6.hasMoreTokens())
    						address.add(stk_6.nextToken());
    					else
    						address.add("#");
    					//class
    					inline=in.readLine();
    					//description
    					inline=in.readLine();
    					StringTokenizer stk_7=new StringTokenizer(inline,"\"");
    					if(stk_7.hasMoreTokens())
    						description.add(stk_7.nextToken());
    					else
    						description.add("#");
    					//class
    					inline=in.readLine();
    					//oh
    					inline=in.readLine();
    					StringTokenizer stk_8=new StringTokenizer(inline,"\"");
    					if(stk_8.hasMoreTokens())
    						openingHours.add(stk_8.nextToken());
    					else
    						openingHours.add("#");
    					//</tr>
    					inline=in.readLine();
    					if(inline==null)
    						break;
    					if(inline.matches("(.*)</TR>(.*)"))
            				break;
    				}
    			}
    		}
    	}
    	in.close();
    	}catch(ConnectException | UnknownHostException ex) {
    		int i=2;
    		i=i+1;
    	}
    	
    	//
    	for(int i=0;i<5;i++) {
    	try {
    		String ntp="";
    	if(i==0) {
    		ntp="Park";
    	}
    	else if(i==1) {
    		ntp="Museum";
    	}
    	else if(i==2) {
    		ntp="Cinema";
    		}
    	else if(i==3) {
    		ntp="Hospital";
    	}
    	else if(i==4) {
    		ntp="Casino";
    	}
    	String qr="PREFIX schema: <https://schema.org/>  \r\n" + 
    			"PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n" + 
    			"\r\n" + 
    			"SELECT  ?name (SAMPLE(?lat) as ?lat) (SAMPLE(?lon) as ?lon) (SAMPLE(?url) as ?url) (SAMPLE(?email) as ?email) (SAMPLE(?telephone) as ?telephone) (SAMPLE(?address) as ?address) (SAMPLE(?description) as ?description) (SAMPLE(?openingHours) as ?openingHours)\r\n" + 
    			"WHERE {\r\n" + 
    			" ?x schema:Place \"" +ntp+"\" .\r\n" + 
    			" ?x schema:name ?name .\r\n" + 
    			" ?x geo:lat ?lat .\r\n" + 
    			" ?x geo:lon ?lon .\r\n" + 
    			" OPTIONAL { ?x schema:url ?url } .\r\n" + 
    			" OPTIONAL { ?x schema:email ?email } . \r\n" + 
    			" OPTIONAL { ?x schema:telephone ?telephone } . \r\n" + 
    			" OPTIONAL { ?x schema:address ?address } . \r\n" + 
    			" OPTIONAL { ?x schema:description ?description } . \r\n" + 
    			" OPTIONAL { ?x schema:openingHours ?openingHours }\r\n" + 
    			"} GROUP BY ?name\r\n LIMIT 3\r\n";
    	URL url=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr,StandardCharsets.UTF_8.toString()));
    	URLConnection con=url.openConnection();
    	con.setConnectTimeout(5000);
    	con.setReadTimeout(5000);
    	BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
    	String inline;
    	int first=0;
    	int flag=0;
    	while(true){
    		if(flag==1)
    			break;
    		inline=in.readLine();
    		if(inline==null)
    			break;
    		if(first==0) {
    			//if(inline.matches("(.*)<TR>(.*)"))
    			//	System.out.println(inline);
    			first=1;
    			while(true) {
    				inline=in.readLine();
    				if(inline==null)
    					break;
    				if(inline.matches("(.*)</TR>(.*)"))
        				break;
    			}
    	
    		}
    		else {
    			if(inline.matches("(.*)<TR>(.*)")) {
    				while(true) {
    					//class
    					inline=in.readLine();
    					//name
    					inline=in.readLine();
    					StringTokenizer stk=new StringTokenizer(inline,"\"");
    					name.add(stk.nextToken());
    					//class
    					inline=in.readLine();
    					//lat
    					inline=in.readLine();
    					StringTokenizer stk_1=new StringTokenizer(inline,"\"");
    					lat.add(stk_1.nextToken());
    					//class
    					inline=in.readLine();
    					//lon
    					inline=in.readLine();
    					StringTokenizer stk_2=new StringTokenizer(inline,"\"");
    					lon.add(stk_2.nextToken());
    					//class
    					inline=in.readLine();
    					//url
    					inline=in.readLine();
    					StringTokenizer stk_3=new StringTokenizer(inline,"\"");
    					if(stk_3.hasMoreTokens())
    						ur.add(stk_3.nextToken());
    					else
    						ur.add("#");
    					//class
    					inline=in.readLine();
    					//email
    					inline=in.readLine();
    					StringTokenizer stk_4=new StringTokenizer(inline,"\"");
    					if(stk_4.hasMoreTokens())
    						email.add(stk_4.nextToken());
    					else
    						email.add("#");
    					//class
    					inline=in.readLine();
    					//phone
    					inline=in.readLine();
    					StringTokenizer stk_5=new StringTokenizer(inline,"\"");
    					if(stk_5.hasMoreTokens())
    						telephone.add(stk_5.nextToken());
    					else
    						telephone.add("#");
    					//class
    					inline=in.readLine();
    					//address
    					inline=in.readLine();
    					StringTokenizer stk_6=new StringTokenizer(inline,"\"");
    					if(stk_6.hasMoreTokens())
    						address.add(stk_6.nextToken());
    					else
    						address.add("#");
    					//class
    					inline=in.readLine();
    					//description
    					inline=in.readLine();
    					StringTokenizer stk_7=new StringTokenizer(inline,"\"");
    					if(stk_7.hasMoreTokens())
    						description.add(stk_7.nextToken());
    					else
    						description.add("#");
    					//class
    					inline=in.readLine();
    					//oh
    					inline=in.readLine();
    					StringTokenizer stk_8=new StringTokenizer(inline,"\"");
    					if(stk_8.hasMoreTokens())
    						openingHours.add(stk_8.nextToken());
    					else
    						openingHours.add("#");
    					//</tr>
    					inline=in.readLine();
    					if(inline==null)
    						break;
    					if(inline.matches("(.*)</TR>(.*)"))
            				break;
    				}
    			}
    		}
    	}
    	in.close();
    	}catch(ConnectException | UnknownHostException ex) {
    		int j=2;
    		j=j+1;
    	}
    	} //for
    	request.getSession().setAttribute("intro","done");
    	request.getSession().setAttribute("namelist",name);
    	request.getSession().setAttribute("serves",serves);
    	request.getSession().setAttribute("latlist",lat);
    	request.getSession().setAttribute("lonlist",lon);
    	request.getSession().setAttribute("ur",ur);
    	request.getSession().setAttribute("email",email);
    	request.getSession().setAttribute("phone",telephone);
    	request.getSession().setAttribute("address",address);
    	request.getSession().setAttribute("description",description);
    	request.getSession().setAttribute("oph",openingHours);
    	request.getSession().setAttribute("checkin",checkin);
    	request.getSession().setAttribute("checkout",checkout);
    	request.getSession().setAttribute("stars",stars);
    	request.getSession().setAttribute("pets",pets);
    	request.getSession().setAttribute("rooms",rooms);
    	response.sendRedirect("indexp.jsp");
    }
}
