<%@page import="java.util.List"%>
<%@page import="com.shubham.entities.TouristLocation"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
th {
	text-align: center;
}
</style>
</head>
<body>
	<h1>Tourist location list</h1>
	<%
Configuration cfg=new Configuration().configure();
SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
Session ses=sf.getCurrentSession();
ses.beginTransaction();

Query<TouristLocation> q=ses.createQuery("from TouristLocation");
List<TouristLocation> list=q.getResultList();
TouristLocation tl;
%>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>LocationID</th>
				<th>Name</th>
				<th>City</th>
				<th>Country</th>
				<th>Description</th>
				<th>Rating</th>
			</tr>
		</thead>
		<%
for(int i=0;i<list.size();i++)
{
	tl=list.get(i);
	out.println("<tr>");
	out.println("<td>"+tl.getLocationID()+"</td>");
	out.println("<td>"+tl.getLocationName()+"</td>");
	out.println("<td>"+tl.getCity()+"</td>");
	out.println("<td>"+tl.getCountry()+"</td>");
	out.println("<td>"+tl.getDescription()+"</td>");
	out.println("<td>"+tl.getAverageRating()+"</td>");
	out.println("</tr>");
}
ses.close();
%>
	</table>
	<br>
	<br>
	<h4>Search Location</h4>
	<form method="post" action="SearchCity.jsp">
		City&nbsp:&nbsp<input type="text" name="city"> &nbsp<input
			type="submit" value="Search">
	</form>
	<br>
	<a href="index.html">Home</a>
</body>
</html>