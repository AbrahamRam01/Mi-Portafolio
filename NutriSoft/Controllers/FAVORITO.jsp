<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : FEET
    Created on : 6/04/2020, 04:16:29 AM
    Author     : abrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NutriSoft</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
    <%

        response.setHeader("Pragma","no-cache");
        response.addHeader("Cache-control","must-revalidate");
        response.addHeader("Cache-control", "no-cache");
        response.addHeader("Cache-control", "no-store");
        response.setDateHeader("Expires", 0);

        try{
            if(session.getAttribute("nom")==null){
                request.getRequestDispatcher("index.html").forward(request, response);
            }
        }catch(Exception e){
            request.getRequestDispatcher("index.html").forward(request, response);
        }

    %>
    
  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="#"><span>NutriSoft - <%out.print(" Bienvenido: " + session.getAttribute("nom"));%></span></a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
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
            int id = 0;    
            ps=con.prepareStatement("SELECT * FROM usuario");
            rs=ps.executeQuery();
            
            while(rs.next()){
                String usu = rs.getString("nombre");
                if(session.getAttribute("nom").equals(usu)){
                    id = Integer.parseInt(rs.getString("tipo_us"));
                }
            }
            if(id == 1){
        %>    
            <li class="active"><a href="FEET.jsp">Inicio</a></li>
            <li class="active"><a href="MI_COCINA.jsp">Mi Cocina</a></li>
            <li class="active"><a href="FAVORITO.jsp">Favoritos</a></li>
            <li class="active"><a href="BUSCADOR.jsp">Buscador</a></li>
            <li class="active"><a href="CONFIGURACION.jsp">Configuracion</a></li>
        <%  }else if(id == 0){%>  
            <li class="active"><a href="FEET.jsp">Inicio</a></li>
            <li class="active"><a href="BUSCADOR.jsp">Buscador</a></li>
            <li class="active"><a href="CONTROLADOR_USUARIOS.jsp">Usuarios</a></li>
            <li class="active"><a href="CONFIGURACION.jsp">Configuracion</a></li>
        <%}%>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  <table>
      <tr>
          <td>
              AQUIE ESTAN TUS FAVORITOS:
          </td>
      </tr>
  </table>
    </body>
</html>
