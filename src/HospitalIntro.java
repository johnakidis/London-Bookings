import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import java.net.*; 
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.*;


@WebServlet(urlPatterns = {"/hospital.jsp"})
public class HospitalIntro extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public HospitalIntro() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	try {
    	String qr="PREFIX schema: <https://schema.org/>  \r\n" + 
    			"PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>\r\n" + 
    			"\r\n" + 
    			"SELECT  ?name (SAMPLE(?lat) as ?lat) (SAMPLE(?lon) as ?lon) (SAMPLE(?url) as ?url) (SAMPLE(?email) as ?email) (SAMPLE(?telephone) as ?telephone) (SAMPLE(?address) as ?address) (SAMPLE(?description) as ?description) (SAMPLE(?openingHours) as ?openingHours)\r\n" + 
    			"WHERE {\r\n" + 
    			" ?x schema:Place \"Hospital\" .\r\n" + 
    			" ?x schema:name ?name .\r\n" + 
    			" ?x geo:lat ?lat .\r\n" + 
    			" ?x geo:lon ?lon .\r\n" + 
    			" OPTIONAL { ?x schema:url ?url } .\r\n" + 
    			" OPTIONAL { ?x schema:email ?email } . \r\n" + 
    			" OPTIONAL { ?x schema:telephone ?telephone } . \r\n" + 
    			" OPTIONAL { ?x schema:address ?address } . \r\n" + 
    			" OPTIONAL { ?x schema:description ?description } . \r\n" + 
    			" OPTIONAL { ?x schema:openingHours ?openingHours }\r\n" + 
    			"} GROUP BY ?name\r\n";
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
    	ArrayList<String> openingHours=new ArrayList<String>();
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
    	request.getSession().setAttribute("latlist",lat);
    	request.getSession().setAttribute("lonlist",lon);
    	request.getSession().setAttribute("ur",ur);
    	request.getSession().setAttribute("email",email);
    	request.getSession().setAttribute("phone",telephone);
    	request.getSession().setAttribute("address",address);
    	request.getSession().setAttribute("description",description);
    	request.getSession().setAttribute("oph",openingHours);
    	in.close();
    	response.sendRedirect("hospitalp.jsp");
    	}catch(ConnectException | UnknownHostException ex) {
    		response.sendRedirect("index.jsp");
    	}
    }
}
