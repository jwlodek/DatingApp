package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Main.Validate;

import java.sql.*;

public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        String email = request.getParameter("email");
	        String pass = request.getParameter("pass");
	        boolean validation = Validate.checkUser(email, pass);
	        
	        request.setAttribute("auth", validation);
	        if(validation)
	        {
	        	
	            RequestDispatcher rs = request.getRequestDispatcher("/Home.jsp");
	            rs.forward(request, response);
	        }
	        else
	        {
	        	
	        	out.println("Username or Password incorrect");
	        	RequestDispatcher rs = request.getRequestDispatcher("login.html");
	        	rs.include(request, response);
	           
	        }
	    }  
}
