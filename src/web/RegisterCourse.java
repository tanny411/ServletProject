package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterCourse
 */
@WebServlet("/RegisterCourse")
public class RegisterCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterCourse() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("courseCode");
		String course = request.getParameter("course");
		String teacher = request.getParameter("teacher");
		String name = request.getParameter("name");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");
	        Statement stmt = con.createStatement();
	        @SuppressWarnings("unused")
			int rs = stmt.executeUpdate("insert into courses (course,title,teacher) values ('"+code+"','"+course+"','"+teacher+"')");
//	        request.getRequestDispatcher("admin.jsp?name="+name+"&added=true").forward(request,response);
	        response.sendRedirect("admin.jsp?name="+name+"&added=ok");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
