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
public enum PaymentStatus {
    
    PAID(1), UNPAID(2);
    
    public final int paymentStatus;
    
    private PaymentStatus(int paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
}
