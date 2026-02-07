package studygroup2;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String dbUser = "user";
        String dbPass = "dbPassword";
        String URL =
          "jdbc:mysql://localhost:3306/studygroup?useSSL=false&allowPublicKeyRetrieval=true";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(URL, dbUser, dbPass);

            String sql =
              "SELECT id, name, email, field FROM USERS WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
            	
            	int userId = rs.getInt("id");
            	String name = rs.getString("name");
            	String avatar = ""; 
            	if(name != null && !name.isEmpty()) avatar = name.substring(0,1).toUpperCase();
            	String field = rs.getString("field");
            	
                HttpSession session = req.getSession();
                session.setAttribute("avatar", avatar);
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("field", rs.getString("field"));

                res.sendRedirect("profile.jsp");
            } else {
                res.sendRedirect("login.jsp");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Server Error");
        }
    }
}