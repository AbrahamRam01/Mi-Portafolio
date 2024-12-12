<%-- 
    Document   : PUBLICAR_DIE
    Created on : 12/05/2020, 07:04:57 PM
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
            PreparedStatement ps;
            ResultSet rs;
            String URL = "jdbc:mysql://localhost:3306/nutrisoft";
            String Driver="com.mysql.jdbc.Driver";
            String username = "root";
            String bdPassword = "n0m3l0";
            Class.forName(Driver);
            con = DriverManager.getConnection(URL, username, bdPassword);
            
            String idDie = "", com = "";
            com = request.getParameter("com");
            int contR = 0, idRel = 0,idN = 0;
            boolean ex = false;
            String nomD="",desD="";
            try{
                idDie = request.getParameter("dieta");
            }catch(Exception e){
                idDie = "";
            }
            
            int contU = 0, idU = 0,contC = 0, id_com = 0,contA = 0;
            
            ps=con.prepareStatement("SELECT * FROM usuario");
            rs=ps.executeQuery();
            
            while(rs.next()){
                contU++;
                String usu = rs.getString("nombre");
                if(session.getAttribute("nom").equals(usu)){
                    idU = idU + contU;
                }
            }
                
            ps = con.prepareStatement("SELECT * FROM Comentario");
            rs = ps.executeQuery();

            while(rs.next()){ 
                contC++;
            }
                    
            id_com = contC + 1;
                    
            String sentencia1 = "INSERT INTO comentario VALUES('" + id_com
                + "','" + idU + "',' 1 ','" + com + "');"; 
            ps.executeUpdate(sentencia1);    
            
                        
            ps=con.prepareStatement("SELECT * FROM dieta");
            rs=ps.executeQuery();    

            while(rs.next()){
                contR++;
            }    
            idN = contR + 1;
            
            ps=con.prepareStatement("SELECT * FROM rel_recdie"); 
            rs=ps.executeQuery();    

            while(rs.next()){
                idRel++;
            }
                        
            ps=con.prepareStatement("SELECT * FROM mi_dieta");
            rs=ps.executeQuery();
                    
            while(rs.next()){
                if (idDie.equals(rs.getString("id_miDie"))){
                    nomD = rs.getString("nom_die");
                    desD = rs.getString("des_dieta");
                    ex = true;
                }
            }
            
            ps=con.prepareStatement("SELECT * FROM receta");
            rs=ps.executeQuery();
                    
            while(rs.next()){
                contA++;
            }
            
            ps=con.prepareStatement("SELECT * FROM rel_mirecdie WHERE id_midie =" + idN);
            rs=ps.executeQuery();
            int contT=0,tot=0;
            while(rs.next()){
                contT++;
            }
            tot = contT;
            
            boolean vis = false;
            int idVis = 0;
            ps=con.prepareStatement("SELECT * FROM dieta");
            rs=ps.executeQuery();
            while(rs.next()){
                String nomBD = rs.getString("nom_die");
                String desBD = rs.getString("des_dieta");
                if (nomBD.equals(nomD) && desBD.equals(desD)) {
                    idVis = Integer.parseInt(rs.getString("id_die"));
                    vis = true;
                }
            }
            
            if (ex == true && vis == false) {
                contR = contR + 1;
                String sentencia = "INSERT INTO dieta VALUES('" + idN
                    + "','" + id_com + "','1','" + nomD + "','" + desD + "');";
                ps.executeUpdate(sentencia);
                out.println("kaka");
                for (int i = 0; i < tot; i++) {
                    contA++;
                    ps=con.prepareStatement("SELECT * FROM rel_mirecdie where id_midie = " + idN + ";");
                    rs=ps.executeQuery();
                    rs.next();
                    String id = rs.getString("id_miRec");
                    ps=con.prepareStatement("SELECT * FROM mi_receta where id_miRec = " + id + ";");
                    rs=ps.executeQuery();
                    rs.next();
                    String nom = rs.getString("nom_rec");
                    String des = rs.getString("des_rec");
                    String sentencia2 = "INSERT INTO receta VALUES('" + contA
                        + "','" + id_com + "','0','" + nom + "','" + des + "','sin');";
                    ps.executeUpdate(sentencia2);    
                }
                contA = contA - contT;
                
                for (int i = 0; i < tot; i++) {
                    String sentencia3 = "INSERT INTO rel_recdie VALUES('" + idRel + "','" + contR + "','" + contA + "');";
                    ps.executeUpdate(sentencia3);
                    idRel++;
                    contA++;
                }
                response.sendRedirect("MI_COCINA.jsp");
            }else if(vis == true){
                String sentencia = "UPDATE dieta SET visto = " + 1 + " WHERE id_die =" + idVis + ";";
                ps.executeUpdate(sentencia);
                String sentencia4 = "UPDATE dieta SET id_com = " + id_com + " WHERE id_die =" + idVis + ";";
                ps.executeUpdate(sentencia4);
                response.sendRedirect("MI_COCINA.jsp");
            }
        %>
    </body>
</html>
