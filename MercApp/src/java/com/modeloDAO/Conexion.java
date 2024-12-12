package com.modeloDAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Connection getConnection(){
        try{
            String URL = "jdbc:mysql://localhost:3306/MercAppBD";
            String Driver="com.mysql.jdbc.Driver";
            String username = "root";
            String bdPassword = "n0m3l0";
            Class.forName(Driver);
            con = DriverManager.getConnection(URL, username, bdPassword);
        }catch(Exception e){
            
        }
        return con;
    }
}
