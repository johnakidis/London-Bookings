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

@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public SignupServlet() {
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
            	String password=request.getParameter("pwd");
            	String password2=request.getParameter("pwd2");
            	String email=request.getParameter("email");
            	String name=request.getParameter("nm");
            	String lastname=request.getParameter("snm");
            	String phone=request.getParameter("phone");
            	java.sql.Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","admin");
                Statement statement=conn.createStatement();
                ResultSet rs=statement.executeQuery("SELECT * FROM users WHERE username='"+uname+"'");
                if(rs.next()) {
                	request.getSession().setAttribute("error", "used");
                	conn.close();
                	response.sendRedirect("signup.jsp");
                }
                else {
                if(!password.equals(password2)) {
                	request.getSession().setAttribute("error", "pmatch");
                	conn.close();
                	response.sendRedirect("signup.jsp");
                }
                else {
                	//hash
                	MessageDigest md=MessageDigest.getInstance("MD5");
                	byte[] messageDigest=md.digest(password.getBytes());
                	BigInteger no=new BigInteger(1,messageDigest);
                	String newpas=no.toString(16);
                	while(newpas.length()<32) {
                		newpas="0"+newpas;
                	}
                statement.executeUpdate("INSERT INTO users (username,password,email,name,surname,phone) VALUES ('"+uname+"','"+newpas+"','"+email+"','"+name+"','"+lastname+"','"+phone+"')");
                conn.close();
                session.setAttribute("user", uname);
                response.sendRedirect("index.jsp");
                }}
            }
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}