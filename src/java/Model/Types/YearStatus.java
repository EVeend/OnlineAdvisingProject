/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Types;

/**
 *
 * @author Laiza Marie
 */
public enum YearStatus {
    
    First(1), Second(2), Third(3), Fourth(4), Fifth(5);
    
    public final int year;
    
    private YearStatus(int year) {
        this.year = year;
    }
}
