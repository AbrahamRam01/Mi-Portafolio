<%-- 
    Document   : CONTROLADOR_USUARIOS
    Created on : 14/04/2020, 02:27:16 AM
    Author     : abrah
--%>

<%@page import="java.sql.*"%>
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
          <li class="active"><a href="FEET.jsp">INICIO</a></li>
          <li class="active"><a href="BUSCADOR.jsp">Buscador</a></li>
          <li class="active"><a href="CONTROLADOR_USUARIOS.jsp">Usuarios</a></li>
          <li class="active"><a href="CONFIGURACION.jsp">Configuracion</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  <nav>

  </nav>
      
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
          
          ps=con.prepareStatement("SELECT * FROM usuario");
          rs=ps.executeQuery();
          
        %>
    <center>
        <table cellpadding="15">  
            <tr>
                <td>
                    CLAVE:
                </td>
                <td>
                    NOMBRE DE USUARIO:
                </td>
                <td>
                    NOMBRE:
                </td>
                <td>
                    A.PATERNO:
                </td>
                <td>
                    A.MATERNO:
                </td>
                <td>
                    TIPO DE USUARIO:
                </td>
                <td colspan="2">
                    ACCIONES:
                </td>
            </tr>
            <%
                while(rs.next()){
            %>
            <tr>
                <td><%=rs.getString("id_usu")%></td>
                <td><%=rs.getString("nom_us")%></td>
                <td><%=rs.getString("nombre")%></td>
                <td><%=rs.getString("aPaterno")%></td>
                <td><%=rs.getString("aMaterno")%></td>
                <td><%=rs.getString("tipo_us")%></td>   
                <td><a href="ELIMINAR_USUARIOS.jsp?campo=<%=rs.getString("id_usu")%>">ELIMINAR</a></td>
                <td><a href="ELIMINAR_USUARIOS.jsp?campo=<%=rs.getString("id_usu")%>">MODIFICAR</a></td>
            </tr>
            <%}%>
        </table>  
    </center>        
    
    </body>
</html>
