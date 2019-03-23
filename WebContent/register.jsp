<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>

<style>
.center-div
{
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 500px;
  height: 100px;
}
</style>

</head>
<body style="background-color:#424242">
<%
//Grabing values
String name=request.getParameter("name");
String course=request.getParameter("course");

//Connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//SQL query
Statement stmt = con.createStatement();
int rs = stmt.executeUpdate("insert into students(student,course)values('"+name+"','"+course+"')");

%>
    <div class="center-div">
		<h1 style="color:#d8d8d8">Registration Successful</h1>
		<a style="color:white" href="student.jsp?name=<%=name %>">Back</a>
	</div>
</body>
</html>