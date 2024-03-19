<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.shubham.entities.TouristLocation"%>
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
for(int i=0;i<list.size();i++)
{
	tl=list.get(i);
	out.println("Location ID   : "+tl.getLocationID());
	out.println("<br>");
	out.println("Location Name : "+tl.getLocationName());
	out.println("<br>");
	out.println("City          : "+tl.getCity());
	out.println("<br>");
	out.println("Country       : "+tl.getCountry());
	out.println("<br>");
	out.println("Description   : "+tl.getDescription());
	out.println("<br>");
	out.println("Rating        : "+tl.getAverageRating());
	out.println("<hr>");
}
ses.close();
%>
	<br>
	<br>
	<h4>Update Location</h4>
	<form method="post" action="UpdateID">
		Location&nbspID&nbsp:&nbsp<input type="number" name="locId">&nbsp
		<input type="submit" value="Search">
	</form>
	<br>
	<a href="index.html">Back</a>
</body>
</html>