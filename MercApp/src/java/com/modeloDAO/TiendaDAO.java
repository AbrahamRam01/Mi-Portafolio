package com.modeloDAO;

import com.modelo.Tienda;
import com.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TiendaDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int agregarT(Tienda t){
        Conexion cn = new Conexion();
        System.out.println("ENTROOOOO "+ t.getIdT());
        String sql = "update tienda set imagen='"+t.getRuta()+"',imagenN='"+t.getNombreImg()+"' where id_tie="+t.getIdT();
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            
        }
        return r;
    }
}
