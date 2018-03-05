/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Admin;
import Model.Adviser;
import Model.Course;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rae Gerardino
 */
public class AdminServlet extends HttpServlet {

    //Request Dispatcher
    RequestDispatcher rd;

    //Signup session
    HttpSession session;
    String sessionUser;
    Boolean isAdmin;

    //Login creds
    int employeeNumber;
    String password;

    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(false);

        //Profile 
        if (request.getParameter("myProfile") != null) {
            loadAdminProfile(request, response);
        }//Manage
        else if (request.getParameter("manage") != null) {
            //loadCourses(request, response); change to load users
            rd = request.getRequestDispatcher("adminmanage.jsp");
            rd.forward(request, response);
        }//Change Password
        else if (request.getParameter("proposedSchedule") != null) {
            rd = request.getRequestDispatcher("adminpassword.jsp");
            rd.forward(request, response);
        }//FOR LOGOUT
        else if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession();
            if (!session.isNew()) {
                session.invalidate();
                rd = request.getRequestDispatcher("adminfacultyindex.jsp");
                rd.forward(request, response);
            }
        }
        //Students List
        else if(request.getParameter("studentList") != null){
            loadsStudentList(request, response);
        }
        //Faculty List
        else if(request.getParameter("facultyList") != null){
            loadsFacultyList(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    protected void loadAdminProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int sessionEmployee = (Integer) session.getAttribute("employeeNumber");
        System.out.println(sessionEmployee);
        Adviser adviserProfile = Adviser.getEmployeeProfile(sessionEmployee);
        System.out.println(adviserProfile.getUserID());
        session.setAttribute("Employee_ID", adviserProfile.getUserID());
        session.setAttribute("Department", adviserProfile.getDepartment());
        session.setAttribute("College", adviserProfile.getCollege());
        session.setAttribute("Rank", adviserProfile.getRank());
        session.setAttribute("First_Name", adviserProfile.getFirstName());
        session.setAttribute("Last_Name", adviserProfile.getLastName());
        session.setAttribute("Middle_Name", adviserProfile.getMiddleName());
        session.setAttribute("Password", adviserProfile.getPassword());
        session.setAttribute("Email", adviserProfile.getEmail());
        session.setAttribute("Birthdate", adviserProfile.getBirthdate());
        session.setAttribute("Employee_Picture", adviserProfile.getPicture());

        rd = request.getRequestDispatcher("adminprofile.jsp");
        rd.forward(request, response);
    }

    protected void loadCourses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //CHANGE TO LOAD USERS
        ArrayList<Course> coursesList = Course.getCoursesList();
        session.setAttribute("coursesList", coursesList);

        rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
        rd.forward(request, response);
    }
    
    protected void loadProposedScheduleList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        ArrayList<Student> proposedScheduleList = Adviser.getStudentProposedSchedule();
        session.setAttribute("proposedSchedList", proposedScheduleList);
        
        rd = request.getRequestDispatcher("facultyproposedschedule.jsp");
        rd.forward(request, response);
        
    }
    
    protected void loadsStudentList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        ArrayList<Student> studentList = Admin.getStudentList();
        session.setAttribute("studentList", studentList);
        
        rd = request.getRequestDispatcher("adminmanage.jsp");
        rd.forward(request, response);
        
    }
    
    protected void loadsFacultyList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        ArrayList<Adviser> facultyList = Admin.getFacultyList();
        session.setAttribute("facultyList", facultyList);
        
        rd = request.getRequestDispatcher("adminmanage.jsp");
        rd.forward(request, response);
        
    }
}
