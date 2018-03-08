/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Model.Types.*;

/**
 *
 * @author Laiza Marie
 */
public class CourseTaken extends User {
    
    public static int studentID;
    public static String courseID;
    public static Float grade;
    public static RemarkType remarkType;
    public static Term term;
    public static YearStatus year;
    
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
    
    public static Float getGrade() {
        return grade;
    }

    public static void setGrade(Float Grade) {
        CourseTaken.grade = grade;
    }
    
    public static RemarkType getRemarkType() {
        return remarkType;
    }

    public static void setRemarkType(RemarkType remarkType) {
        CourseTaken.remarkType = remarkType;
    }
    
    public static Term getTerm() {
        return term;
    }
    
    public static void setTerm(Term term) {
        CourseTaken.term = term;
    }
    
    public static YearStatus getYearStatus() {
        return year;
    }
    
    public static void setYearStatus(YearStatus year) {
        CourseTaken.year = year;
    }
    
}
