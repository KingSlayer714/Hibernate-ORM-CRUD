package com.ben.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.shubham.entities.TouristLocation;

/**
 * Servlet implementation class UpdateLocation
 */
public class UpdateLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLocation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int locid=Integer.parseInt(request.getParameter("locId"));
		String locnm=request.getParameter("location");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String desc=request.getParameter("description");
		float averagerating=Float.parseFloat(request.getParameter("averagerating"));
		
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		Query<TouristLocation> q=ses.createQuery("update TouristLocation set locationName= :p1, city= :p2, country= :p3, description= :p4, averageRating= :p5 where locationID= :p6");
		q.setParameter("p1", locnm);
		q.setParameter("p2", city);
		q.setParameter("p3", country);
		q.setParameter("p4", desc);
		q.setParameter("p5", averagerating);
		q.setParameter("p6", locid);
		int cnt=q.executeUpdate();
		ses.getTransaction().commit();
		
		if(cnt>0) {
			out.println("Location updated successfully...");
			out.println("<br>");
			out.println("<a href='index.html'>Home</a>");
		}
		else
			out.println("Update failed...");
		
		ses.close();
	}

}
