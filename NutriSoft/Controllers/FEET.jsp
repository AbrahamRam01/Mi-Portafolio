<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
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
  <style type="text/css">    
      #text-light{
          font-size: small;
      }
      
      #ali{
        color: white;
        margin: 0 auto;
        border: 1px solid #696;
        padding: 60px 0;
        text-align: center; width: 200px;
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        border-radius: 8px;
        -webkit-box-shadow: #666 0px 2px 3px;
        -moz-box-shadow: #666 0px 2px 3px;
        box-shadow: #666 0px 2px 3px;
        background: gray;
        background: -webkit-gradient(linear, 0 0, 0 bottom, from(gray), to(gray));
        background: -webkit-linear-gradient(gray, gray);
        background: -moz-linear-gradient(gray, gray);
        background: -ms-linear-gradient(gray, gray);
        background: -o-linear-gradient(gray, gray);
        background: linear-gradient(gray, gray);
        -pie-background: linear-gradient(gray, gray);
        behavior: url(/pie/PIE.htc);
        
    }
  </style>
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
  <%
      int res1 = 0, res2 = 0, res3 = 0, tot;
      ps = con.prepareStatement("SELECT COUNT(*) AS total1 FROM alimento WHERE visto = 1");
      rs = ps.executeQuery();
      rs.next();
      res1 = Integer.parseInt(rs.getString("total1"));
      ps = con.prepareStatement("SELECT COUNT(*) AS total2 FROM receta WHERE visto = 1");
      rs = ps.executeQuery();
      rs.next();
      res2 = Integer.parseInt(rs.getString("total2"));
      ps = con.prepareStatement("SELECT COUNT(*) AS total3 FROM dieta WHERE visto = 1");
      rs = ps.executeQuery();
      rs.next();
      res3 = Integer.parseInt(rs.getString("total3"));
      tot = res1 + res2 + res3;
      
      Random rnd = new Random();
      int conA=0,conR=0,conD=0;
      int cont=0,count=0,count2=0,count3=0;
      boolean al=false,re=false,di=false;
      
      if (res1 == 0) {
          al = true;
      }else if(res2 == 0){
          re = true;
      }else if(res3 == 0){
          di = true;
      }
      
      try{
      for(int i = 0; i < tot; i++){
        int ran;
        ran = rnd.nextInt(3)+1;
        if(ran == 1 && al == false && count <= res1){
            count++;
            ps=con.prepareStatement("SELECT * FROM alimento WHERE id_alimento = " + count + " AND visto = 1;");
            rs = ps.executeQuery();
            rs.next();
  %>
    <br>
    <div id="ali">
    <table align="center">
        <tr>
            <td colspan="2">
                
                <%=rs.getString("nom_alimento")%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%
                    int idA = Integer.parseInt(rs.getString("id_com"));
                    ps=con.prepareStatement("SELECT * FROM Comentario WHERE id_com ='" + idA + "';");
                    rs = ps.executeQuery();
                    rs.next();
                %>
                <%=rs.getString("comentario")%>
                <%
                    ps=con.prepareStatement("SELECT * FROM alimento WHERE id_alimento =" + count + " AND visto = 1;");
                    rs = ps.executeQuery();
                    rs.next();
                %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%=rs.getString("des_alimento")%>
            </td>
        </tr>
        <tr>
            <td>
                <input id="user" type="text" placeholder="Escribe algo..." name="ComPubli">
            </td>
            <td>
                <a href="AGREGAR_FAVORITO.jsp?ali=<%=rs.getString("id_alimento")%>">FAV</a>
            </td>
        </tr>
    </table>
    </div>          
  <br>
  <%}else if( ran == 2 && re == false && count2 <= res2){
    count2++;
    ps=con.prepareStatement("SELECT * FROM receta WHERE id_rec = " + count2 + " AND visto = 1;");
    rs = ps.executeQuery();
    rs.next();
  %>
  <br>
  <div id="ali">
  <table align="center">
      <tr>
          <td>
              <%=rs.getString("nom_rec")%>
          </td>
      </tr>
      <tr>
          <td>
              <%
                    int idA = Integer.parseInt(rs.getString("id_com"));
                    ps=con.prepareStatement("SELECT * FROM Comentario WHERE id_com ='" + idA + "';");
                    rs = ps.executeQuery();
                    rs.next();
                %>
                <%=rs.getString("comentario")%>
                <%
                    ps=con.prepareStatement("SELECT * FROM receta WHERE id_rec =" + count2 + ";");
                    rs = ps.executeQuery();
                    rs.next();
                %>
          </td>
      </tr>
      <tr>
          <td>
              <%=rs.getString("des_rec")%>
          </td>
      </tr>
      <tr>
            <td>
                <a href="AGREGAR_FAVORITO.jsp?rec=<%=rs.getString("id_rec")%>">FAVORITO</a>
            </td>
        </tr>
  </table>
  </div>        
  <br>
  <%}else if( ran == 3 && di == false && count3 <= res3){
    count3++;
    ps=con.prepareStatement("SELECT * FROM dieta WHERE id_die = " + count3 + " AND visto = 1;");
    rs = ps.executeQuery();
    rs.next();
  %>
  <br>
  <div id="ali">
  <table align="center">
      <tr>
          <td>
              <%=rs.getString("nom_die")%>
          </td>
      </tr>
      <tr>
          <td>
              <%
                    int idA = Integer.parseInt(rs.getString("id_com"));
                    ps=con.prepareStatement("SELECT * FROM Comentario WHERE id_com ='" + idA + "';");
                    rs = ps.executeQuery();
                    rs.next();
                %>
                <%=rs.getString("comentario")%>
                <%
                    ps=con.prepareStatement("SELECT * FROM dieta WHERE id_die =" + count3 + " AND visto = 1;");
                    rs = ps.executeQuery();
                    rs.next();
                %>
          </td>
      </tr>
      <tr>
          <td>
              <%=rs.getString("des_dieta")%>
          </td>
      </tr>
      <tr>
            <td>
                <a href="AGREGAR_FAVORITO.jsp?die=<%=rs.getString("id_die")%>">FAVORITO</a>
            </td>
        </tr>
  </table>
  </div>        
  <br>
  <%}}}catch(SQLException e){
        
    }%>
    </body>
</html>

