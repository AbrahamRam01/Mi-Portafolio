<%-- 
    Document   : ELIMINAR_USUARIOS
    Created on : 14/04/2020, 05:13:08 AM
    Author     : abrah
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
        Connection con;
          String URL = "jdbc:mysql://localhost:3306/nutrisoft";
          String Driver="com.mysql.jdbc.Driver";
          String username = "root";
          String bdPassword = "n0m3l0";
          Class.forName(Driver);
          con = DriverManager.getConnection(URL, username, bdPassword);

          PreparedStatement ps;
          ResultSet rs;    
            
        String id_usu = request.getParameter("campo");
        ps=con.prepareStatement("DELETE FROM usuario WHERE id_usu='"+ id_usu +"'" );
        ps.executeUpdate();
        
        ps= con.prepareStatement("SELECT * FROM usuario");
        rs = ps.executeQuery();
        
        int cont = 0;
        
        while(rs.next()){
            cont++;
            ps= con.prepareStatement("Update usuario set id_usu = '" + cont + "' where nom_us = '" + rs.getString("nom_us") + "';");
            ps.executeUpdate();
        }
        
        response.sendRedirect("CONTROLADOR_USUARIOS.jsp");
    %>
    </body>
</html>
