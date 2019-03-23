<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#bcbaba">
<%
String course=request.getParameter("course");
String name=request.getParameter("name");

//Connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//SQL to select all student enrolled in a particular course
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select student from students where course='"+course+"'");
%>
<a class="btn btn-dark float-right pl-4 pr-4 m-4" href="teacher.jsp?name=<%=name %>" >Back</a>
<br><br>
<h5>Students registered in this courses:</h5>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">Student Name</th>
    </tr>
  </thead>
  <tbody>
<%
	//listing students
   while(rs.next()){
   	String student = rs.getString("student");
%>
	<tr>
      <td><%=student%></td>
    </tr>
    
<% } %>
  </tbody>
</table>

</body>
</html>