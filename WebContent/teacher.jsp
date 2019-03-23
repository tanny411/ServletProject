<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#bcbaba">
<%
String name=request.getParameter("name");

//connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//SQL query
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select course,title from courses where teacher='"+name+"'");
%>
<hr>
<a class="btn btn-dark float-right pl-4 pr-4 mr-4" href="logout.jsp" >Logout</a>
<h1>Welcome <%=name%> </h1>
<hr>

<h5>Assigned Courses:</h5>
<table class="table table-hover table-dark table-striped">
  <thead>
    <tr>
      <th scope="col">Course Code</th>
      <th scope="col">Course Title</th>
      <th scope="col">click</th>
    </tr>
  </thead>
  <tbody>
<%
	//Listing all courses
   while(rs.next()){
   	String course = rs.getString("course");
   	String courseName = rs.getString("title");
%>
	<tr>
      <td><%=course%></td>
      <td><%=courseName%></td>
      <td><a href="viewStudents.jsp?course=<%=course%>&name=<%=name%>">View Students</a></td>
    </tr>
    
<% } %>
  </tbody>
</table>
</body>
</html>