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
public enum AccountStatus {

    Active(1), Inactive(2);

    public final int accountType;

    private AccountStatus(int accountType) {
        this.accountType = accountType;
    }
    
    
}