package CHAT;

import OBJETO.DecoderMensaje;
import OBJETO.EncoderMensaje;
import OBJETO.Mensaje;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value= "/CHAT", encoders = {EncoderMensaje.class},
                                decoders = {DecoderMensaje.class}
)

public class MiChat {
    
    public static final List<Session> conectados = new ArrayList<>();
    
    @OnOpen
    public void inicio(Session sesion) throws IOException, EncodeException{
        conectados.add(sesion);
        System.out.println("creada");
    }
    
    @OnClose
    public void salir(Session sesion){
        conectados.remove(sesion);
        System.out.println("borrada");
    }
    
    @OnMessage
    public void mensaje(Mensaje mensaje) throws IOException, EncodeException, SQLException, InterruptedException{

        for (Session sesion: conectados) {
            sesion.getBasicRemote().sendObject(mensaje);
        }
            
            final String HOST = "localhost";
            final int PUERTO = 5000;
            Socket sc = new Socket(HOST,PUERTO);
            DataInputStream entrada;
            DataOutputStream salida;
            entrada = new DataInputStream(sc.getInputStream());
            salida = new DataOutputStream(sc.getOutputStream());
            salida.writeUTF("mensaje_guardar");
            salida.writeUTF(mensaje.getIdChat());
            salida.writeUTF(mensaje.getNombre());
            salida.writeUTF(mensaje.getMensaje());
    }
    
}
