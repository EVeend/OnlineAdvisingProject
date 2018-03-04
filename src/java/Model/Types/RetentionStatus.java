/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Types;

/**
 *
 * @author edwar
 */
public enum RetentionStatus {

    Regular(1), Irregular(2), Conditional(3), Debarred(4);

    public final int retentionType;

    private RetentionStatus(int retentionType) {
        this.retentionType = retentionType;
    }
    
    
}
