package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author edward
 */
public class Adviser extends User {

    //Adviser variables
    private String department;
    private String rank;

    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;
    
    static Connection test;
    static PreparedStatement pState;
    static ResultSet rSet;

    public Adviser() {
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    //Check if students exist
    public static boolean isUser(int teacherID, String password) {
        conn = DatabaseConnection.connectDatabase();
        String loginQuery = "select * from Adviser where Teacher_ID = (?) and Password = (?)";
        int active = 1;
        try {
            state = conn.prepareStatement(loginQuery);
            state.setInt(1, teacherID);
            state.setString(2, password);
            rs = state.executeQuery();
            while (rs.next()) {
                if (rs.getInt("AccountStatus") == active) {
                    if (rs.getInt("Teacher_ID") == teacherID && rs.getString("Password").equals(password)) {
                        rs.close();
                        state.close();
                        conn.close();
                        return true;
                    }
                }
            }
            rs.close();
            state.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //View Profile
    public static Adviser getEmployeeProfile(int teacherID) {
        conn = DatabaseConnection.connectDatabase();
        Adviser adviserProfile = new Adviser();
        String getProfileQuery = "select * from Adviser where Teacher_ID = (?)";
        try {
            state = conn.prepareStatement(getProfileQuery);
            state.setInt(1, teacherID);
            rs = state.executeQuery();

            if (rs.next()) {
                byte[] encodeBase64 = Base64.encodeBase64(rs.getBytes("Advisor_Picture"));
                String base64Encoded = new String(encodeBase64, "UTF-8");

                adviserProfile.setUserID(teacherID);
                adviserProfile.setDepartment(rs.getString("Department"));
                adviserProfile.setCollege(rs.getString("College"));
                adviserProfile.setRank(rs.getString("Rank"));
                adviserProfile.setFirstName(rs.getString("First_Name"));
                adviserProfile.setLastName(rs.getString("Last_Name"));
                adviserProfile.setMiddleName(rs.getString("Middle_Name"));
                adviserProfile.setPassword(rs.getString("Password"));
                adviserProfile.setEmail(rs.getString("Email"));
                adviserProfile.setBirthdate(rs.getString("Birthdate"));
                adviserProfile.setPicture(base64Encoded);

            }
            rs.close();
            state.close();
            conn.close();
            return adviserProfile;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ArrayList<Student> getStudentProposedSchedule(){
        
        conn = DatabaseConnection.connectDatabase();
        ArrayList<Student> proposedSchedList = new ArrayList<>();
        
        String getProposedScheduleList = "Select * from Submited_Schedule where Status = 'Proposed'";
        
        try{
            state = conn.prepareStatement(getProposedScheduleList);
            rs = state.executeQuery();
            
            while(rs.next()){
                Student student = new Student();
                student.setUserID(rs.getInt("Student_ID"));
                student.setStudentSchedule(Student.getStudentSchedule(rs.getInt("Student_ID")));
                proposedSchedList.add(student);
                //proposedSchedList.add(rs.getInt("Student_ID"));
            }
            rs.close();
            state.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return proposedSchedList;
    }
    
    public static boolean evaluateSchedule(int adviserID, int studentID, String evaluation, String remark){
        
        conn = DatabaseConnection.connectDatabase();
        //String approveSchedule = "Select * from Submited_Schedule where Status = 'Proposed'";
        String evaluateSchedule = "Update Submited_Schedule set Status = (?), Remark =(?) where Student_ID = (?)";
        String evaluateStudentSchedStatus = "Update Student_Schedule set Status =(?) where Student_ID = (?)";
        
        try{
            //Update student proposed schedule table
            state = conn.prepareStatement(evaluateSchedule);
            state.setString(1, evaluation);
            state.setString(2, remark);
            state.setInt(3, studentID);
            state.executeUpdate();
            
            //Update student myschedule status
            pState = test.prepareStatement(evaluateStudentSchedStatus);
            pState.setString(1, evaluation);
            pState.setInt(2, studentID);
            pState.executeUpdate();
            
            pState.close();
            state.close();
            test.close();
            conn.close();
            
            Student.resetSchedule(studentID);
            return true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
