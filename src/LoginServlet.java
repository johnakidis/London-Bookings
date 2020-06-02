import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.math.BigInteger;
import java.util.logging.Logger;


@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
        	HttpSession session=request.getSession();
            String uname=request.getParameter("usr");
            if(uname==null) {
            	request.getSession().setAttribute("error","button");
            }
            else {
            String pwd=request.getParameter("pwd");
            java.sql.Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
            Statement statement=conn.createStatement();
            ResultSet rs=statement.executeQuery("SELECT * FROM users WHERE username='"+uname+"'");
            //hash
            MessageDigest md=MessageDigest.getInstance("MD5");
        	byte[] messageDigest=md.digest(pwd.getBytes());
        	BigInteger no=new BigInteger(1,messageDigest);
        	String newpas=no.toString(16);
        	while(newpas.length()<32) {
        		newpas="0"+newpas;
        	}
            if(rs.next()) {
            	if(newpas.equals(rs.getString("password"))){
            		session.setAttribute("user", uname);
            		conn.close();
            	}
            	else {
            		request.getSession().setAttribute("error","pwd");
            		conn.close();
            	}
            }
            else {
            	request.getSession().setAttribute("error","uname");
            	conn.close();
            }
        	}
        	response.sendRedirect("index.jsp");
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}