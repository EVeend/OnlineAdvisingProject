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
public enum RemarkType {
    
    PASSED(1), FAILED(2), INCOMPLETE(3);
    
    public final int remarkType;

    private RemarkType(int remarkType) {
        this.remarkType = remarkType;
    }
    
}
