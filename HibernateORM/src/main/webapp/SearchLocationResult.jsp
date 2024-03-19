<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.shubham.entities.TouristLocation"%>
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
	<h2>Search Location Result</h2>
	<hr>
	<%
int locId=Integer.parseInt(request.getParameter("locId"));

Configuration cfg=new Configuration().configure();
SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
Session ses=sf.getCurrentSession();
ses.beginTransaction();

Query<TouristLocation> q=ses.createQuery("from TouristLocation where locationID= :no");
q.setParameter("no",locId);
List<TouristLocation> list=q.getResultList();
TouristLocation t;

if(list.size()==1)
{
	t=list.get(0);
	out.println("Location ID   : "+t.getLocationID());
	out.println("<br>");
	out.println("Location Name : "+t.getLocationName());
	out.println("<br>");
	out.println("City          : "+t.getCity());
	out.println("<br>");
	out.println("Country       : "+t.getCountry());
	out.println("<br>");
	out.println("Description   : "+t.getDescription());
	out.println("<br>");
	out.println("Rating        : "+t.getAverageRating());
}
else
{
	out.println("Account does not exist");
}
ses.close();
%>
	<br>
	<br>
	<a href="#" onclick="history.back(); return false;">Back</a>
</body>
</html>