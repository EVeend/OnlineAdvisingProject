package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author edward
 */
public class Course {

    private String courseID;
    private String courseName;
    private Integer courseLectUnits;
    private Integer courseLabUnits;
    private String Section;
    private String instructor;
    private ArrayList<String> prerequisite;
    private Integer availableSlot;
    private Integer maxSlot;
    private ArrayList<CourseSchedule> schedule;
    private Integer courseType;

    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;

    public Course() {
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getCourseLectUnits() {
        return courseLectUnits;
    }

    public void setCourseLectUnits(Integer courseLectUnits) {
        this.courseLectUnits = courseLectUnits;
    }

    public Integer getCourseLabUnits() {
        return courseLabUnits;
    }

    public void setCourseLabUnits(Integer courseLabUnits) {
        this.courseLabUnits = courseLabUnits;
    }

    public String getSection() {
        return Section;
    }

    public void setSection(String Block) {
        this.Section = Block;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public ArrayList<String> getPrerequisite() {
        return prerequisite;
    }

    public void setPrerequisite(ArrayList<String> prerequisite) {
        this.prerequisite = prerequisite;
    }

    public Integer getAvailableSlot() {
        return availableSlot;
    }

    public void setAvailableSlot(Integer availableSlot) {
        this.availableSlot = availableSlot;
    }

    public Integer getMaxSlot() {
        return maxSlot;
    }

    public void setMaxSlot(Integer maxSlot) {
        this.maxSlot = maxSlot;
    }

    public ArrayList<CourseSchedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(ArrayList<CourseSchedule> schedule) {
        this.schedule = schedule;
    }

    public Integer getCourseType() {
        return courseType;
    }

    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public static Course getCourse(String courseID, String section) {
        conn = DatabaseConnection.connectDatabase();
        String getCourseQuery = "select distinct Course_ID, Section, Instructor, AvailableSlot, MaxSlot from Available_Courses where Course_ID =(?) and Section =(?)";

        try {
            state = conn.prepareStatement(getCourseQuery);
            state.setString(1, courseID);
            state.setString(2, section);
            rs = state.executeQuery();

            if (rs.next()) {
                System.out.println("get Course method");
                Course courseDetails = getCourseDetails(rs.getString("Course_ID"));
                courseDetails.setSection(rs.getString("Section"));
                courseDetails.setAvailableSlot(rs.getInt("AvailableSlot"));
                courseDetails.setMaxSlot(rs.getInt("MaxSlot"));
                courseDetails.setInstructor(rs.getString("Instructor"));
                courseDetails.setSchedule(getSchedules(courseID, section));
                rs.close();
                return courseDetails;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Returns all available courses
    public static ArrayList<Course> getCoursesList() {

        conn = DatabaseConnection.connectDatabase();
        ArrayList<Course> courses = new ArrayList<>();
        String getAvailableCoursesQuery = "select distinct Course_ID, Section, Instructor, AvailableSlot, MaxSlot, CourseType from Available_Courses";
        System.out.println("Getting courses");
        try {
            state = conn.prepareStatement(getAvailableCoursesQuery);
            rs = state.executeQuery();
            while (rs.next()) {

                Course course = getCourseDetails(rs.getString("Course_ID"));
                course.setSection(rs.getString("Section"));
                course.setAvailableSlot(rs.getInt("AvailableSlot"));
                course.setMaxSlot(rs.getInt("MaxSlot"));
                course.setInstructor(rs.getString("Instructor"));
                course.setSchedule(getSchedules(rs.getString("Course_ID"), rs.getString("Section")));
                course.setCourseType(rs.getInt("CourseType"));
                courses.add(course);
            }
            rs.close();
            state.close();
            conn.close();
            return courses;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Returns all available courses that a student can take
    public static ArrayList<Course> getCoursesList(int studentID) {

        conn = DatabaseConnection.connectDatabase();
        ArrayList<Course> availableCourse = Course.getCoursesList();
        ArrayList<Course> courseDeficiencies = Student.getCourseDeficiency(studentID);
        ArrayList<Course> listOfCourses = new ArrayList<>();
        //String getAvailableCoursesQuery = "select distinct Course_ID, Section, Instructor, Slots from Available_Courses";
        System.out.println("Getting student courses");
        for (Course deficiencies : courseDeficiencies) {
            for (Course course : availableCourse) {
                if (deficiencies.getCourseID().equals(course.getCourseID()) && course.getAvailableSlot() != 0) {
                    listOfCourses.add(course);
                }
            }
        }
        return listOfCourses;
    }

    public static ArrayList<CourseSchedule> getSchedules(String courseID, String section) {
        Connection test = DatabaseConnection.connectDatabase();
        ArrayList<CourseSchedule> schedules = new ArrayList<>();
        String getCourseSchedule = "select Room, Day, Start_Time, End_Time from Available_Courses where Course_ID = (?) and Section = (?)";

        try {
            PreparedStatement pState = test.prepareStatement(getCourseSchedule);
            pState.setString(1, courseID);
            pState.setString(2, section);
            ResultSet rSet = pState.executeQuery();

            while (rSet.next()) {
                CourseSchedule courseSched = new CourseSchedule(rSet.getString("Room"), rSet.getString("Day"),
                        rSet.getString("Start_Time"), rSet.getString("End_Time"));
                schedules.add(courseSched);
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

    public static Course getCourseDetails(String courseID) {

        Connection test = DatabaseConnection.connectDatabase();
        Course courseDetails = new Course();
        String getCourseDetails = "select * from Course where Course_ID =(?)";

        try {
            PreparedStatement pState = test.prepareStatement(getCourseDetails);
            pState.setString(1, courseID);
            ResultSet rSet = pState.executeQuery();

            if (rSet.next()) {
                courseDetails.setCourseID(courseID);
                courseDetails.setCourseName(rSet.getString("Course_Name"));
                //courseDetails.setPrerequisite(rSet.getString("Prerequisite"));
                courseDetails.setCourseLectUnits(rSet.getInt("Lec_Units"));
                courseDetails.setCourseLabUnits(rSet.getInt("Lab_Units"));
            }
            rSet.close();
            pState.close();
            test.close();
            return courseDetails;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ArrayList<Course> getCurriculum(String semester, String year) {

        conn = DatabaseConnection.connectDatabase();
        ArrayList<Course> courses = new ArrayList<>();
        String getECECurriculumQuery = "select distinct Course_ID from Curriculum where Semester = (?) and Year = (?)";

        try {
            state = conn.prepareStatement(getECECurriculumQuery);
            state.setString(1, semester);
            state.setString(2, year);
            rs = state.executeQuery();

            while (rs.next()) {
                Course courseDetails = getCourseDetails(rs.getString("Course_ID"));
                courseDetails.setPrerequisite(getCoursePrerequisite(rs.getString("Course_ID")));
                courses.add(courseDetails);
            }
            rs.close();
            state.close();
            conn.close();
            return courses;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static ArrayList<String> getCoursePrerequisite(String courseID) {

        Connection test = DatabaseConnection.connectDatabase();
        ArrayList<String> coursePrerequisute = new ArrayList<>();
        String getCoursePrerequisiteQuery = "select Prerequisite from ECECurriculum where Course_ID = (?)";

        try {
            PreparedStatement pState = test.prepareStatement(getCoursePrerequisiteQuery);
            pState.setString(1, courseID);
            ResultSet rSet = pState.executeQuery();

            while (rSet.next()) {
                coursePrerequisute.add(rSet.getString("Prerequisite"));
            }
            rSet.close();
            pState.close();
            test.close();
            return coursePrerequisute;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void openOneSlot(String courseID, String section) {
        String updateCourseQuery = "UPDATE Available_Courses SET AvailableSlot = (?) Where Course_ID = (?) and Section = (?)";
        Connection test;
        test = DatabaseConnection.connectDatabase();
        //Open 1 slot
        try {
            Course courseSlots = Course.getCourse(courseID, section);
            state = test.prepareStatement(updateCourseQuery);
            state.setInt(1, courseSlots.getAvailableSlot() + 1);
            state.setString(2, courseID);
            state.setString(3, section);
            state.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
