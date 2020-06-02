  
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/UpdateRating"})
public class UpdateRating extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UpdateRating() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
        	String idf=request.getParameter("id");
        	if(idf!=null) {
        		String rate=request.getParameter("rate");
        		int id=Integer.parseInt(idf);
        		java.sql.Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
        		Statement statement=conn.createStatement();
        		statement.executeUpdate("UPDATE bookings SET rating='"+rate+"' WHERE id='"+id+"'  ");
        		conn.close();
        	}
        	response.sendRedirect("bookings.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}