package SERVIDOR;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SESION_INICIO", urlPatterns = {"/SESION_INICIO"})
public class SESION_INICIO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession nueva_sesion= request.getSession();
        final String HOST = "localhost";
        final int PUERTO = 5000;
        DataInputStream entrada;
        DataOutputStream salida;
        try{
            String us = request.getParameter("NUsuario");
            String pass = request.getParameter("pass");
            Socket sc = new Socket(HOST,PUERTO);
            entrada = new DataInputStream(sc.getInputStream());
            salida = new DataOutputStream(sc.getOutputStream());
            salida.writeUTF("INICIO_SESION");
            salida.writeUTF(us);
            salida.writeUTF(pass);
            String des = entrada.readUTF();
            if(des.equals("true0")){
                nueva_sesion.setAttribute("nom",us);
                response.sendRedirect("index.jsp");
            }else if(des.equals("true1")){
                nueva_sesion.setAttribute("nom",us);
                response.sendRedirect("index.jsp");
            }else{
                response.sendRedirect("index.jsp?CE=1");
            }
        }catch(Exception e){
            
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
