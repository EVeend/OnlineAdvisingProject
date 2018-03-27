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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Clears session values
        clear(request, response);
        //Profile 
        if (request.getParameter("myProfile") != null) {
            Integer employeeNum = (Integer) session.getAttribute("employeeNumber");
            String password = (String) session.getAttribute("password");
            String userRank = Adviser.isUser(employeeNum, password);
            loadAdminProfile(request, response, userRank);
        }//Available Courses 
        else if (request.getParameter("availableCourses") != null) {
            loadCourses(request, response);
            rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
            rd.forward(request, response);
        }//List of Student's Proposed Schedule
        else if (request.getParameter("proposedSchedule") != null) {
            loadProposedScheduleList(request, response);
        }//View Student's proposed Schedule
        else if (request.getParameter("view") != null) {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            System.out.println("Schedule of " + studentID);
            ArrayList<Course> studentSchedule = Student.getStudentSchedule(studentID);
            session.setAttribute("studentID", studentID);
            session.setAttribute("studentSched", studentSchedule);
            session.setAttribute("schedule", "schedule");
            System.out.println(studentID);
            rd = request.getRequestDispatcher("facultyproposedschedule.jsp");
            rd.forward(request, response);
        } //Students List
        else if (request.getParameter("studentList") != null) {
            loadsStudentList(request, response);
        } else if (request.getParameter("classList") != null) {
            System.out.println("Classlist");
            String courseID = request.getParameter("courseID");
            String formattedCourseID = Course.format(courseID);
            String section = request.getParameter("section");
            System.out.println(section);
            ArrayList<Student> classList = Adviser.getOfficialClassList(formattedCourseID, section);
            session.setAttribute("classList", classList);
            session.setAttribute("course", formattedCourseID);
            session.setAttribute("section", section);
            rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(false);
        //Login ADviser
        if (request.getParameter("logInEmployee") != null) {
            employeeNumber = Integer.parseInt(request.getParameter("employeeNumber"));
            password = (String) request.getParameter("password");
            System.out.println(employeeNumber + " " + password);
            String userRank = "";
            try {
                if (Adviser.isUser(employeeNumber, password).equals("Faculty")) {
                    System.out.println("You have successfully logged in");
                    session = request.getSession();
                    userRank = Adviser.isUser(employeeNumber, password);
                    session.setAttribute("employeeNumber", employeeNumber);
                    session.setAttribute("password", password);
                    loadAdminProfile(request, response, userRank);
                }
            } catch (NullPointerException e) {
                session.setAttribute("errorMessage", "noUser");
                rd = request.getRequestDispatcher("adminfacultyindex.jsp");
                rd.forward(request, response);
            }
//            } else if (Adviser.isUser(employeeNumber, password).equals("Administrator")) {
////               System.out.println("You have successfully logged in");
//                session = request.getSession();
//                userRank = Adviser.isUser(employeeNumber, password);
//                session.setAttribute("employeeNumber", employeeNumber);
//                session.setAttribute("password", password);
//                loadAdminProfile(request, response, userRank);
//            }
        } //Adviser Approved Schedule
        else if (request.getParameter("approve") != null) {
            System.out.println("APPROVE");
            String approve = "APPROVE";
            String remark = request.getParameter("remark");
            Integer adviserID = (Integer) session.getAttribute("employeeNumber");
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            Adviser.evaluateSchedule(adviserID, studentID, approve, remark);
            loadProposedScheduleList(request, response);
        } else if (request.getParameter("reject") != null) {
            System.out.println("REJECT");
            String reject = "REJECT";
            String remark = request.getParameter("remark");
            Integer adviserID = (Integer) session.getAttribute("employeeNumber");
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            Adviser.evaluateSchedule(adviserID, studentID, reject, remark);
            loadProposedScheduleList(request, response);
//            System.out.println("Reject");
//            rd = request.getRequestDispatcher("Popup.jsp");
//            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    protected void clear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        session = request.getSession(false);
        session.setAttribute("studentID", null);
        session.setAttribute("studentSched", null);
        session.setAttribute("schedule", null);

        session.setAttribute("classList", null);
        session.setAttribute("course", null);
        session.setAttribute("section", null);
    }

    protected void loadAdminProfile(HttpServletRequest request, HttpServletResponse response, String rank)
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

        if (rank.equals("Administrator")) {
            rd = request.getRequestDispatcher("adminprofile.jsp");
            rd.forward(request, response);
        } else {
            rd = request.getRequestDispatcher("facultyprofile.jsp");
            rd.forward(request, response);
        }

//                //CHECKER IF ADMIN
//        if(adviserProfile.getUserID()== 123454321 && adviserProfile.getPassword().equals("admin")){
//            rd = request.getRequestDispatcher("adminprofile.jsp");
//            rd.forward(request, response);
//        }
//        else{
//            rd = request.getRequestDispatcher("facultyprofile.jsp");
//            rd.forward(request, response);
//        }
    }

    protected void updateAccountStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Course> coursesList = Course.getCoursesList();
        session.setAttribute("coursesList", coursesList);

        rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
        rd.forward(request, response);
    }

    protected void loadCourses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Course> coursesList = Course.getCoursesList();
        session.setAttribute("coursesList", coursesList);

        rd = request.getRequestDispatcher("facultyavailablecourses.jsp");
        rd.forward(request, response);
    }

    protected void loadProposedScheduleList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Student> proposedScheduleList = Adviser.getStudentProposedSchedule();
        session.setAttribute("proposedSchedList", proposedScheduleList);
        response.sendRedirect("facultyproposedschedule.jsp");

    }

    protected void loadsStudentList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Student> studentList = Adviser.getStudentList();
        session.setAttribute("studentList", studentList);

        rd = request.getRequestDispatcher("facultystudentlist.jsp");
        rd.forward(request, response);

    }

}
