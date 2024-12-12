<%-- 
    Document   : ELIMINAR_ALIMENTO
    Created on : 25/04/2020, 04:05:12 AM
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
            
        String id_ali = request.getParameter("alimento");
        
        ps=con.prepareStatement("DELETE FROM mi_alimento WHERE id_miAli='"+ id_ali +"'" );
        ps.executeUpdate();
        
        int cont = 0;
        
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
        
        ps= con.prepareStatement("SELECT * FROM mi_alimento");
        rs = ps.executeQuery();
        
        while(rs.next()){
            cont++;
            ps= con.prepareStatement("Update mi_alimento set id_miAli = '" + cont + "' WHERE nom_alimento = '" + rs.getString("nom_alimento") + "'"
                    + " AND id_usu = '" +  id +  "';");
            ps.executeUpdate();
        }
        
        response.sendRedirect("MI_COCINA.jsp");
    
        %>
    </body>
</html>
