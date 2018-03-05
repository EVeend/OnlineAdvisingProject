/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import static Model.Student.rs;
import static Model.Adviser.rs;
import Model.Types.AccountStatus;
import Model.Types.RetentionStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
/**
 *
 * @author Laiza Marie
 */
public class Admin extends User {
    
    //Database Connection
    static Connection conn;
    static PreparedStatement state;
    static ResultSet rs;

    static Connection test;
    static PreparedStatement pState;
    static ResultSet rSet;
    
    public Admin() {
    }
    
    //Check if admin exists
    public static boolean isUser(int adminID, String password) {
        conn = DatabaseConnection.connectDatabase();
        String loginQuery = "select * from Admin where Admin_ID = (?) and Password = (?)";
        int active = 1;
        try {
            state = conn.prepareStatement(loginQuery);
            state.setInt(1, adminID);
            state.setString(2, password);
            rs = state.executeQuery();
            while (rs.next()) {
                if (rs.getInt("AccountStatus") == active) {
                    if (rs.getInt("admin_ID") == adminID && rs.getString("Password").equals(password)) {
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
    public static Admin getAdminProfile(int adminID) {
        conn = DatabaseConnection.connectDatabase();
        Admin adminProfile = new Admin();
        String getProfileQuery = "select * from Admin where Admin_ID = (?)";
        try {
            state = conn.prepareStatement(getProfileQuery);
            state.setInt(1, adminID);
            rs = state.executeQuery();

            if (rs.next()) {

                adminProfile.setUserID(adminID);
                adminProfile.setFirstName(rs.getString("First_Name"));
                adminProfile.setLastName(rs.getString("Last_Name"));
                adminProfile.setMiddleName(rs.getString("Middle_Name"));
                adminProfile.setPassword(rs.getString("Password"));
                adminProfile.setEmail(rs.getString("Email"));
                adminProfile.setBirthdate(rs.getString("Birthdate"));
                adminProfile.setPicture(rs.getString("Admin_Picture"));

            }
            rs.close();
            state.close();
            conn.close();
            return adminProfile;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
    
    public static ArrayList<Adviser> getFacultyList(){
        
        conn = DatabaseConnection.connectDatabase();
        ArrayList<Adviser> facultyList = new ArrayList<>();
        
        String getFacultyList = "Select * from Adviser";
        try{
            state = conn.prepareStatement(getFacultyList);
            rs = state.executeQuery();
            
            while(rs.next()){
                Adviser facultyDetails = new Adviser();
                facultyDetails.setUserID(rs.getInt("Adviser_ID"));
                facultyDetails.setLastName(rs.getString("Last_Name"));
                facultyDetails.setFirstName(rs.getString("First_Name"));
                facultyDetails.setCollege(rs.getString("College"));
                facultyDetails.setDepartment(rs.getString("Department"));
                facultyDetails.setRank(rs.getString("Rank"));
                switch (rs.getInt("AccountStatus")) {
                    case 1:
                        facultyDetails.setAccountStatus(AccountStatus.Active);
                        break;
                    case 2:
                        facultyDetails.setAccountStatus(AccountStatus.Inactive);
                        break;
                }
                facultyList.add(facultyDetails);
                //proposedSchedList.add(rs.getInt("Student_ID"));
            }
            rs.close();
            state.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return facultyList;
    }
    
}
