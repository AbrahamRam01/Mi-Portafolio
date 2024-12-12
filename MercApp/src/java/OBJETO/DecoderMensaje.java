package OBJETO;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.*;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class DecoderMensaje implements Decoder.TextStream<Mensaje> {
    
    @Override
    public Mensaje decode(Reader reader) throws DecodeException, IOException {
        Mensaje mensaje = new Mensaje();
        try(JsonReader jsonReader =Json.createReader(reader)){
            JsonObject json = jsonReader.readObject();
            mensaje.SetNombre(json.getString("nombre"));
            mensaje.SetIdChat(json.getString("idchat"));
            mensaje.SetMensaje(json.getString("mensaje"));
            
        }
        
        return mensaje;
    }
    
    
    
    @Override
    public void init(EndpointConfig config){
    }
    
    @Override
    public void destroy(){
    }
    
}
