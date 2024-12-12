package PARAMETROS;

import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/PARAMETROS")
public class Parametros {
 
    @OnMessage
    public String mensaje(String mensaje) {
        
        return "Operacion: " + mensaje;
    }
}
