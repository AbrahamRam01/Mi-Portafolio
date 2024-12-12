package com.modelo;

public class Tienda {
    private int idT;
    private String ruta, nombreImg;

    public Tienda() {
    }

    public Tienda(int idT, String ruta, String nombreImg) {
        this.idT = idT;
        this.ruta = ruta;
        this.nombreImg = nombreImg;
    }

    public int getIdT() {
        return idT;
    }

    public void setIdT(int idT) {
        this.idT = idT;
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
