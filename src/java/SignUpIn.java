import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/SignUpIn"})
public class SignUpIn extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            int count=0;
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
            if(request.getParameter("login") != null)
            {
                PreparedStatement ps = c.prepareStatement("select * from RegisterData");
                ResultSet logData = ps.executeQuery();
                while(logData.next())
                {
                    if(email.equals(logData.getString(2)) && password.equals(logData.getString(3)))
                        count++;
                }
                ps.close();
                if(count>0)
                    response.sendRedirect("Home.jsp");
                else
                {   
                    rd.include(request, response);
                    out.println("<br><p style='font-size: 20px; color: red; text-align: center;padding-top:700px;margin-left:-360px'>Invalid email or password!</p>");
                }
            }
            if(request.getParameter("signup") != null)
            {
                PreparedStatement ps = c.prepareStatement("insert into RegisterData values(?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                try{
                    int i = ps.executeUpdate();
                    if(i>0)
                    {
                       rd.include(request, response);
                       out.println("<br><div class='afterText'> <p style='font-size: 20px; color: green; text-align: center;padding-top:700px;margin-left:-450px'>Register Successfully...</p>");
                    }
                } catch(Exception e)
                {
                    rd.include(request, response);
                    out.println("<br><p style='font-size: 20px; color: red; text-align: center;padding-top:700px;margin-left:-320px'>User Already Exist!</p> </div>");
                }
                ps.close();
            }
            c.close(); 
        } catch(Exception e){
            out.println(e);
        }
    }
}
