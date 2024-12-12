package OBJETO_PARAMETRO;

public class TIPO_PARAMETRO {
    public int idU;
    public String tipo;
    public String codOp;

    public TIPO_PARAMETRO() {
    }

    public TIPO_PARAMETRO(int idU, String tipo, String codOp) {
        this.idU = idU;
        this.tipo = tipo;
        this.codOp = codOp;
    }

    public int getIdU() {
        return idU;
    }

    public void setIdU(int idU) {
        this.idU = idU;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCodOp() {
        return codOp;
    }

    public void setCodOp(String codOp) {
        this.codOp = codOp;
    }
    
    
}
