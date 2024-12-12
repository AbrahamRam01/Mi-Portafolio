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

@WebServlet(name = "SESION_REGISTRO", urlPatterns = {"/SESION_REGISTRO"})
public class SESION_REGISTRO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession nueva_sesion= request.getSession();
        final String HOST = "localhost";
        final int PUERTO = 5000;
        DataInputStream entrada = null;
        DataOutputStream salida = null;
        
        try{
            Socket sc = new Socket(HOST,PUERTO);
            entrada = new DataInputStream(sc.getInputStream());
            salida = new DataOutputStream(sc.getOutputStream());
            String us = request.getParameter("NUsuario");
            String cor = request.getParameter("correo");
            String nom = request.getParameter("nom");
            String pass = request.getParameter("pass");
            String apP = request.getParameter("apP");
            String apM = request.getParameter("apM");
            salida.writeUTF("REGISTRO_SESION");
            salida.writeUTF(cor);
            salida.writeUTF(us);
            salida.writeUTF(nom);
            salida.writeUTF(pass);
            salida.writeUTF(apP);
            salida.writeUTF(apM);
            String des = entrada.readUTF();
            if(des.equals("false2")){
                response.sendRedirect("index.jsp?CE=2");
            }else{
                String ulname = us;
                nueva_sesion.setAttribute("nom",ulname);
                response.sendRedirect("index.jsp?CE=3");
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
