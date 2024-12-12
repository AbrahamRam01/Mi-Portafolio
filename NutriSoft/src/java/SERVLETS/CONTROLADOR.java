package SERVLETS;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CONTROLADOR extends HttpServlet{
    
    private Connection con;
    private Statement set;
    private ResultSet resSet;

    @Override
    public void init(ServletConfig conf) throws ServletException {
        String URL = "jdbc:mysql://localhost/nutrisoft";
        String username = "root";
        String bdPassword = "n0m3l0";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, username, bdPassword);
            set = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String nombres = request.getParameter("Nombres");
        String apellidoMat = request.getParameter("AMaterno");
        String apellidoPat = request.getParameter("APaterno");
        String username = request.getParameter("NUsuario");
        String password = request.getParameter("poss");
        
        
        
        try { 
            int cont = 0;
            boolean registrado = false;
            set = con.createStatement();
            resSet = set.executeQuery("SELECT * FROM usuario");

            while (resSet.next()) {
                cont++;
                String bdUsername = resSet.getString("nom_us");

                if (username.equals(bdUsername)) {
                    int ex = 0;
                    response.sendRedirect("REGISTRO.jsp?ex=" + ex);
                    registrado = true;
                    break;
                }

            }

            if (registrado == false) {
                cont= cont +1;

                set = con.createStatement();
                set.executeUpdate("INSERT INTO usuario VALUES('" + cont + "', '" + username + "' , '" + nombres 
                        + "' , '" + apellidoPat + "', '" + apellidoMat + "', '"+ password +"','" + 1 + "' , '" + 
                        "sin" + "');");
                set = con.createStatement();
                set.executeUpdate("INSERT INTO amigos VALUES('" + cont + "');");
                response.sendRedirect("REGISTRO.jsp");
            }
            
            

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }

    }
    
}