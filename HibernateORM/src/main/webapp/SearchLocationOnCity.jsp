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
	<h1>Tourist location for selected city</h1>
	<%
String city=request.getParameter("city");

Configuration cfg=new Configuration().configure();
SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
Session ses=sf.getCurrentSession();
ses.beginTransaction();

Query<TouristLocation> q=ses.createQuery("from TouristLocation where city= :p1 ORDER BY averageRating DESC");
q.setParameter("p1", city);
List<TouristLocation> list=q.getResultList();

TouristLocation tl;
if(!list.isEmpty()){
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
}
else{
	out.println("No any Tourist Location exist from "+city);
}
ses.close();
%>
	<br>
	<br>
	<a href="#" onclick="history.back(); return false;">Back</a>
</body>
</html>