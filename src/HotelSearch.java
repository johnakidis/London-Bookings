import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import java.net.*; 
import java.nio.charset.StandardCharsets;
import java.util.*;


@WebServlet(urlPatterns = {"/HotelSearch"})
public class HotelSearch extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public HotelSearch() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       	try {
        int count=0;
    	String nam=request.getParameter("nm");
       	String nm="";
       	if(nam!=null) {
       		nm="FILTER regex(str(?name),\".*"+nam+".*\",\"i\") .";
       	}
       	else {
       		count++;
       	}
       	String sr=request.getParameter("sr");
       	String s="";
       	if(!sr.equals("No")) {
       		if(sr.equals("A-Z")) {
       			s="ORDER BY ASC(?name)";
       		}
       		else {
       			s="ORDER BY DESC(?name)";
       		}
       	}
       	else {
       		count++;
       	}
       	String chin=request.getParameter("chin");
       	String cin="";
       	if(!chin.equals("Anytime")){
       		int val=Integer.parseInt(chin);
       		cin="FILTER ( ?checkinTime = "+val+" ) .";
       	}
       	else {
       		count++;
       	}
       	String chout=request.getParameter("chout");
       	String cout="";
       	if(!chout.equals("Anytime")){
       		int val=Integer.parseInt(chout);
       		cout="FILTER ( ?checkoutTime = "+val+" ) .";
       	}
       	else {
       		count++;
       	}
       	String pts=request.getParameter("pts");
       	String pt="";
       	if(!pts.equals("Anytime")) {
       		pt="FILTER regex(str(?petsAllowed),\".*"+pts+".*\") .";
       	}
       	else {
       		count++;
       	}
       	String stR=request.getParameter("stR");
       	String srg="";
       	if(!stR.equals("Anytime")){
       		int val=Integer.parseInt(stR);
       		srg="FILTER ( ?starRating >= "+val+" ) .";
       	}
       	else {
       		count++;
       	}
       	if(count==6)
       		response.sendRedirect("index.jsp");
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
    			nm + "\r\n" + pt +"\r\n" + cin + "\r\n" + cout + "\r\n" + srg + "\r\n" +
    			"}\r\n" + 
    			"GROUP BY ?name\r\n"+s;
    	URL url=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr,StandardCharsets.UTF_8.toString()));
    	URLConnection con=url.openConnection();
    	con.setConnectTimeout(5000);
    	con.setReadTimeout(5000);
    	BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
    	String inline;
    	ArrayList<String> name=new ArrayList<String>();
    	ArrayList<String> lat=new ArrayList<String>();
    	ArrayList<String> lon=new ArrayList<String>();
    	ArrayList<String> ur=new ArrayList<String>();
    	ArrayList<String> email=new ArrayList<String>();
    	ArrayList<String> telephone=new ArrayList<String>();
    	ArrayList<String> address=new ArrayList<String>();
    	ArrayList<String> description=new ArrayList<String>();
    	ArrayList<String> checkin=new ArrayList<String>();
    	ArrayList<String> checkout=new ArrayList<String>();
    	ArrayList<String> stars=new ArrayList<String>();
    	ArrayList<String> rooms=new ArrayList<String>();
    	ArrayList<String> pets=new ArrayList<String>();
    	int first=0;
    	while(true){
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
    	request.getSession().setAttribute("from","load");
    	request.getSession().setAttribute("namelist",name);
    	request.getSession().setAttribute("latlist",lat);
    	request.getSession().setAttribute("lonlist",lon);
    	request.getSession().setAttribute("ur",ur);
    	request.getSession().setAttribute("email",email);
    	request.getSession().setAttribute("phone",telephone);
    	request.getSession().setAttribute("address",address);
    	request.getSession().setAttribute("description",description);
    	request.getSession().setAttribute("checkin",checkin);
    	request.getSession().setAttribute("checkout",checkout);
    	request.getSession().setAttribute("stars",stars);
    	request.getSession().setAttribute("pets",pets);
    	request.getSession().setAttribute("rooms",rooms);
    	in.close();
    	response.sendRedirect("hotelp.jsp");
       	}catch(ConnectException | UnknownHostException ex) {
    		response.sendRedirect("index.jsp");
    	}
    }
}
