<%-- 
    Document   : ELIMINAR_RECETA
    Created on : 25/04/2020, 04:04:54 AM
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
        
        String id_rec = request.getParameter("receta");
         
        int contA = 0;
        int contB = 0;
        
        try{
        ps=con.prepareStatement("DELETE FROM mi_receta WHERE id_miRec='"+ id_rec +"'" );
        ps.executeUpdate();
        
        ps = con.prepareStatement("SELECT * FROM usuario");
        rs = ps.executeQuery();
        
        int contU = 0, id = 0;
        
        while(rs.next()){
            contU++;
            String bdUsuario = rs.getString("nombre");
            if (bdUsuario.equals(session.getAttribute("nom"))) {
                id = id + contU;
            }
        }
        
        ps= con.prepareStatement("SELECT * FROM mi_receta");
        rs = ps.executeQuery();
        
        while(rs.next()){
            contA++;
            ps= con.prepareStatement("Update mi_receta set id_miRec = '" + contA + "' WHERE nom_rec = '" + rs.getString("nom_rec") + "'"
                    + " AND id_usu = '" +  id +  "';");
            ps.executeUpdate();
        }
        
        ps= con.prepareStatement("SELECT * FROM rel_mirecali");
        rs = ps.executeQuery();
        
        while(rs.next()){
            contB++;
            ps= con.prepareStatement("Update rel_mirecali set id_MiRelAli = '" + contA + "' WHERE id_miRec = '" + rs.getString("id_miRec") + "'"
                    + " AND id_miAli = '" + rs.getString("id_miAli") +  "';");
            ps.executeUpdate();
        }
            response.sendRedirect("MI_COCINA.jsp");
            
        }catch(Exception e){
            out.println(e);
        }    
        %>
    </body>
</html>
