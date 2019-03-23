<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Home</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#a0a0a0">
<%
// Grabbings values
String name=request.getParameter("name");
String added=request.getParameter("added");

//Connecting to Database
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");

//SQL query
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select name from user where role='teacher'");
%>
<hr>
<a class="btn btn-dark float-right pl-4 pr-4 ml-4 mr-4" href="logout.jsp" >Logout</a>
<a class="btn btn-dark float-right pl-4 pr-4 ml-4 mr-4" href="ControlCourses.jsp?name=<%=name%>" >View All Courses</a>
<h1>Welcome <%=name%> </h1>
<hr>
	<br>
	<div class="container-fluid">
		<div class="panel panel-success">
			<div class="panel-heading" align="center">
				<h2>
					<b><font color="black" style="font-family: fantasy;">Create New Course</font> </b>
				</h2>
			</div>
			<div class="panel-body" align="center">
				<p style="color:darkblue"><%if(added!=null && added.equals("ok")){
						%>
						Course Added Successfully!
						<%
					}%></p>
				<div class="container " style="margin-top: 5%; margin-bottom: 5%;">

					<div class="panel panel-success" style="max-width: 35%;" align="left">

						<div class="panel-body">

							<form action="RegisterCourse" method="post">
								<input hidden="hidden" name="name" value="<%=name%>">
								<div class="form-group">
									<label for="exampleInputEmail1">Course Code</label> 
									<input type="text" class="form-control" name="courseCode" 
									id="courseCode" placeholder="Enter Course Code" required="required">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Course Name</label> 
									<input type="text" class="form-control" name="course" 
									id="course" placeholder="Enter Course Name" required="required">

								</div>
								<div class="form-group">
									<label for="sel1">Assign Teacher:</label>
									  <select class="form-control" id="teacher" name="teacher">
									    <%
									    	//getting list of all teachers available
									    	while(rs.next()){
									    		String t=rs.getString("name");
									    		%>
									    		<option><%=t%></option>
									    		<%
									    	}
									    %>
									  </select>
								</div>
								<button type="submit" style="width: 100%; font-size: 1.1em;"
									class="btn btn-large btn btn-success btn-lg btn-block">
									<b>Create Course</b>
								</button>

							</form>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>