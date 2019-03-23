<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Control Courses</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#a0a0a0">
<%
String name=request.getParameter("name");

//Connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//finding all course
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select teacher,title,course from courses");
%>
<a class="btn btn-dark float-right pl-4 pr-4 m-4" href="admin.jsp?name=<%=name %>" >Back</a>
<br>
<h3>List of all Courses :</h3>
<table class="table table-hover table-dark table-striped">
  <thead>
    <tr>
      <th scope="col">Course Code</th>
      <th scope="col">Course Title</th>
      <th scope="col">Course Teacher</th>
      <th scope="col">Click</th>
    </tr>
  </thead>
  <tbody>
<%

   while(rs.next()){
   	String course = rs.getString("course");
   	String teacher = rs.getString("teacher");
   	String title = rs.getString("title");
   	%>
	<tr>
      <td><%=course%></td>
      <td><%=title%></td>
      <td><%=teacher%></td>
      <td><a href="delete.jsp?course=<%=course%>&name=<%=name%>">Delete Course</a></td>
    </tr>
	<%
} %>
  </tbody>
</table>

</body>
</html>