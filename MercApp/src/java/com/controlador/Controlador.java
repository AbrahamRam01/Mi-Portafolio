package com.controlador;

import com.modelo.Tienda;
import com.modelo.Usuario;
import com.modeloDAO.TiendaDAO;
import com.modeloDAO.UsuarioDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        
        int id = 0,idP = 0,idT = 0;
        
        try{
            id = Integer.parseInt(request.getParameter("id"));
        }catch(Exception e){
            id = 0;
        }
        
        try{
            idP = Integer.parseInt(request.getParameter("idP"));
        }catch(Exception e){
            idP = 0;
        }
        
        try{
            idT = Integer.parseInt(request.getParameter("idT"));
        }catch(Exception e){
            idT = 0;
        }
        
        ///////////////
        Usuario u = new Usuario();
        UsuarioDAO udao = new UsuarioDAO();
        ///////////////
        Tienda t = new Tienda();
        TiendaDAO tdao = new TiendaDAO();
        ///////////////
        String nombreImg = "";
        try{
        switch (accion){
            case "Guardar":
                ArrayList<String> lista = new ArrayList<>();
                try{
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem)items.get(i);
                        if(!fileItem.isFormField()){
                            File f = new File("C:/Users/Abrah/OneDrive/Documentos/NetBeansProjects/MercApp/web/imagenesU/BDM"+fileItem.getName());
                            nombreImg = "BDM"+fileItem.getName();
                            fileItem.write(f);
                            u.setRuta(f.getAbsolutePath());
                        }else{
                            lista.add(fileItem.getString());
                        }
                    }
                    u.setNombreImg(nombreImg);
                    u.setNombre_user(lista.get(0));
                    u.setIdU(id);
                    udao.agregar(u);
                }catch(Exception e){
                    
                }
                response.sendRedirect("CONFIGURACION.jsp");
                break;
            case "GuardarT":
                ArrayList<String> listaT = new ArrayList<>();
                try{
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem)items.get(i);
                        if(!fileItem.isFormField()){
                            File f = new File("C:/Users/Abrah/OneDrive/Documentos/NetBeansProjects/MercApp/web/imagenesT/BDM"+fileItem.getName());
                            nombreImg = "BDM"+fileItem.getName();
                            fileItem.write(f);
                            t.setRuta(f.getAbsolutePath());
                        }else{
                            listaT.add(fileItem.getString());
                        }
                    }
                    t.setNombreImg(nombreImg);
                    t.setIdT(idT);
                    tdao.agregarT(t);
                }catch(Exception e){
                    
                }
                response.sendRedirect("MI_TIENDA.jsp?id="+idT);
                break;
            case "Listar":
                List<Usuario> usuarios = udao.listar();
                request.setAttribute("usuarios", usuarios);
                request.getRequestDispatcher("CONFIGURACION.jsp").forward(request, response);
                break;
        }
    }catch(Exception e){
        System.out.println(e);
        switch(accion){
            case "Guardar":
                
                break;
            case "GuardarT":
                
                break;
        }
    }
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
