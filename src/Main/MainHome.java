package Main;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainHome {

	public static void profileHome(HttpServletRequest request, HttpServletResponse response, int flag) throws ServletException, IOException {
		String pID;
        if(request.getParameter("Editing")!=null || flag == 0) {
        	pID = UserDat.ps1.getProfileID();
        }
        else {
        	pID = request.getParameter("Username");
        }
        System.out.println("The username recieved is "+pID);
        SQLAccessor sqlA = new SQLAccessor();
		try {
			ResultSet rs2 = sqlA.getProfileSSN(pID);
			rs2.next();
			String pSSN = rs2.getString("OwnerSSN");
			if(UserDat.ps1.getSSN().compareTo(pSSN)==0) {
				UserDat.ps1.setProfileID(pID);
				System.out.println("Assigned logged in pID as "+UserDat.ps1.getProfileID());
			}
			System.out.println("Entering user "+pID+"'s profile page");
			ResultSet rs = sqlA.getProfileInfo(pID);
			rs.next();
			String ssn1 = UserDat.ps1.getSSN();
	        String profileID = pID;
	        String loginEmail = sqlA.getEmailFromProfile(pID);
	        int age = rs.getInt("Age");
	        int dars = rs.getInt("DatingAgeRangeStart");
	        int dare = rs.getInt("DatingAgeRangeEnd");
	        int dgr = rs.getInt("DatingGeoRange");
	        String gender = rs.getString("M_F");
	        String hobbies = rs.getString("Hobbies");
	        int height = rs.getInt("Height");
	        int weight = rs.getInt("Weight");
	        String hair = rs.getString("HairColor");
	        
	        request.setAttribute("ssn1", ssn1);
	        request.setAttribute("ssn2", pSSN);
	        request.setAttribute("profileID", profileID);
	        request.setAttribute("loginEmail", loginEmail);
	        request.setAttribute("age", age);
	        request.setAttribute("dars", dars);
	        request.setAttribute("dare", dare);
	        request.setAttribute("dgr", dgr);
	        request.setAttribute("gender", gender);
	        request.setAttribute("hobbies", hobbies);
	        request.setAttribute("height", height);
	        request.setAttribute("weight", weight);
	        request.setAttribute("hair", hair);
	        System.out.println(loginEmail);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
	        dispatcher.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("InvalidInput.html");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
}
