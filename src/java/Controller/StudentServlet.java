package Controller;

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
public class StudentServlet extends HttpServlet {

    //Request Dispatcher
    RequestDispatcher rd;

    //Signup session
    HttpSession session;
    String sessionUser;
    Boolean isAdmin;

    //Login creds
    int studentNumber;
    String password;

    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        session = request.getSession(false);

        //Login Student
        if (request.getParameter("logInStudent") != null) {
            try {
                System.out.println("hahaha");
                studentNumber = Integer.parseInt(request.getParameter("studentNumber"));
                password = (String) request.getParameter("password");

                Student currentStudent = Student.getStudent(studentNumber, password);
                if (Student.getStudent(studentNumber, password) != null) {
                    if (currentStudent.getAccountStatus() == 1 && (currentStudent.getRetentionStatus() == 2 || currentStudent.getRetentionStatus() == 3)) {
                        session = request.getSession();
                        session.setAttribute("currentStudent", currentStudent);
                        loadStudentProfile(request, response);
                    } else {
                        session.setAttribute("currentStudent", null);
                        String errorAccountAccess = "noAccess";
                        session.setAttribute("errorMessage", errorAccountAccess);
                        rd = request.getRequestDispatcher("studentindex.jsp");
                        rd.forward(request, response);
                    }

                }
            } catch (Exception e) {
                session.setAttribute("errorMessage", "noUser");
                rd = request.getRequestDispatcher("studentindex.jsp");
                rd.forward(request, response);
            }

//            if (Student.isIrregular(studentNumber, password).equals("user")) {
//                System.out.println("You have successfully logged in");
//                session = request.getSession();
//                session.setAttribute("studentNumber", studentNumber);
//                session.setAttribute("password", password);
//                loadStudentProfile(request, response);
//            } else {
//                session.setAttribute("errorMessage", Student.isIrregular(studentNumber, password));
//                rd = request.getRequestDispatcher("studentindex.jsp");
//                rd.forward(request, response);
//            }
        } // NAV BAR BUTTONS
        //view Profile
        else if (request.getParameter("profile") != null) {
            loadStudentProfile(request, response);
        } //view my schedule
        else if (request.getParameter("mySchedule") != null) {
            loadStudentMySchedule(request, response);
        }//View Curriculum
        else if (request.getParameter("curriculum") != null) {
            String[] semesters = {"First Semester", "Second Semester"};
            String[] years = {"First Year", "Second Year", "Third Year", "Fourth Year"};

            /*for(int i = 0; i < years.length; i++){
                for(int j = 0; j < semesters.length; j++){
                    curriculum.add(Course.getECECurriculum(semesters[j], years[i]));
                }
            }   */
            //First Year
            session.setAttribute("fSemfYear", Course.getCurriculum(semesters[0], years[0]));
            session.setAttribute("sSemfYear", Course.getCurriculum(semesters[1], years[0]));
            session.setAttribute("fSemsYear", Course.getCurriculum(semesters[0], years[1]));
            session.setAttribute("sSemsYear", Course.getCurriculum(semesters[1], years[1]));
            session.setAttribute("fSemtYear", Course.getCurriculum(semesters[0], years[2]));

            rd = request.getRequestDispatcher("studentcurriculum.jsp");
            rd.forward(request, response);
        }//View deficiencies
        else if (request.getParameter("deficiencies") != null) {
            getDeficiencies(request, response);
        }//View availableCourses
        else if (request.getParameter("availableCourses") != null) {
            loadCourses(request, response);
        }//View ProposedSchedule
        else if (request.getParameter("proposedSchedule") != null) {
            loadStudentProposedSchedule(request, response);
        } //changepassword
        else if (request.getParameter("changePassword") != null) {
            session.setAttribute("message", null);
            rd = request.getRequestDispatcher("studentpassword.jsp");
            rd.forward(request, response);
        } //logout
        else if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession();
            if (!session.isNew()) {
                session.invalidate();
                rd = request.getRequestDispatcher("studentindex.jsp");
                rd.forward(request, response);
            }
        } //END OF NAV BAR BUTTONS
        //add course
        else if (request.getParameter("addToSchedule") != null) {

            Student currentStudent = (Student) session.getAttribute("currentStudent");
            String courseID = (String) request.getParameter("courseID");
            String courseSection = (String) request.getParameter("courseSection");

            System.out.println(courseID);
            System.out.println(courseSection);

            Course desiredCourse = Course.getCourse(courseID, courseSection);

            if (Student.addToMyProposedSchedule(desiredCourse, currentStudent)) {
                System.out.println("Successfully Added Schedule");
                loadStudentProposedSchedule(request, response);
            } else {
                session.setAttribute("errorMessage", Student.advisingErrorMessage);
                System.out.println("Fail to add schedule, schedule overlapping");
                rd = request.getRequestDispatcher("studentavailablecourses.jsp");
                rd.forward(request, response);
            }

        } //Remove Course
        else if (request.getParameter("removeFromSchedule") != null) {

            Student currentStudent = (Student) session.getAttribute("currentStudent");
            String courseID = (String) request.getParameter("courseID");
            String courseSection = (String) request.getParameter("courseSection");

            System.out.println(courseID);
            System.out.println(courseSection);

            Student.removeFromMySchedule(currentStudent, courseID, courseSection);
            loadStudentProposedSchedule(request, response);
        }//Reset Proposed Schedules
        else if (request.getParameter("resetSchedule") != null) {

            int sessionStudent = (Integer) session.getAttribute("studentNumber");
            Student.resetSchedule(sessionStudent);

            loadStudentProposedSchedule(request, response);
        }//Submit schedule
        else if (request.getParameter("submitSchedule") != null) {
            int sessionStudent = (Integer) session.getAttribute("studentNumber");
            Student.submitSchedule(sessionStudent);

            loadStudentProposedSchedule(request, response);
        } //Change Password Action
        else if (request.getParameter("changePasswordAction") != null) {
            int sessionStudent = (Integer) session.getAttribute("studentNumber");
            String oldPassword = (String) request.getParameter("oldPassword");
            String newPassword = (String) request.getParameter("newPassword");
            String confirmPassword = (String) request.getParameter("confirmPassword");
            String successMessage = "You have changed your password";
            String errorMessage = "Error in changing password";

            if (newPassword.equals(confirmPassword)) {
                if (Student.changePassword(sessionStudent, oldPassword, newPassword)) {
                    session.setAttribute("message", successMessage);
                    rd = request.getRequestDispatcher("studentpassword.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("message", errorMessage);
                    rd = request.getRequestDispatcher("studentpassword.jsp");
                    rd.forward(request, response);
                }
            }
        }

        try {
            sessionUser = (String) session.getAttribute("studentNumber");

        } catch (Exception e) {
            request.setAttribute("deadsession", true);
            rd = request.getRequestDispatcher("View/LogInPage.jsp");
            rd.forward(request, response);
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

    protected void loadStudentProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student currentStudent = (Student) session.getAttribute("currentStudent");
        System.out.println(currentStudent.getUserID());
        session.setAttribute("Student_ID", currentStudent.getUserID());
        session.setAttribute("Program", currentStudent.getProgram());
        session.setAttribute("Block", currentStudent.getBlock());
        session.setAttribute("College", currentStudent.getCollege());
        session.setAttribute("Current_Units", currentStudent.getCurrentUnits());
        session.setAttribute("Retention_Status", currentStudent.getRetentionStatus());
        session.setAttribute("Status", currentStudent.getStatus());
        session.setAttribute("First_Name", currentStudent.getFirstName());
        session.setAttribute("Last_Name", currentStudent.getLastName());
        session.setAttribute("Middle_Name", currentStudent.getMiddleName());
        session.setAttribute("Password", currentStudent.getPassword());
        session.setAttribute("Email", currentStudent.getEmail());
        session.setAttribute("Birthdate", currentStudent.getBirthdate());
        session.setAttribute("Student_Picture", currentStudent.getPicture());

        rd = request.getRequestDispatcher("studentprofile.jsp");
        rd.forward(request, response);
    }

    protected void loadCourses(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student currentStudent = (Student) session.getAttribute("currentStudent");
        ArrayList<Course> coursesList = Course.getCoursesList(currentStudent.getUserID());
        session.setAttribute("coursesList", coursesList);

        rd = request.getRequestDispatcher("studentavailablecourses.jsp");
        rd.forward(request, response);
    }

    protected void getDeficiencies(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student currentStudent = (Student) session.getAttribute("currentStudent");
        ArrayList<Course> deficienciesList = Student.getCourseDeficiency(currentStudent.getUserID());
        session.setAttribute("deficienciesList", deficienciesList);
        rd = request.getRequestDispatcher("studentdeficiencies.jsp");
        rd.forward(request, response);
    }

    protected void loadStudentProposedSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student currentStudent = (Student) session.getAttribute("currentStudent");

        ArrayList<Course> studentProposedSchedule = Student.getStudentSchedule(currentStudent.getUserID());
        session.setAttribute("hasSubmittedSchedule", Student.hasSubmittedSchedule(studentNumber));
        session.setAttribute("studentProposedSchedule", studentProposedSchedule);
        rd = request.getRequestDispatcher("studentproposedschedule.jsp");
        rd.forward(request, response);
    }

    protected void loadStudentMySchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student currentStudent = (Student) session.getAttribute("currentStudent");

        ArrayList<Course> studentMySchedule = Student.getMySchedule(currentStudent.getUserID());
        session.setAttribute("studentMySchedule", studentMySchedule);
        rd = request.getRequestDispatcher("studentmyschedule.jsp");
        rd.forward(request, response);
    }
}
