/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author edwar
 */
public class Student extends User {

    //Student variables
    private String program;
    private String block;
    private int currentUnits;
    private int retentionStatus;
    private int status;
    private ArrayList<Course> backSubjects;
    private ArrayList<Course> studentSchedule;
    private int term;
    private int year;

    //Error Message
    public static String advisingErrorMessage;

    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;

    static Connection test;
    static PreparedStatement pState;
    static ResultSet rSet;

    public Student() {
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public int getCurrentUnits() {
        return currentUnits;
    }

    public void setCurrentUnits(int currentUnits) {
        this.currentUnits = currentUnits;
    }

    public int getRetentionStatus() {
        return retentionStatus;
    }

    public void setRetentionStatus(int retentionStatus) {
        this.retentionStatus = retentionStatus;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ArrayList<Course> getBackSubjects() {
        return backSubjects;
    }

    public void setBackSubjects(ArrayList<Course> backSubjects) {
        this.backSubjects = backSubjects;
    }

    public ArrayList<Course> getStudentSchedule() {
        return studentSchedule;
    }

    public void setStudentSchedule(ArrayList<Course> studentSchedule) {
        this.studentSchedule = studentSchedule;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    

    public static Student getStudent(int studentNumber, String password) {
        conn = DatabaseConnection.connectDatabase();
        String getStudentQuery = "select * from Student where Student_Id = (?) and password = (?)";
        Student student = new Student();
        
        try {
            state = conn.prepareStatement(getStudentQuery);
            state.setInt(1, studentNumber);
            state.setString(2, password);
            rs = state.executeQuery();

            if (rs.next()) {
                byte[] encodeBase64 = Base64.encodeBase64(rs.getBytes("Student_Picture"));
                String base64Encoded = new String(encodeBase64, "UTF-8");

                student.setUserID(studentNumber);
                student.setProgram(rs.getString("Program"));
                student.setCollege(rs.getString("College"));
                student.setBlock(rs.getString("Block"));
                student.setCurrentUnits(rs.getInt("Current_Units"));
                student.setRetentionStatus(rs.getInt("Retention_Status"));
                student.setStatus(rs.getInt("Status"));
                student.setFirstName(rs.getString("First_Name"));
                student.setLastName(rs.getString("Last_Name"));
                student.setMiddleName(rs.getString("Middle_Name"));
                student.setPassword(rs.getString("Password"));
                student.setEmail(rs.getString("Email"));
                student.setBirthdate(rs.getString("Birthdate"));
                student.setStudentSchedule(getStudentSchedule(studentNumber));
                student.setAccountStatus(rs.getInt("AccountStatus"));
                student.setTerm(rs.getInt("Term"));
                student.setYear(rs.getInt("Year"));
                student.setPicture(base64Encoded);

            }
            rs.close();
            state.close();
            conn.close();
            return student;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    //Check if students exist
//    public static String isIrregular(int studentNumber, String password) {
//        conn = DatabaseConnection.connectDatabase();
//        String loginQuery = "select * from Student where Student_Id = (?) and password = (?)";
//        String active = "Active";
//        try {
//            state = conn.prepareStatement(loginQuery);
//            state.setInt(1, studentNumber);
//            state.setString(2, password);
//            rs = state.executeQuery();
//            while (rs.next()) {
//                if (rs.getInt("Student_ID") == studentNumber && rs.getString("password").equals(password)) {
//                    if (rs.getString("AccountStatus").equals(active)) {
//                        if (rs.getString("Retention_Status").equals("Irregular") || rs.getString("Retention_Status").equals("Conditional")) {
//                            rs.close();
//                            state.close();
//                            conn.close();
//                            return "user";
//                        } else {
//                            return "regularStudent";
//                        }
//                    }
//                }
//            }
//            rs.close();
//            state.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println(e.toString());
//        }
//        return "noUser";
//    }
//
//    //View Profile
//    public static Student getStudentProfile(int studentID) {
//        conn = DatabaseConnection.connectDatabase();
//        Student studentProfile = new Student();
//        String getProfileQuery = "select * from Student where Student_ID = (?)";
//        try {
//            state = conn.prepareStatement(getProfileQuery);
//            state.setInt(1, studentID);
//            rs = state.executeQuery();
//
//            if (rs.next()) {
//                byte[] encodeBase64 = Base64.encodeBase64(rs.getBytes("Student_Picture"));
//                String base64Encoded = new String(encodeBase64, "UTF-8");
//
//                studentProfile.setUserID(studentID);
//                studentProfile.setProgram(rs.getString("Program"));
//                studentProfile.setCollege(rs.getString("College"));
//                studentProfile.setBlock(rs.getString("Block"));
//                studentProfile.setCurrentUnits(rs.getInt("Current_Units"));
//                studentProfile.setRetentionStatus(rs.getInt("Retention_Status"));
//                studentProfile.setStatus(rs.getInt("Status"));
//                studentProfile.setFirstName(rs.getString("First_Name"));
//                studentProfile.setLastName(rs.getString("Last_Name"));
//                studentProfile.setMiddleName(rs.getString("Middle_Name"));
//                studentProfile.setPassword(rs.getString("Password"));
//                studentProfile.setEmail(rs.getString("Email"));
//                studentProfile.setBirthdate(rs.getString("Birthdate"));
//                studentProfile.setStudentSchedule(getStudentSchedule(studentID));
//                studentProfile.setPicture(base64Encoded);
//
//            }
//            rs.close();
//            state.close();
//            conn.close();
//            return studentProfile;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
    public static ArrayList<Course> getCourseDeficiency(int studentID) {
        conn = DatabaseConnection.connectDatabase();
        ArrayList<Course> deficiencies = new ArrayList<>();
        String getCourseDeficiencyQuery = "select * from Student_Back_Subjects where Student_ID = (?)";

        try {
            state = conn.prepareStatement(getCourseDeficiencyQuery);
            state.setInt(1, studentID);
            rs = state.executeQuery();

            while (rs.next()) {
                Course courseDetails = Course.getCourseDetails(rs.getString("Course_ID"));
                deficiencies.add(courseDetails);
            }
            rs.close();
            state.close();
            conn.close();
            return deficiencies;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Adds a course to the student's schedule
    //Returns true if success; else return false
    public static boolean addToMySchedule(Course desiredCourse, Student currentStudent) {
        ArrayList<Course> schedule = currentStudent.getStudentSchedule();

        if (schedule.isEmpty() || isQualified(currentStudent, desiredCourse)) {
            currentStudent.getStudentSchedule().add(desiredCourse);

            conn = DatabaseConnection.connectDatabase();
            String getCourseDeficiencyQuery = "Insert into Student_Schedule(Student_ID, Course_ID, Section, Status) Values(?, ?, ?, ?)";
            String updateCourseQuery = "UPDATE Available_Courses SET Slots = (?) Where Course_ID = (?) and Section = (?)";
            String status = "NotSubmitted";

            try {
                //Adds Subject
                state = conn.prepareStatement(getCourseDeficiencyQuery);
                state.setInt(1, currentStudent.getUserID());
                state.setString(2, desiredCourse.getCourseID());
                state.setString(3, desiredCourse.getSection());
                state.setString(4, status);
                state.executeUpdate();
                

                //Update Subject
                pState = conn.prepareStatement(updateCourseQuery);
                Course courseSlots = Course.getCourse(desiredCourse.getCourseID(), desiredCourse.getSection());
                pState.setInt(1, courseSlots.getSlot() - 1);
                pState.setString(2, desiredCourse.getCourseID());
                pState.setString(3, desiredCourse.getSection());
                pState.executeUpdate();

                rs.close();
                state.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            return true;
        }
        return false;

    }

    public static ArrayList<Course> getStudentSchedule(int studentID) {
        test = DatabaseConnection.connectDatabase();
        ArrayList<Course> schedules = new ArrayList<>();
        String getStudentScheduleQuery = "select * from Student_Schedule where Student_ID = (?)";

        try {
            pState = test.prepareStatement(getStudentScheduleQuery);
            pState.setInt(1, studentID);
            rSet = pState.executeQuery();

            while (rSet.next()) {
                Course course = Course.getCourseDetails(rSet.getString("Course_ID"));
                course.setCourseID(rSet.getString("Course_ID"));
                course.setSection(rSet.getString("Section"));
                course.setSchedule(Course.getSchedules(rSet.getString("Course_ID"), rSet.getString("Section")));
                schedules.add(course);
            }
            rSet.close();
            pState.close();
            test.close();
            return schedules;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Removes a course from the student's schedule
    public static void removeFromMySchedule(int studentID, String courseID, String section) {

        conn = DatabaseConnection.connectDatabase();
        String removeCourseQuery = "DELETE FROM Student_Schedule WHERE Student_ID = (?) and Course_ID = (?)";
        String updateCourseQuery = "UPDATE Available_Courses SET Slots = (?) Where Course_ID = (?) and Section = (?)";
        try {
            //Removes Subject
            state = conn.prepareStatement(removeCourseQuery);
            state.setInt(1, studentID);
            state.setString(2, courseID);
            state.executeUpdate();

            //Open 1 slot
            pState = conn.prepareStatement(updateCourseQuery);
            Course courseSlots = Course.getCourse(courseID, section);
            pState.setInt(1, courseSlots.getSlot() + 1);
            pState.setString(2, courseID);
            pState.setString(3, section);
            pState.executeUpdate();

            state.close();
            pState.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //Returns a specific course from the student's schedule

    //Resets schedule
    public static void resetSchedule(int studentID) {
        conn = DatabaseConnection.connectDatabase();
        String resetCourse = "DELETE FROM Student_Schedule WHERE Student_ID = (?)";
        try {
            //Removes Subject
            state = conn.prepareStatement(resetCourse);
            state.setInt(1, studentID);
            state.executeUpdate();
            state.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Submits schedule
    public static void submitSchedule(int studentID) {
        conn = DatabaseConnection.connectDatabase();
        ArrayList<Course> studentProposedSchedule = Student.getStudentSchedule(studentID);
        String status = "Proposed";
        String updateStudentSchedStatus = "Update Student_Schedule set Status = (?) where Student_ID = (?)";
        String submitScheduleQuery = "Insert into Submited_Schedule(Student_ID, Course_ID, Block, Status) Values(?, ?, ?, ?)";

        if (!hasSubmittedSchedule(studentID)) {
            try {
                state = conn.prepareStatement(submitScheduleQuery);
                for (Course course : studentProposedSchedule) {
                    state.setInt(1, studentID);
                    state.setString(2, course.getCourseID());
                    state.setString(3, course.getSection());
                    state.setString(4, status);
                    state.executeUpdate();
                }
                pState = test.prepareStatement(updateStudentSchedStatus);
                pState.setString(1, status);
                pState.setInt(2, studentID);
                pState.executeUpdate();

                state.close();
                pState.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //Check if student has submitted a schedule
    public static boolean hasSubmittedSchedule(int studentID) {
        test = DatabaseConnection.connectDatabase();
        String hasSubmittedScheduleQuery = "select * from Submited_Schedule where Student_ID = (?)";

        try {
            pState = test.prepareStatement(hasSubmittedScheduleQuery);
            pState.setInt(1, studentID);
            rSet = pState.executeQuery();
            if (rSet.next()) {
                return true;
            }
            rSet.close();
            pState.close();
            test.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Change password
    public static boolean changePassword(int studentID, String oldPassword, String newPassword) {
        conn = DatabaseConnection.connectDatabase();
        String checkPassword = "select Password from Student where Student_ID = (?)";
        String changePasswordQuery = "update Student set Password = (?) where Student_ID = (?) and Password = (?)";

        try {
            state = conn.prepareStatement(checkPassword);
            state.setInt(1, studentID);
            rs = state.executeQuery();
            if (rs.next()) {
                state = conn.prepareStatement(changePasswordQuery);
                state.setString(1, newPassword);
                state.setInt(2, studentID);
                state.setString(3, oldPassword);
                state.executeUpdate();
                return true;
            }
            rs.close();
            state.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static ArrayList<Course> getMySchedule(int studentID) {
        test = DatabaseConnection.connectDatabase();
        ArrayList<Course> schedules = new ArrayList<>();
        String status = "Approve";
        String getStudentScheduleQuery = "select * from Student_Schedule where Student_ID = (?) and Status = (?)";

        try {
            pState = test.prepareStatement(getStudentScheduleQuery);
            pState.setInt(1, studentID);
            pState.setString(2, status);
            rSet = pState.executeQuery();

            while (rSet.next()) {
                Course course = Course.getCourseDetails(rSet.getString("Course_ID"));
                course.setCourseID(rSet.getString("Course_ID"));
                course.setSection(rSet.getString("Section"));
                course.setSchedule(Course.getSchedules(rSet.getString("Course_ID"), rSet.getString("Section")));
                schedules.add(course);
            }
            rSet.close();
            pState.close();
            test.close();
            return schedules;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Check if overlapping
    //Returns true if overlapping, else false
    public static boolean isQualified(Student student, Course desiredCourse) {

        System.out.println("Check overlapping");
        SimpleDateFormat parser = new SimpleDateFormat("H:mm a");
        System.out.println(desiredCourse.getCourseID());
        System.out.println(desiredCourse.getSection());

        ArrayList<Course> studentSchedule = student.getStudentSchedule();
        ArrayList<CourseSchedule> desiredCourseSchedule = Course.getSchedules(desiredCourse.getCourseID(), desiredCourse.getSection());

        //Check if student already passed prerequisite subject
        //Check if there are available slots
        if (desiredCourse.getSlot() == 0) {
            return false;
        }
        for (Course c : studentSchedule) {

            try {

                //Student's Current Schedule
                ArrayList<CourseSchedule> studentCourseSchedule = Course.getSchedules(c.getCourseID(), c.getSection());

                //Desired Course Time
                for (CourseSchedule sc : studentCourseSchedule) {
                    Date studentCourseStartTime = parser.parse(sc.getStartTime());
                    System.out.println(studentCourseStartTime);
                    Date studentCourseEndTime = parser.parse(sc.getEndTime());
                    System.out.println(studentCourseEndTime);
                    String studentCourseDay = sc.getDay();
                    System.out.println(studentCourseDay);

                    for (CourseSchedule desiredSched : desiredCourseSchedule) {
                        Date desiredCourseStartTime = parser.parse(desiredSched.getStartTime());
                        System.out.println(desiredCourseStartTime);
                        Date desiredCourseEndTime = parser.parse(desiredSched.getEndTime());
                        System.out.println(desiredCourseEndTime);

                        //Check if student is already enlisted in the same course from a different block
                        /*System.out.println("C: " + c.getCourseID());
                        System.out.println("D: " + desiredCourse.getCourseID());*/
                        if (c.getCourseID().equals(desiredCourse.getCourseID())) {
                            advisingErrorMessage = "Already in the same subject";
                            System.out.println("Already in the same subject");
                            return false;
                        }
                        //First check; if it has the same time 
                        if (desiredCourseEndTime.equals(studentCourseEndTime) && desiredCourseStartTime.equals(studentCourseStartTime) && desiredSched.getDay().equals(sc.getDay())) {
                            advisingErrorMessage = "has the same time ";
                            System.out.println("has the same time ");
                            return false;
                        }
                        //Second check; if it starts before and ends during another course
                        if (desiredCourseStartTime.before(studentCourseStartTime) && desiredCourseEndTime.before(studentCourseEndTime) && desiredSched.getDay().equals(sc.getDay())) {
                            advisingErrorMessage = "starts before and ends during another course";
                            System.out.println("starts before and ends during another course");
                            return false;
                        }
                        //Third Check; if it starts before a course and ends at the same time
                        if (desiredCourseStartTime.before(studentCourseStartTime) && desiredCourseEndTime.equals(studentCourseEndTime) && desiredSched.getDay().equals(sc.getDay())) {
                            advisingErrorMessage = "starts before a course and ends at the same time";
                            System.out.println("starts before a course and ends at the same time");
                            return false;
                        }
                        //Fourth Check; if it starts after a course and ends during the course
                        if (desiredCourseStartTime.after(studentCourseStartTime) && desiredCourseEndTime.before(studentCourseEndTime) && desiredSched.getDay().equals(sc.getDay())) {
                            advisingErrorMessage = "starts after a course and ends during the course";
                            System.out.println("starts after a course and ends during the course");
                            return false;
                        }
                        //Fifth Check; if it starts after a course and ends the same time with the course
                        if (desiredCourseStartTime.after(studentCourseStartTime) && desiredCourseEndTime.equals(studentCourseEndTime) && desiredSched.getDay().equals(sc.getDay())) {
                            advisingErrorMessage = "starts after a course and ends the same time with the course";
                            System.out.println("starts after a course and ends the same time with the course");
                            return false;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

}
