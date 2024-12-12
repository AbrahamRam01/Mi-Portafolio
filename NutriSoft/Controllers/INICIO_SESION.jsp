<%-- 
    Document   : INICIO_SESION
    Created on : 5/04/2020, 04:49:56 AM
    Author     : abrah
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    int value = 1;
    try{
        value = Integer.parseInt(request.getParameter("ex"));
    }catch(Exception e){
        value = 1;
    }
%>
    <head>
        <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>NutriSoft - Inicio de Sesion</title>
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
        
        <header id="header">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="index.html"><span>NutriSoft</span></a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="INICIO_SESION.jsp">Inicio de Sesion</a></li>
          <li class="active"><a href="REGISTRO.jsp">Registrate</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  <section>
    <form method="POST" action="INICIAR">
      <center>
      <table cellpadding="5">
          <tr>
              <td>
          <center>
              INICIO DE SESION
          </center>
              </td>
          </tr>
          <tr>
              <td>
                  <input type="text" placeholder="Nombre(s)" name="NUsuario"/>
              </td>
          </tr>
              <td>
                  <input type="password" placeholder="Contraseña" name="pass"/>
              </td>
          </tr>
          <tr>
              <td>
                    <center><input type="submit" value="ACEPTAR" /></center>
              </td>
          </tr>
      </table>
      </center>
  </form>
  </section><!-- End Hero -->  
    </body>
</html>
<%  
    if (value == 0) {
        String mensaje="<script type='text/javascript'>alert('LA CUENTA NO EXISTE O LOS DATOS NO SON CORRECTOS');</script>";
        out.println(mensaje);
    }
%>
