package SERVLETS;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class INICIAR extends HttpServlet{
    
    private Connection con;
    private Statement set;
    private ResultSet rs;

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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        HttpSession nueva_sesion= request.getSession();
        
        String us = request.getParameter("NUsuario");
        String pass = request.getParameter("pass"); 
        
        try { 
            
            boolean existe = false;
            int ex = 0;
            String ulname = "ñoño";
            
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM usuario");

            while (rs.next()) {
                if (us.equals(rs.getString("nom_us")) && pass.equals(rs.getString("contraseña"))) {
                    existe = true;
                    ulname = rs.getString("nombre");
                    ex = 1;
                }
            }
          
            if (existe == true) {

                nueva_sesion.setAttribute("nom",ulname);
                request.getRequestDispatcher("FEET.jsp").forward(request, response);
                
            }else{
                ex = 0;
                response.sendRedirect("INICIO_SESION.jsp?ex=" + ex);
            }
                        
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
