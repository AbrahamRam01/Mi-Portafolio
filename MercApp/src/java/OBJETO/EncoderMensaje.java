package OBJETO;

import java.io.IOException;
import java.io.Writer;
import javax.json.*;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class EncoderMensaje implements Encoder.TextStream<Mensaje> {
    
    @Override
    public void encode(Mensaje object, Writer writer) throws EncodeException, IOException {
        JsonObject json = Json.createObjectBuilder()
                .add("nombre", object.getNombre())
                .add("idchat", object.getIdChat())
                .add("mensaje",object.getMensaje())
                    .build();
        
        try(JsonWriter jsonWriter = Json.createWriter(writer)){
            jsonWriter.writeObject(json);
        }
       
        
        
    }
    
    @Override
    public void init(EndpointConfig config){
    }
    
    @Override
    public void destroy(){
        
    }
}
