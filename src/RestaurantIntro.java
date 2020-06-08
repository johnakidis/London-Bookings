import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import java.net.*; 
import java.nio.charset.StandardCharsets;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.*;


@WebServlet(urlPatterns = {"/restaurant.jsp"})
public class RestaurantIntro extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public RestaurantIntro() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
    			"} GROUP BY ?name\r\n LIMIT 30 \r\n";
    	URL url=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr,StandardCharsets.UTF_8.toString()));
    	URLConnection con=url.openConnection();
    	con.setConnectTimeout(5000);
    	con.setReadTimeout(5000);
    	BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
    	String inline;
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
    	request.getSession().setAttribute("from","load");
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
    	in.close();
    	String qr_2="PREFIX schema: <https://schema.org/>  \r\n" + 
    			"PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n" + 
    			"\r\n" + 
    			"SELECT DISTINCT ?name\r\n" + 
    			"WHERE{\r\n" + 
    			"?x schema:servesCuisine ?name .\r\n" + 
    			"}";
    	URL url_2=new URL("http://localhost:8090/strabon-endpoint-3.3.2-SNAPSHOT/Query?query="+URLEncoder.encode(qr_2,StandardCharsets.UTF_8.toString()));
    	URLConnection con_2=url_2.openConnection();
    	con_2.setConnectTimeout(5000);
    	con_2.setReadTimeout(5000);
    	BufferedReader in_2=new BufferedReader(new InputStreamReader(con_2.getInputStream()));
    	String inline_2;
    	ArrayList<String> allcats=new ArrayList<String>();
    	allcats.add("Any");
    	int first_2=0;
    	int flag_2=0;
    	while(true){
    		if(flag_2==1)
    			break;
    		inline_2=in_2.readLine();
    		if(inline_2==null)
    			break;
    		if(first_2==0) {
    			//if(inline.matches("(.*)<TR>(.*)"))
    			//	System.out.println(inline);
    			first_2=1;
    			while(true) {
    				inline_2=in_2.readLine();
    				if(inline_2==null)
    					break;
    				if(inline_2.matches("(.*)</TR>(.*)"))
        				break;
    			}
    	
    		}
    		else {
    			if(inline_2.matches("(.*)<TR>(.*)")) {
    				while(true) {
    					//class
    					inline_2=in_2.readLine();
    					//name
    					inline_2=in_2.readLine();
    					StringTokenizer stk=new StringTokenizer(inline_2,"\"");
    					allcats.add(stk.nextToken());
    					inline_2=in_2.readLine();
    					if(inline_2==null)
    						break;
    					if(inline_2.matches("(.*)</TR>(.*)"))
            				break;
    				}
    			}
    		}
    	}
    	in_2.close();
    	request.getSession().setAttribute("allcats",allcats);
    	response.sendRedirect("restaurantp.jsp");
    	}catch(ConnectException | UnknownHostException ex) {
    		response.sendRedirect("index.jsp");
    	}
    }
}
