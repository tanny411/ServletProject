<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#bcbaba">
<% 
	//Grabing Values
	String name=request.getParameter("name");

	//Connecting to Database
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");
	
	//SQL query
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select course from students where student='"+name+"'");
	
	//List of all Courses
	HashMap<String, Boolean> courses = new HashMap<String, Boolean>();
%>
<hr>
<a class="btn btn-dark float-right pl-4 pr-4 mr-4" href="logout.jsp" >Logout</a>
<h1>Welcome <%=name%> </h1>
<hr>
<br>
<h5>Registered Courses:</h5>
<table class="table table-hover table-striped table-dark">
  <thead>
    <tr>
      <th scope="col">Course Code</th>
      <th scope="col">Course Title</th>
      <th scope="col">Course Teacher</th>
    </tr>
  </thead>
  <tbody>
<%
   while(rs.next()){
   	String course = rs.getString("course");
   	courses.put(course, true);
   	
   	//finding teacher of each course
   	Statement stmt2 = con.createStatement();
   	ResultSet res = stmt2.executeQuery("select teacher,title from courses where course='"+course+"'");
   	res.next();
   	String teacher = res.getString("teacher");
   	String title = res.getString("title");
%>
	<tr>
      <td><%=course%></td>
      <td><%=title%></td>
      <td><%=teacher%></td>
    </tr>
    
<% } %>
  </tbody>
</table>

<br>
<h5><i>Want to register for new course?</i> <br> See all the other courses :</h5>
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
	//Listing all courses available
	Statement stmt3 = con.createStatement();
	ResultSet rs3 = stmt3.executeQuery("select course,teacher,title from courses");
   while(rs3.next()){
   	String course = rs3.getString("course");
   	String teacher = rs3.getString("teacher");
   	String title = rs3.getString("title");
   	
   	//Picking courses the student did not take
   	if(!courses.containsKey(course)){
   		%>
   			<tr>
		      <td><%=course%></td>
		      <td><%=title%></td>
		      <td><%=teacher%></td>
		      <td><a href="register.jsp?course=<%=course%>&name=<%=name%>">Register</a></td>
		    </tr>
   		<%
   	}
} %>
  </tbody>
</table>
</body>
</html>