package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletProject
 */
@SuppressWarnings("unused")
@WebServlet("/ServletProject")
public class ServletProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletProject() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("txtUserName");
		String pass = request.getParameter("txtPass");
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");
	        Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery("select name,pass,role from user where name='"+name+"' and pass='"+pass+"'");
	        
	        if(rs.next()) {
	        	HttpSession session = request.getSession();
				session.setAttribute("name", name);
				
				String t = rs.getString("role");
				name = rs.getString("name");
				
            	if(t.equals("student")) {
            		request.getRequestDispatcher("student.jsp?name="+name).forward(request,response);
            	}
            	else if(t.equals("teacher")) {
            		request.getRequestDispatcher("teacher.jsp?name="+name).forward(request,response);            		
            	}
            	else if(t.equals("admin")) {
            		request.getRequestDispatcher("admin.jsp?name="+name).forward(request,response);
            	}
	        }else {
	        	response.sendRedirect("error.jsp");
	        }	        
	      } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	      } catch (SQLException e) {
	        e.printStackTrace();
	      } finally {
	    	  out.close();
	      }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
