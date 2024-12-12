package com.modelo;

public class Usuario {
    private int idU;
    private String nombre_user;
    private String ruta, nombreImg;

    public Usuario() {
    }

    public Usuario(int idU, String nombre_user, String ruta, String nombreImg) {
        this.idU = idU;
        this.nombre_user = nombre_user;
        this.ruta = ruta;
        this.nombreImg = nombreImg;
    }

    public int getIdU() {
        return idU;
    }

    public void setIdU(int idU) {
        this.idU = idU;
    }

    public String getNombre_user() {
        return nombre_user;
    }

    public void setNombre_user(String nombre_user) {
        this.nombre_user = nombre_user;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getNombreImg() {
        return nombreImg;
    }

    public void setNombreImg(String nombreImg) {
        this.nombreImg = nombreImg;
    }
    
    
    
    
}
