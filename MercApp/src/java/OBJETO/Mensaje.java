package OBJETO;

public class Mensaje {
    public String nombre;
    public String mensaje;
    public String idchat;

    public Mensaje(String nombre, String mensaje, String idchat) {
        this.nombre = nombre;
        this.mensaje = mensaje;
        this.idchat = idchat;
    }

    Mensaje() {
        
    }

    public String getIdChat() {
        return idchat;
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void SetNombre(String nombre) {
        this.nombre = nombre;
    }

    public void SetMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    public void SetIdChat(String idchat) {
        this.idchat = idchat;
    }
    
}
