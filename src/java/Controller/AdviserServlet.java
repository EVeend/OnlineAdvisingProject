/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Adviser;
import Model.Course;
import Model.Student;
import java.io.IOException;
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
 * @author edwar
 */
public class AdviserServlet extends HttpServlet {

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

        //Login ADviser
        if (request.getParameter("logInEmployee") != null) {
            System.out.println("hahaha");
            employeeNumber = Integer.parseInt(request.getParameter("employeeNumber"));
            password = (String) request.getParameter("password");
            System.out.println(employeeNumber + " " + password);
            if (Adviser.isUser(employeeNumber, password)) {
                System.out.println("You have successfully logged in");
                session = request.getSession();
                session.setAttribute("employeeNumber", employeeNumber);
                session.setAttribute("password", password);
                loadAdminProfile(request, response);
            } else {
//                System.out.println("dsada");
            }
        }//Profile 
        else if (request.getParameter("myProfile") != null) {
            loadAdminProfile(request, response);
        }//Available Courses 
        else if (request.getParameter("availableCourses") != null) {
            loadCourses(request, response);
            rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
            rd.forward(request, response);
        }//List of Student's Proposed Schedule
        else if (request.getParameter("proposedSchedule") != null) {
            loadProposedScheduleList(request, response);
        }//View Student's proposed Schedule
        else if(request.getParameter("view") != null){
            System.out.println("heeeeeeeeeey");
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            ArrayList<Course> studentSchedule = Student.getStudentSchedule(studentID);
            session.setAttribute("studentID", studentID);
            session.setAttribute("studentSched", studentSchedule);
            rd = request.getRequestDispatcher("ProposedScheduleView.jsp");
            rd.forward(request, response);
        }//Adviser Approved Schedule
        else if(request.getParameter("approve") != null){
            System.out.println("APPROVE");
            String approve = "Approve";
            String remark = request.getParameter("remark");
            Integer adviserID = (Integer)session.getAttribute("employeeNumber");
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            Adviser.evaluateSchedule(adviserID, studentID, approve, remark);
            loadProposedScheduleList(request, response);
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
        System.out.println(adviserProfile.getPicture());

                //CHECKER IF ADMIN
        if(adviserProfile.getUserID()== 123454321 && adviserProfile.getPassword().equals("admin")){
            rd = request.getRequestDispatcher("adminprofile.jsp");
            rd.forward(request, response);
        }
        else{
            rd = request.getRequestDispatcher("facultyprofile.jsp");
            rd.forward(request, response);
        }
    }

    protected void loadCourses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
}
