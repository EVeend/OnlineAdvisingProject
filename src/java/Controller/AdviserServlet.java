/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Adviser;
import Model.PDFGenerator;
import Model.Course;
import Model.Student;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

//    URL url = getClass().getResource("/main/web/downloadables/hello.pdf");
//    final String filePath = url.toString();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        clear(request, response);
        
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
        } //class list
        else if (request.getParameter("classList") != null) {
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
        //Download classlist of a course pdf
        else if (request.getParameter("classListPDF") != null) {
            //Generate PDF
            String courseID = request.getParameter("courseID");
            String section = request.getParameter("section");
            String newFilePath = courseID + section + ".pdf";
            System.out.println(newFilePath);
            System.out.println(System.getProperty("user.dir"));
            PDFGenerator.generateClassListPDF(newFilePath, courseID, section);

            //Make PDF Downloadable
            String filePath = System.getProperty("user.dir") + "/" + newFilePath;
            File downloadFile = new File(filePath);
            downloadFile(request, response, downloadFile, filePath);

        }
        //Download all available courses pdf
        else if(request.getParameter("coursesPDF") != null){
            ArrayList<Course> coursesList = Course.getCoursesList();
            String newFilePath = "AvailableCourses.pdf";
            //Generate PDF
            PDFGenerator.generateAvailableCoursesPDF(newFilePath, coursesList);

            //Make PDF Downloadable
            String filePath = System.getProperty("user.dir") + "/" + newFilePath;
            File downloadFile = new File(filePath);
            downloadFile(request, response, downloadFile, filePath);
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
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void downloadFile(HttpServletRequest request, HttpServletResponse response, File pdfFile, String filePath)
            throws ServletException, IOException {
        
        FileInputStream inStream = new FileInputStream(pdfFile);
        
        // obtains ServletContext
        ServletContext context = getServletContext();

        // gets MIME type of the file
        String mimeType = context.getMimeType(filePath);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) pdfFile.length());

        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", pdfFile.getName());
        response.setHeader(headerKey, headerValue);

        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while ((bytesRead = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }

        inStream.close();
        outStream.close();

    }

    protected void clear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        
        ArrayList<Student> proposedScheduleList = Adviser.getStudentProposedSchedule();
        if(!proposedScheduleList.isEmpty()){
            System.out.println("TRUE");
            session.setAttribute("hasProposedSched", true);
        }

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
