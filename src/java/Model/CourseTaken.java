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
public class CourseTaken extends User{
    
    private String courseID;
    private Double grade;
    private RemarkType remarkType;
    private Term term;
    private YearStatus yearStatus;

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(Double grade) {
        this.grade = grade;
    }

    public RemarkType getRemarkType() {
        return remarkType;
    }

    public void setRemarkType(RemarkType remarkType) {
        this.remarkType = remarkType;
    }

    public Term getTerm() {
        return term;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public YearStatus getYearStatus() {
        return yearStatus;
    }

    public void setYearStatus(YearStatus yearStatus) {
        this.yearStatus = yearStatus;
    }

    
}
