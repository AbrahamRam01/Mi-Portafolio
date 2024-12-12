<%-- 
    Document   : ELIMINAR_DIETA
    Created on : 20/04/2020, 02:15:55 AM
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
          
        String id_die = request.getParameter("dieta");
        int contU = 0, id = 0;
        
        ps = con.prepareStatement("SELECT * FROM usuario");
        rs = ps.executeQuery();
        
        while(rs.next()){
            contU++;
            String bdUsuario = rs.getString("nombre");
            if (bdUsuario.equals(session.getAttribute("nom"))) {
                id = id + contU;
            }
        }
        
        ps=con.prepareStatement("DELETE FROM mi_dieta WHERE id_miDie='"+ id_die +"'" );
        ps.executeUpdate();
        
        int contA = 0, contB = 0;
        
        ps= con.prepareStatement("SELECT * FROM mi_dieta");
        rs = ps.executeQuery();
        
        while(rs.next()){
            contA++;
            ps= con.prepareStatement("Update mi_dieta set id_miDie = '" + contA + "' WHERE nom_die = '" + rs.getString("nom_die") + "'"
                    + " AND id_usu = '" +  id +  "';");
            ps.executeUpdate();
        }
        
        ps= con.prepareStatement("SELECT * FROM rel_mirecdie");
        rs = ps.executeQuery();
        
        while(rs.next()){
            contB++;
            ps= con.prepareStatement("Update rel_mirecdie set id_MiRelRecDie = '" + contB + "' WHERE id_miRec = '" + rs.getString("id_miRec") + "'"
                    + " AND id_miDie = '" + rs.getString("id_miDie") +  "';");
            ps.executeUpdate();
        }
        
        response.sendRedirect("MI_COCINA.jsp");
        %>
    </body>
</html>
