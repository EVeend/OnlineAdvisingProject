/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author edward
 */
public class DatabaseConnection {

    public static Connection connectDatabase(){
        try{
            String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            
            String dbURL = "jdbc:sqlserver://localhost\\MSSQLSERVER:1433;databaseName=Online_Advising";
            Connection test;

            Class.forName(dbDriver);
            test = DriverManager.getConnection(dbURL, "Admin", "admin");
            return test;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
