/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Model.Types.RemarkType;

/**
 *
 * @author Laiza Marie
 */
public class CourseTaken extends User {
    
    public static int studentID;
    public static String courseID;
    public static double grade;
    public static RemarkType remarkType;
    
    public CourseTaken(){
        
    }
    
    public static int getStudentID() {
        return studentID;
    }

    public static void setStudentID(int studentID) {
        CourseTaken.studentID = studentID;
    }
    
    public static String getCourseID() {
        return courseID;
    }

    public static void setCourseID(String courseID) {
        CourseTaken.courseID = courseID;
    }
    
    public static double getGrade() {
        return grade;
    }

    public static void setGrade(double Grade) {
        CourseTaken.grade = grade;
    }
    
    public static RemarkType getRemarkType() {
        return remarkType;
    }

    public static void setRemarkType(RemarkType remarkType) {
        CourseTaken.remarkType = remarkType;
    }
    
}
