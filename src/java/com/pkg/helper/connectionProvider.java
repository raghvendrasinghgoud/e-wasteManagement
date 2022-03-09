package com.pkg.helper;
import java.sql.*;

public class connectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
        if(con==null){
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ewastemanagement","root","Raghav@123");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
