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
public enum Term {
    
    First(1), Second(2), Third(3);
    
    public final int term;
    
    private Term(int term) {
        this.term = term;
    }
    
}
