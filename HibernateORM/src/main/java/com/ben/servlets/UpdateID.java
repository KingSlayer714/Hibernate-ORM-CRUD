package com.ben.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.shubham.entities.TouristLocation;

/**
 * Servlet implementation class UpdateID
 */
public class UpdateID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateID() {
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
		int locId=Integer.parseInt(request.getParameter("locId"));

		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(TouristLocation.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		ses.beginTransaction();

		Query<TouristLocation> q=ses.createQuery("from TouristLocation where locationID= :no");
		q.setParameter("no",locId);
		List<TouristLocation> list=q.getResultList();
		if(!list.isEmpty()) {
		TouristLocation location= list.get(0);
		request.setAttribute("tl", location); // Set the TouristLocation object as a request attribute
	    request.getRequestDispatcher("UpdateByID.jsp").forward(request, response); // Forward the request to the JSP page
		}
		else {
			out.print("Location not exist...");
			out.println("<br>");
			out.println("<a href=\"#\" onclick=\"history.back(); return false;\">Back</a>");
		}
	}

}
