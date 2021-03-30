/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DieuHuyen
 */
public class Connect {
    public Connection getConnect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mycoffee?zeroDateTimeBehavior=convertToNull";
            return DriverManager.getConnection(url, "****", "******");
        } catch (Exception e) {}
        return null;
    }
}
