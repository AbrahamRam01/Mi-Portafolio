<%-- 
    Document   : PUBLICAR_ALI
    Created on : 12/05/2020, 07:04:32 PM
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
            java.util.Calendar fecha = java.util.Calendar.getInstance();
            out.println(fecha.get(java.util.Calendar.DATE) + "/"
            + fecha.get(java.util.Calendar.MONTH)    + "/"
            + fecha.get(java.util.Calendar.YEAR));
            
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            String URL = "jdbc:mysql://localhost:3306/nutrisoft";
            String Driver="com.mysql.jdbc.Driver";
            String username = "root";
            String bdPassword = "n0m3l0";
            Class.forName(Driver);
            con = DriverManager.getConnection(URL, username, bdPassword);
            
            String idAli = "", com = "";
            com = request.getParameter("com");
            try{
                idAli = request.getParameter("alimento");
            }catch(Exception e){
                idAli = "";
            }
            
            int contU = 0, idU = 0,contC = 0, id_com = 0;
            
            ps=con.prepareStatement("SELECT * FROM usuario");
            rs=ps.executeQuery();
            
            while(rs.next()){
                contU++;
                String usu = rs.getString("nombre");
                if(session.getAttribute("nom").equals(usu)){
                    idU = idU + contU;
                }
            }    
            
                    String nom = "", des = "",img;
                    int tip = 0, cont = 0, id = 0;
                    boolean ex = false;

                    ps = con.prepareStatement("SELECT * FROM alimento");
                    rs = ps.executeQuery();

                    while(rs.next()){ 
                        cont++;
                    }
                    
                    ps = con.prepareStatement("SELECT * FROM mi_alimento");
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        if (idAli.equals(rs.getString("id_miAli"))) {
                            nom = rs.getString("nom_alimento");
                            des = rs.getString("des_alimento");
                            tip = Integer.parseInt(rs.getString("id_TipAli"));
                            img = rs.getString("ImgUrl_ali");
                            ex = true;
                        }
                    }
                    
                    boolean vis = false;
                    int idVis = 0, ex1 = 1;
                    
                    ps = con.prepareStatement("SELECT * FROM alimento");
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        String nomBD = rs.getString("nom_alimento");
                        String desBD = rs.getString("des_alimento");
                        if (nomBD.equals(nom) && desBD.equals(des)) {
                            idVis = Integer.parseInt(rs.getString("id_alimento"));
                            vis = true;
                            ex1 = 0;
                        }
                    }
                  
                    if (ex == true && vis == false) {
                        ps = con.prepareStatement("SELECT * FROM Comentario");
                        rs = ps.executeQuery();

                        while(rs.next()){ 
                            contC++;
                        }

                        id_com = contC + 1;

                        String sentencia1 = "INSERT INTO comentario VALUES('" + id_com
                                + "','" + idU + "',' 1 ','" + com + "',);"; 
                            ps.executeUpdate(sentencia1);
                        id = cont + 1;
                        String sentencia = "INSERT INTO alimento VALUES('" + id
                            + "','" + id_com + "','1','" + nom + "','" + des + "','" + tip + "','sin');";
                            ps.executeUpdate(sentencia);
                        response.sendRedirect("MI_COCINA.jsp");
                    }else if(vis == true){
                            ps = con.prepareStatement("SELECT * FROM Comentario");
                            rs = ps.executeQuery();

                            while(rs.next()){ 
                                contC++;
                            }

                            id_com = contC + 1;

                            String sentencia1 = "INSERT INTO comentario VALUES('" + id_com
                                + "','" + idU + "',' 1 ','" + com + "',);"; 
                            ps.executeUpdate(sentencia1);
                            String sentencia = "UPDATE alimento SET visto = " + 1 + " WHERE id_alimento =" + idVis + ";";
                            ps.executeUpdate(sentencia);
                            String sentencia2 = "UPDATE alimento SET id_com = " + id_com + " WHERE id_alimento =" + idVis + ";";
                            ps.executeUpdate(sentencia2);
                            response.sendRedirect("MI_COCINA.jsp?ex1=" + ex1);
                    }
        %>
    </body>
</html>
