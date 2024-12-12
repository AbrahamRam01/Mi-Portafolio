<%-- 
    Document   : MI_COCINA
    Created on : 6/04/2020, 04:16:00 AM
    Author     : abrah
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <meta content="" name="descriptison">
    <meta content="" name="keywords">
    <title>NutriSoft</title>

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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
	$(function(){
	$('#login').click(function(){
	$(this).next('#login-content').slideToggle();
	$(this).toggleClass('active');          
	});
	});
                        
        $(function(){
	$('#login-2').click(function(){
	$(this).next('#login-content-2').slideToggle();
	$(this).toggleClass('active');          
	});
	});
                        
        $(function(){
	$('#login-3').click(function(){
	$(this).next('#login-content-3').slideToggle();
	$(this).toggleClass('active');          
	});
	});		
    </script>
    <style>
        .modalDialog {
	position: fixed;
	font-family: Arial;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
	z-index: 99999;
	opacity:0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
        }
        
        .modalDialog:target {
	opacity:1;
	pointer-events: auto;
        }
        
        .modalDialog > div {
	width: 400px;
        height: 150px;
	position: relative;
	margin: 10% auto;
	padding: 5px 20px 13px 20px;
	border-radius: 10px;
	background: #fff;
	background: gray;
	background: gray;
	background: gray;
        -webkit-transition: opacity 400ms ease-in;
        -moz-transition: opacity 400ms ease-in;
        transition: opacity 400ms ease-in;
        } 
        
        .close {
	background: #606061;
	color: #FFFFFF;
	line-height: 25px;
	position: absolute;
	right: -12px;
	text-align: center;
	top: -10px;
	width: 24px;
	text-decoration: none;
	font-weight: bold;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
	-moz-box-shadow: 1px 1px 3px #000;
	-webkit-box-shadow: 1px 1px 3px #000;
	box-shadow: 1px 1px 3px #000;
        }
        
        .close:hover { background: orange; }
        
        #scroll-1{
        border:0px solid;
        background: white;
        height:130px;
        width: 475px;
        overflow-y:scroll;
        overflow-x:scroll;
        }
        
        #scroll-2{
        border:0px solid;
        background: white;
        height:130px;
        width:475px;
        overflow-y:scroll;
        overflow-x:scroll;
        }
        
        #scroll-3{
        border:0px solid;
        background: white;
        height:130px;
        width:475px;
        overflow-y:scroll;
        overflow-x:scroll;
        }
        
        table{
            float: left;
        }  
      
        body{
          background-color: white;
        }

        nav.acceder ul {
          margin: 0;
          padding: 0;
          list-style: none;
          position: relative;
          float: next;
        }

        nav.acceder #login{
          display: inline-table;
          font-size: 16px;
          padding: 10px 10px;
          text-decoration: none;
          color: orange;
          border: 1px solid #fff;
          font-weight: 600
        }
        
        nav.acceder #login-2{
          display: inline-table;
          font-size: 16px;
          padding: 10px 10px;
          text-decoration: none;
          color: orange;
          border: 1px solid #fff;
          font-weight: 600
        }
        
        nav.acceder #login-3{
          display: inline-table;
          font-size: 16px;
          padding: 10px 10px;
          text-decoration: none;
          color: orange;
          border: 1px solid #fff;
          font-weight: 600
        }
        
        nav.acceder #login-content {
          position: inherit;
          top: 26px;
          right: 5000;
          z-index: 999;    
          background: gray;
          padding: 30px;
          height: 250px;
          width: 800px; 
          display: none;
          border-radius: 20px 20px 20px 20px;
          -moz-border-radius: 20px 20px 20px 20px;
          -webkit-border-radius: 20px 20px 20px 20px;
          border: 2px solid #ffa012;
        }
        
        nav.acceder #login-content-2 {
          position: inherit;
          top: 26px;
          right: 5000;
          z-index: 999;    
          background: gray;
          padding: 30px;
          height: 325px;
          width: 800px; 
          display: none;
          border-radius: 20px 20px 20px 20px;
          -moz-border-radius: 20px 20px 20px 20px;
          -webkit-border-radius: 20px 20px 20px 20px;
          border: 2px solid #ffa012;
        }
        
        nav.acceder #login-content-3 {
          position: inherit;
          top: 26px;
          right: 5000;
          z-index: 999;    
          background: gray;
          padding: 30px;
          height: 325px;
          width: 800px; 
          display: none;
          border-radius: 20px 20px 20px 20px;
          -moz-border-radius: 20px 20px 20px 20px;
          -webkit-border-radius: 20px 20px 20px 20px;
          border: 2px solid #ffa012;
        }

        input#user, input#pass {
          background: #f1f1f1;
          padding: 6px 5px;
          margin-bottom: 10px;
          width: 240px;
          border: 1px solid #ccc;
          border-radius: 5px;
        }
        #submit {    
          background-color: orange;
          text-shadow: 0 1px 0 rgba(0,0,0,.5);
          box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;    
          border: 1px solid #044E6B;
          height: 28px;
          padding: 0px;
          width: 70px;
          cursor: pointer;
          font: bold 14px Arial;
          color: white;
        }
        #submit:hover {    
          background-color: #044E6B;
        } 

        label {
          float: right;
          line-height: 28px;
          font-size: 14px;
          color: #666;
        }
        
        tabla1{
            border-collapse: separate;
            border-spacing: 500px 10px;
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
        
        Connection con;
        String URL = "jdbc:mysql://localhost:3306/nutrisoft";
        String Driver="com.mysql.jdbc.Driver";
        String username = "root";
        String bdPassword = "n0m3l0";
        Class.forName(Driver);
        con = DriverManager.getConnection(URL, username, bdPassword);

        PreparedStatement ps;
        ResultSet rs;
        int idUsu = 0, cont = 0;
                                                    
        ps=con.prepareStatement("SELECT * FROM usuario");
        rs=ps.executeQuery();
                                                    
        while(rs.next()){
            cont++;
            String bdUsu = rs.getString("nombre");
            if (session.getAttribute("nom").equals(bdUsu)) {
                idUsu = Integer.parseInt(rs.getString("id_usu"));
            }
        }
                                                

    %>
  <!-- ======= Header ======= -->
<%
    int value = 1, value2 = 1;
    try{
        value = Integer.parseInt(request.getParameter("ex"));   
    }catch(Exception e){
        value = 1;       
    }
    
    try{
        value2 = Integer.parseInt(request.getParameter("ex1"));
    }catch(Exception e){
        value2 = 1;
    }
  %>
        <header id="header">
        <div class="container d-flex">

        <div class="logo mr-auto">
        <h1 class="text-light"><a href="#"><span>NutriSoft - <%out.print(" Bienvenido: " + session.getAttribute("nom"));%></span></a></h1>
        </div>

            <nav class="nav-menu d-none d-lg-block">
              <ul>
                <li class="active"><a href="FEET.jsp">Inicio</a></li>
                <li class="active"><a href="MI_COCINA.jsp">Mi Cocina</a></li>
                <li class="active"><a href="FAVORITO.jsp">Favoritos</a></li>
                <li class="active"><a href="BUSCADOR.jsp">Buscador</a></li>
                <li class="active"><a href="CONFIGURACION.jsp">Configuracion</a></li>
              </ul>
            </nav><!-- .nav-menu -->
          </div>
        </header><!-- End Header -->   
    <div>
        <nav class="acceder">
            <ul>
		      <li>
		         <a id="login" href="#">MIS ALIMENTOS</a>
		         <div id="login-content">
                             <center>
                                <form method="POST" action="AGREGAR_ALIMENTO.jsp">
                                    <table id="tabla1" style="">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h5>AGREGAR ALIMENTO:</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="user" type="text" placeholder="Nombre del Alimento" name="AliNom">   
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="pass" type="text" placeholder="Descripcion" name="DesAli">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select name="tipAli">
                                                <%    
                                                    ps=con.prepareStatement("SELECT * FROM tip_alimento");
                                                    rs=ps.executeQuery();                        
                                                    
                                                    while(rs.next()){
                                                        out.print("<option>" + rs.getString(2) + "</option>");
                                                    }
                                                %>
                                            </select>                                               
                                        </td>
                                        <td align="right">
                                            <input type="submit" id="submit" value="GUARDAR">
                                        </td>
                                    </tr>
                                </table>
                                </form>            
                                <table>
                                    <tr>
                                        <td>
                                            &nbsp;
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <h5>ALIMENTOS GUARDADOS:</h5>
                                <div id="scroll-1">
                                    <table>
                                    <%
                                        ps = con.prepareStatement("SELECT * FROM mi_alimento WHERE id_usu = '" + idUsu + "';");
                                        rs = ps.executeQuery();
                                        while(rs.next()){
                                    %>        
                                        <tr>
                                            <td>
                                                <%=rs.getString("nom_alimento")%>
                                            </td>
                                            <td>
                                                &nbsp;
                                                &nbsp;
                                                &nbsp;
                                                 ---- 
                                                &nbsp;
                                                &nbsp;
                                                &nbsp;
                                            </td>
                                            <td>
                                                <a href="#openModal?duh=<%=rs.getString("id_miAli")%>">INFO</a>
                                                <h7>/</h7>
                                                <div <%out.print("id='openModal?duh=" + rs.getString("id_miAli") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>DESCRIPCION:</h2>
                                                    <%=rs.getString("des_alimento")%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="ELIMINAR_ALIMENTO.jsp?alimento=<%=rs.getString("id_miAli")%>">ELIMINAR</a>
                                                <h7>/</h7>
                                            </td>
                                            <td>
                                                <a href="#openModal-1?duh=<%=rs.getString("id_miAli")%>">PUBLICAR</a>
                                                <div <%out.print("id='openModal-1?duh=" + rs.getString("id_miAli") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>PUBLICACION</h2>
                                                    <form method="post" action="PUBLICAR_ALI.jsp?alimento=<%=rs.getString("id_miAli")%>&val=1">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="text" placeholder="Descripcion" name="com">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="submit" id="submit" value="ENVIAR">
                                                                </td>
                                                            </tr>
                                                        </table>          
                                                    </form>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <%}%>
                                    </table>
                                </div> 
                                </center>
			     </div>                     
                        </li>                    
                                                
                      
                      <li>
		         <a id="login-2" href="#">MIS RECETAS</a>
		         <div id="login-content-2">
                             <center>
                                <form method="post" action="AGREGAR_RECETA.jsp" >
                                <table>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h5>AGREGAR RECETAS:</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="user" type="text" name="NomRec" placeholder="Nombre de la Receta">   
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="pass" type="text" name="DesRec" placeholder="Pasos de la receta">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            SELECCIONA LOS ALIMENTOS:                                              
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select name="Select" multiple="multiple">
                                                <%
                                                    ps=con.prepareStatement("SELECT * FROM mi_alimento WHERE id_usu=" + idUsu + ";");
                                                    rs=ps.executeQuery();
                                                    
                                                    while(rs.next()){
                                                        out.print("<option>" + rs.getString(3) + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="submit" id="submit" value="GUARDAR">
                                        </td>
                                    </tr>
                                </table> 
			        </form>
                                <h5>RECETAS GUARDADAS:</h5>            
                                <div id="scroll-2">
                                    <table>
                                    <%
                                        ps = con.prepareStatement("SELECT * FROM mi_receta WHERE id_usu = '" + idUsu + "';");
                                        rs = ps.executeQuery();
                                        while(rs.next()){
                                    %>        
                                        <tr>
                                            <td>
                                                &nbsp;
                                                <%=rs.getString("nom_rec")%>
                                            </td>
                                            <td>
                                                &nbsp;
                                                 ---- 
                                                &nbsp;
                                            </td>
                                            <td>
                                                <a href="#openModal-3?duh=<%=rs.getString("id_miRec")%>">INFO</a>
                                                <h7>/</h7>
                                                <div <%out.print("id='openModal-3?duh=" + rs.getString("id_miRec") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>DESCRIPCION:</h2>
                                                    <%=rs.getString("des_rec")%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="ELIMINAR_RECETA.jsp?receta=<%=rs.getString("id_miRec")%>">ELIMINAR</a>
                                                <h7>/</h7>
                                            </td>
                                            <td>
                                                <a href="#openModal-4?duh=<%=rs.getString("id_miRec")%>">PUBLICAR</a>
                                                <div <%out.print("id='openModal-4?duh=" + rs.getString("id_miRec") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>PUBLICACION</h2>
                                                    <form method="post" action="PUBLICAR_REC.jsp?receta=<%=rs.getString("id_miRec")%>">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="text" placeholder="Descripcion" name="com">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="submit" id="submit" value="ENVIAR">
                                                                </td>
                                                            </tr>
                                                        </table>          
                                                    </form>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>    
                                    <%}%>
                                    </table>
                            </div>
                             </center>        
			    </div>
		      </li>
                      
                      
                      
                <li>
		    <a id="login-3" href="#">AGREGAR DIETA</a>
		    <div id="login-content-3">
                        <center>
                            <form method="post" action="AGREGAR_DIETA.jsp">
                            <table>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h5>AGREGAR DIETAS:</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="user" type="text" name="NomDie" placeholder="Nombre de la Dieta">   
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input id="pass" type="text" name="DesDie" placeholder="Descripcion de la dieta">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            SELECCIONA LAS RECETAS:                                              
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select name="Select" multiple="multiple">
                                                <%
                                                    ps=con.prepareStatement("SELECT * FROM mi_receta WHERE id_usu=" + idUsu + ";");
                                                    rs=ps.executeQuery();
                                                    
                                                    while(rs.next()){
                                                        out.print("<option>" + rs.getString(3) + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="submit" id="submit" value="GUARDAR">
                                        </td>
                                    </tr>
                                </table> 
			        </form>
                                <h5>DIETAS GUARDADAS:</h5>            
                                <div id="scroll-3">
                                    <table>
                                    <%
                                        ps = con.prepareStatement("SELECT * FROM mi_dieta WHERE id_usu = '" + idUsu + "';");
                                        rs = ps.executeQuery();
                                        while(rs.next()){
                                    %>
                                        <tr>
                                            <td>
                                                &nbsp;
                                                <%=rs.getString("nom_die")%>
                                            </td>
                                            <td>
                                                &nbsp;
                                                 ---- 
                                                &nbsp;
                                            </td>
                                            <td>
                                                <a href="#openModal-5?duh=<%=rs.getString("id_miDie")%>">INFO</a>
                                                <h7>/</h7>
                                                <div <%out.print("id='openModal-5?duh=" + rs.getString("id_miDie") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>DESCRIPCION:</h2>
                                                    <%=rs.getString("des_dieta")%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="ELIMINAR_DIETA.jsp?dieta=<%=rs.getString("id_miDie")%>">ELIMINAR</a>
                                            </td>
                                            <td>
                                                &nbsp;
                                                <h7>/</h7> 
                                                &nbsp;
                                            </td>
                                            <td>
                                                <a href="#openModal-6?duh=<%=rs.getString("id_miDie")%>">PUBLICAR</a>
                                                <div <%out.print("id='openModal-6?duh=" + rs.getString("id_miDie") + "'");%> class="modalDialog">
                                                    <div>
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <h2>PUBLICACION</h2>
                                                    <form method="post" action="PUBLICAR_DIE.jsp?dieta=<%=rs.getString("id_miDie")%>">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="text" placeholder="Descripcion" name="com">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="submit" id="submit" value="ENVIAR">
                                                                </td>
                                                            </tr>
                                                        </table>          
                                                    </form>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>    
                                    <%}%>
                                    </table>
                            </div>
                        </center>
                    </div>                     
		</li>
	    </ul>
	</nav>
    </div>
    <%
        if (value == 0) {
            String mensaje="<script type='text/javascript'>alert('EL OBJETO YA FUE REGISTRADO:(');</script>";
            out.println(mensaje);
        }
    
        if(value2 == 0){
           String mensaje1="<script type='text/javascript'>alert('EL OBJETO YA FUE PUBLICADO:(');</script>";
           out.println(mensaje1); 
        }
    %>
    </body>
</html>
