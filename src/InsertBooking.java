  
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.PrintWriter;


@WebServlet(urlPatterns = {"/InsertBooking"})
public class InsertBooking extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public InsertBooking() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
        	String uname=request.getParameter("uname");
        	response.setContentType("text/html");
        	PrintWriter out = response.getWriter();

        	if(uname!=null) {
        		String name=request.getParameter("name");
        		String lat=request.getParameter("lat");
        		String lon=request.getParameter("lon");
        		String rating="-1";
        		String people=request.getParameter("people");
        		String sdate=request.getParameter("sdate");
        		String edate=request.getParameter("edate");
        		out.println("78"+name+lat+lon+people+rating+sdate+edate+uname);
        		java.sql.Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
        		Statement statement=conn.createStatement();
        		statement.executeUpdate("INSERT INTO bookings (name,lat,lon,rating,people,sdate,edate,username) VALUES('"+name+"','"+lat+"','"+lon+"','"+rating+"','"+people+"','"+sdate+"','"+edate+"','"+uname+"' )");
        		conn.close();
        		out.println("78");
        	}
        	response.sendRedirect("bookings.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}