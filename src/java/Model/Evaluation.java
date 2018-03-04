/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author edwar
 */
public class Evaluation {

    //
    private static String evaluation;
    private static String remarks;

    public Evaluation() {
    }

    public static String getEvaluation() {
        return evaluation;
    }

    public static void setEvaluation(String evaluation) {
        Evaluation.evaluation = evaluation;
    }

    public static String getRemarks() {
        return remarks;
    }

    public static void setRemarks(String remarks) {
        Evaluation.remarks = remarks;
    }

}
