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
public enum StudentStatus {
    OnGoing(1), Completed(2), Graduated(3), Discontinued(4), Temporary(5), HonorableDi(6), Cancelled(4);

    public final int statusType;

    private StudentStatus(int statusType) {
        this.statusType = statusType;
    }

}
