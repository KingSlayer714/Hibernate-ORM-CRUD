package com.ben.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDateTime;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.shubham.entities.TouristLocation;

/**
 * Servlet implementation class AddLocation
 */
public class AddLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLocation() {
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
		String locnm=request.getParameter("location");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String desc=request.getParameter("description");
		float averagerating=Float.parseFloat(request.getParameter("averagerating"));
		
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		TouristLocation tl=new TouristLocation();
		tl.setLocationName(locnm);
		tl.setCity(city);
		tl.setCountry(country);
		tl.setDescription(desc);
		tl.setAverageRating(averagerating);
		
		ses.persist(tl);
		ses.getTransaction().commit();
		System.out.println("new tourist location added successfully");
		ses.close();
		response.sendRedirect("successAdd.html");
	}

}
