<%-- 
    Document   : AGREGAR_ALIMENTO
    Created on : 7/04/2020, 10:18:58 PM
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
            
            
            String AliNom = request.getParameter("AliNom");
            String DesAli = request.getParameter("DesAli");
            String tipAli = request.getParameter("tipAli");
            int cont=0;
            int contT=0;
            String bien = "<script> alert('El alimento ya esta registrado') <script>";
            String mal = "<script> alert('El alimento se registro exitosamente') <script>";  
            boolean registrado = false;
            int contU = 0;
            int id = 0;
            int idTipAli = 0;
                
            ps=con.prepareStatement("SELECT * FROM usuario");
            rs=ps.executeQuery();
            
                while(rs.next()){
                    contU++;
                    String usu = rs.getString("nombre");
                    if(session.getAttribute("nom").equals(usu)){
                        id = id + contU;
                    }
                }
                
            ps=con.prepareStatement("SELECT * FROM mi_alimento"); 
            rs=ps.executeQuery();    
            
                while(rs.next()){
                    cont++;
                }
                
            ps=con.prepareStatement("SELECT * FROM mi_alimento WHERE id_usu= '" + id + "';"); 
            rs=ps.executeQuery();    
            
                while(rs.next()){
                    String bdAlimento = rs.getString("nom_alimento");
                    if (bdAlimento.equals(AliNom)) {
                        registrado = true;
                    }
                }    
                
            ps=con.prepareStatement("SELECT *FROM tip_alimento");
            rs=ps.executeQuery();
                
                while(rs.next()){
                    contT++;
                    String bdTip = rs.getString("nom_TipAli");
                    if (tipAli.equals(bdTip)) {
                         idTipAli = idTipAli + contT;
                    }
                }
                
                if (registrado == false) {
                    cont = cont + 1;
                    contT = contT + 1;
                    String sentencia = "INSERT INTO mi_alimento VALUES('" + cont + "','" + id
                    + "','" + AliNom + "','" + DesAli + "','" + idTipAli + "','sin');"; 
                    ps.executeUpdate(sentencia);
                    request.setAttribute("ALERT",bien);
                    request.getRequestDispatcher("MI_COCINA.jsp").forward(request,response);
                }else if(registrado == true){
                    int ex = 0;
                    response.sendRedirect("MI_COCINA.jsp?ex=" + ex);
                }
        %>
    </body>
</html>
