package Model;

import static Model.Student.rs;
import Model.Types.AccountStatus;
import Model.Types.RetentionStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
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

    //Check if adviser exists
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
                adviserProfile.setPicture(rs.getString("Advisor_Picture"));
                
                //Set Account Status
                //Set Account Status
                switch (rs.getInt("AccountStatus")) {
                    case 1:
                        adviserProfile.setAccountStatus(AccountStatus.Active);
                        break;
                    case 2:
                        adviserProfile.setAccountStatus(AccountStatus.Inactive);
                        break;
                }

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

    public static Set<Integer> getUniqueStudentProposedSchedule() {

        conn = DatabaseConnection.connectDatabase();
        ArrayList<Integer> proposedSchedList = new ArrayList<>();

        String getProposedScheduleList = "Select * from Student_Schedule where Status = (?)";
        int forApprovalStatus = 3;
        try {
            state = conn.prepareStatement(getProposedScheduleList);
            state.setInt(1, forApprovalStatus);
            rs = state.executeQuery();

            while (rs.next()) {
                proposedSchedList.add(rs.getInt("Student_ID"));
                //proposedSchedList.add(rs.getInt("Student_ID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Set<Integer> uniqueProposedSched = new HashSet<Integer>(proposedSchedList);
        return uniqueProposedSched;
    }

    public static ArrayList<Student> getStudentProposedSchedule() {
        
        conn = DatabaseConnection.connectDatabase();
        Set<Integer> propSchedSet = getUniqueStudentProposedSchedule();
        ArrayList<Integer> proposedSchedList = new ArrayList<>(propSchedSet);
        ArrayList<Student> outputList = new ArrayList<>();
        String getProposedScheduleList = "Select * from Student_Schedule where Status = (?)";
        int forApprovalStatus = 3;
        try {
            state = conn.prepareStatement(getProposedScheduleList);
            state.setInt(1, forApprovalStatus);
            rs = state.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setUserID(rs.getInt("Student_ID"));
                student.setStudentSchedule(Student.getStudentSchedule(rs.getInt("Student_ID")));
                outputList.add(student);
                //proposedSchedList.add(rs.getInt("Student_ID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return outputList;

    }

    public static boolean evaluateSchedule(int adviserID, int studentID, String evaluation, String remark) {

        conn = DatabaseConnection.connectDatabase();
        //String approveSchedule = "Select * from Submited_Schedule where Status = 'Proposed'";
        String evaluateStudentSchedStatus = "Update Student_Schedule set Status =(?), Remark = (?) where Student_ID = (?)";
        int adviserEvaluation = 0;

        switch (evaluation) {
            case "APPROVE":
                adviserEvaluation = 2;
                break;
            case "REJECTED":
                adviserEvaluation = 5;
                break;
        }

        try {
            //Update student proposed schedule table
            state = conn.prepareStatement(evaluateStudentSchedStatus);
            state.setInt(1, adviserEvaluation);
            state.setString(2, remark);
            state.setInt(3, studentID);
            state.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static ArrayList<Student> getStudentList(){
        
        conn = DatabaseConnection.connectDatabase();
        ArrayList<Student> studentList = new ArrayList<>();
        
        String getStudentList = "Select * from Student";
        try{
            state = conn.prepareStatement(getStudentList);
            rs = state.executeQuery();
            
            while(rs.next()){
                Student studentDetails = new Student();
                studentDetails.setUserID(rs.getInt("Student_ID"));
                studentDetails.setLastName(rs.getString("Last_Name"));
                studentDetails.setFirstName(rs.getString("First_Name"));
                studentDetails.setYear(rs.getInt("Year"));
                studentDetails.setCollege(rs.getString("College"));
                studentDetails.setProgram(rs.getString("Program"));
                studentDetails.setBlock(rs.getString("Block"));
                studentDetails.setPaymentStatus(rs.getInt("PaymentStatus"));
                switch (rs.getInt("Retention_Status")) {
                    case 1:
                        studentDetails.setRetentionStatus(RetentionStatus.Regular);
                        break;
                    case 2:
                        studentDetails.setRetentionStatus(RetentionStatus.Irregular);
                        break;
                    case 3:
                        studentDetails.setRetentionStatus(RetentionStatus.Conditional);
                        break;
                    case 4:
                        studentDetails.setRetentionStatus(RetentionStatus.Debarred);
                        break;
                }
                studentList.add(studentDetails);
                //proposedSchedList.add(rs.getInt("Student_ID"));
            }
            rs.close();
            state.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return studentList;
    }
}
