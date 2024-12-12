package com.modeloDAO;

import com.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int agregar(Usuario u){
        Conexion cn = new Conexion();
        String sql = "update usuario set imagen='"+u.getRuta()+"',imagenN='"+u.getNombreImg()+"' where id_usu="+u.getIdU();
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            
        }
        return r;
    }
    
    public List<Usuario> listar(){
        Conexion cn = new Conexion();
        String sql = "select * from usuario";
        List<Usuario> lista = new ArrayList<>();
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario p = new Usuario();
                p.setIdU(rs.getInt("id_usu"));
                p.setNombre_user(rs.getString("user_name"));
                p.setRuta(rs.getString("imagen"));
                lista.add(p);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
}
