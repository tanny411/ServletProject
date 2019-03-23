<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
</head>
<body>
<%

String name=request.getParameter("name");
String course=request.getParameter("course");

//Connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//SQL query
Statement stmt = con.createStatement();
int rs = stmt.executeUpdate("delete from courses where course='"+course+"'");

response.sendRedirect("ControlCourses.jsp?name="+name);

%>
</body>
</html>