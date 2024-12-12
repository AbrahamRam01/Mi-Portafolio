<%-- 
    Document   : AGREGAR_RECETA
    Created on : 16/04/2020, 09:27:51 AM
    Author     : abrah
--%>
<%@page import="java.util.Arrays"%>
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
            int cont=0;
            
    try{        
            String RecNom = request.getParameter("NomRec");
            String DesRec = request.getParameter("DesRec");
            String[] seleccion = request.getParameterValues("Select");
            int contT=0;
            String bien = "<script> alert('El alimento ya esta registrado') <script>";
            String mal = "<script> alert('El alimento se registro exitosamente') <script>";  
            boolean registrado = false;
            int contU = 0;
            int id = 0;
            int idTipAli = 0;
            int idRel = 0;
                
            ps=con.prepareStatement("SELECT * FROM usuario");
            rs=ps.executeQuery();
            
                while(rs.next()){
                    contU++;
                    String usu = rs.getString("nombre");
                    if(session.getAttribute("nom").equals(usu)){
                        id = id + contU;
                    }
                }
                
            ps=con.prepareStatement("SELECT * FROM mi_receta WHERE id_usu = '" + id + "';"); 
            rs=ps.executeQuery();    
            
                while(rs.next()){
                    String bdRec = rs.getString("nom_rec");
                    if (bdRec.equals(RecNom)) {
                        registrado = true;
                    }
                }
                
            ps=con.prepareStatement("SELECT * FROM mi_receta"); 
            rs=ps.executeQuery();    
            
                while(rs.next()){
                    cont++;
                }    
                
            ps=con.prepareStatement("SELECT * FROM rel_mirecali"); 
            rs=ps.executeQuery();    
            
                while(rs.next()){
                    idRel++;
                }    
                
                
            if (registrado == false) {
                cont = cont + 1;
                int contAli = 0;
                int idAli = 0;
                int posicion = 0;
                
                String sentencia = "INSERT INTO mi_receta values('" + cont + "','" + id + "','" + RecNom + "','" +
                    DesRec + "',' sin ');" ;
                ps.executeUpdate(sentencia);
                
                for (int h = 0; h <  seleccion.length; h++) {
                   contAli = 0;
                   idAli = 0;
                   idRel++;
                   ps=con.prepareStatement("SELECT * FROM mi_alimento"); 
                   rs=ps.executeQuery();
                   while(rs.next()){
                       if (seleccion[posicion].equals(rs.getString("nom_alimento"))) {
                          idAli += contAli + 1;  
                          break;
                       }
                       contAli++;   
                   }
                   String SelSend = "INSERT INTO rel_mirecali values('" + idRel + "','" + cont + "','" + idAli + "');";
                   ps.executeUpdate(SelSend);
                   posicion++;
                   
                }
                request.getRequestDispatcher("MI_COCINA.jsp").forward(request,response);
            }else{
                int ex = 0;
                response.sendRedirect("MI_COCINA.jsp?ex=" + ex); 
            }
        }catch(Exception e){
            ps=con.prepareStatement("DELETE FROM mi_receta WHERE id_miRec='" + cont + "';"); 
            ps.executeUpdate();
            out.println(e);
        }    
        %>
    </body>
</html>
