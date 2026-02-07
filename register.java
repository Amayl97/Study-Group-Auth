import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;


@WebServlet("/reg")
public class register extends HttpServlet {

    private static final Object Id = null;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String field = req.getParameter("field");
        String password = req.getParameter("password");
        String url =
                "jdbc:mysql://localhost:3306/studygroup?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "user";
        String dbPassword = "dbPassword";
        String sql =
        		"INSERT INTO USERS (NAME, EMAIL, PASSWORD, FIELD) VALUES (?, ?, ?, ?)";
        String avatar = "";
        if (name != null && !name.isEmpty()) {
            avatar = name.substring(0, 1).toUpperCase();
        }
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
        	PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
        	
        	ps.setString(1, name);
        	ps.setString(2, email);
        	ps.setString(3, password);
        	ps.setString(4, field);
            
        	ps.executeUpdate();
        	ResultSet rs =  ps.getGeneratedKeys();
        	if(rs.next()) {
        		
        		
        		int userId = rs.getInt(1);
        	    HttpSession session = req.getSession(true);
        	    session.setAttribute("avatar", avatar);
        	    session.setAttribute("userId", userId);
             	session.setAttribute("name", name);
        	    session.setAttribute("email", email);
        	    session.setAttribute("field", field);
        	    res.sendRedirect("profile.jsp"); 
        	}
        	
        	
        }
        catch (Exception e) {
            e.printStackTrace();              // console
            res.setContentType("text/plain");
            res.getWriter().println("Error registering user " + e);       // browser
        }
    }
}