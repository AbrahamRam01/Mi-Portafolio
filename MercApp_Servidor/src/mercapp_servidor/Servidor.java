package mercapp_servidor;

import com.sun.jndi.cosnaming.CNCtx;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Servidor {
    
   Connection con;
    public Servidor() throws ClassNotFoundException, SQLException{
            String URL = "jdbc:mysql://localhost:3306/MercAppBD";
            String Driver = "com.mysql.jdbc.Driver";
            String username = "root";
            String bdPassword = "n0m3l0";
            Class.forName(Driver);
            con = DriverManager.getConnection(URL, username, bdPassword);
    }

    public static void main(String[] args) throws SQLException, IOException, ClassNotFoundException {
            ServerSocket servidor = null;
            Socket sc = null;
            final int PUERTO = 5000;
            DataInputStream in;
            DataOutputStream out;
            Servidor cn = new Servidor();
      
        try {
            servidor = new ServerSocket(PUERTO);
            System.out.println("Servidor iniciado");
            Statement ps;
            ResultSet rs;
            boolean loop;
            
            while(true){
                sc = servidor.accept();
                in = new DataInputStream(sc.getInputStream());
                out = new DataOutputStream(sc.getOutputStream());               
                System.out.println("Cliente conectado");
                String op = "";
                op = in.readUTF();
                System.out.println("Operacion del cliente: " + op);
            if(!op.equals("")){
                switch (op) {
                    case "mensaje_guardar":
                        String idChat = in.readUTF();
                        String nombre = in.readUTF();
                        String mensaje = in.readUTF();
                        
                        if(idChat.equals("MENADMIN1")){
                            ps = cn.con.createStatement();
                            rs = ps.executeQuery("select count(*) from mensajes_admin");
                            rs.next();
                            int contC = rs.getInt(1) + 1;

                            ps = cn.con.createStatement();
                            ps.executeUpdate("insert into mensajes_admin values("+contC+",'MENADMIN1',"+nombre+",'"+mensaje+"',NOW())");

                            loop = false;
                        }else{
                            ps = cn.con.createStatement();
                            rs = ps.executeQuery("select count(*) from mensajes");
                            rs.next();
                            int contC = rs.getInt(1) + 1;

                            ps = cn.con.createStatement();
                            ps.executeUpdate("insert into mensajes values("+contC+","+idChat+","+nombre+",'"+mensaje+"',NOW())");

                            loop = false;
                        }
                        
                        
                    break;
                    case "INICIO_SESION":///////Inicio de sesion
                    String us = in.readUTF();
                    String pass = in.readUTF();
                    boolean existe = false;
                    int tip = 1;
                    String Si, insertaC;

                        ps = cn.con.createStatement();
                        rs = ps.executeQuery("select * from usuario");

                        while (rs.next()) {
                            ///Descifrado
                            String tipo = rs.getString("tipo");
                            String desClave = "";
                            String result = "";
                            if(tipo!="0"){
                            int num, x=0,cant, div, p=0, c=0, n;
                            Si=rs.getString("contraseña");
                            insertaC="34210";
                            num=Si.length();
                            cant=num;
                            while(cant%5!=0)
                                cant=cant+1;
                            div=cant/5;
                            char[] textini= new char[cant];
                            for (int i = 0; i < num; i++) {
                                textini[i]=Si.charAt(i);
                                if(Si.charAt(i)==' ')
                                    textini[i]='_';
                            } 
                            for (int i = 0; i < cant-num; i++) {
                                textini[i+num]='_';
                            }
                            char[][] descifradito= new char[5][div];
                            int[] clavesini=new int[5];
                            for (int i = 0; i < 5; i++) {
                                for (int j = 0; j < div; j++) {
                                    descifradito[i][j]=textini[c];
                                    c=c+1;
                                }
                            } 
                            for (int i = 0; i < 5; i++) {
                                x=(insertaC.charAt(i))-48;
                                clavesini[x]=i;
                            }

                            for (int i = 0; i < div; i++) {
                                for (int y = 0; y < 5; y++) {
                                    if(descifradito[clavesini[y]][i]=='_')
                                        descifradito[clavesini[y]][i]=' ';
                                    desClave += descifradito[clavesini[y]][i];
                                }     
                            }

                            String str = desClave;
                            Pattern p1 = Pattern.compile("[\\s]");
                            Matcher m = p1.matcher(str);
                            result = m.replaceAll("");
                            }
                            /////////////////////////
                            if(tipo.equals("0") && us.equals(rs.getString("user_name")) && pass.equals(rs.getString("contraseña"))){
                                existe = true;
                                tip = Integer.parseInt(rs.getString("tipo"));
                            }
                            if (us.equals(rs.getString("user_name")) && result.equals(pass)) {
                                existe = true;
                                tip = Integer.parseInt(rs.getString("tipo"));
                            }
                        }



                        if (existe == true) {

                            if(tip == 0){
                                out.writeUTF("true0");
                            }else{
                                out.writeUTF("true1");
                            }

                        }else{
                            out.writeUTF("false");
                        }
                    break;
                    case "REGISTRO_SESION":
                        String cor = in.readUTF();
                        String usR = in.readUTF();
                        String nom = in.readUTF();
                        String passR = in.readUTF();
                        String apP = in.readUTF();
                        String apM = in.readUTF();
                        int contU = 0;
                        boolean existeR = false;
                        String finpass;

                        ps = cn.con.createStatement();
                        rs = ps.executeQuery("SELECT * FROM usuario");

                            while (rs.next()) {
                                contU++;
                                if (usR.equals(rs.getString("user_name"))) {
                                    existeR = true;
                                }
                            }

                        if(existeR == true){
                            out.writeUTF("false2");
                        }else if(existeR == false){

                            ///////////////////////////Cifrado de Transposicion
                                String SiR, insertaCR,des="";
                                    int num, cant, div, c=0;
                                    SiR=passR;
                                    insertaCR="34210";
                                    num=SiR.length();
                                    cant=num;
                                    while(cant%5!=0)
                                        cant=cant+1;
                                    div=cant/5;
                                    char[] textini= new char[cant];
                                    for (int i = 0; i < num; i++) {
                                        textini[i]=SiR.charAt(i);
                                        if(SiR.charAt(i)==' ')
                                            textini[i]='_';
                                    } 
                                    for (int i = 0; i < cant-num; i++) {
                                        textini[i+num]='_';
                                    }
                                    char[][] Opcion= new char[div][5];
                                    for (int i = 0; i < div; i++) {
                                        for (int y = 0; y < 5; y++) {
                                            Opcion[i][y]=textini[c];
                                            c=c+1;
                                        }
                                    } 
                                    for (int i = 0; i < 5; i++) {
                                        for (int y = 0; y < div; y++) {
                                            int k=insertaCR.charAt(i);
                                            k=k-48;
                                            if(Opcion[y][k]=='_')
                                               Opcion[y][k]='_';
                                            des += Opcion[y][k];
                                        }
                                    }  
                                    finpass=des;

                            /////////
                            contU += 1;
                            String apellido = apP + " " + apM;
                            ps = cn.con.createStatement();
                            ps.executeUpdate("INSERT INTO usuario VALUES (" +contU+ ",'"+cor+"','" +nom+ "','" +apellido+ "','"+usR+"','" +finpass+ "','null','null','1',0,0,0);");
                            out.writeUTF("true3");
                        }
                    break;
                }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Servidor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
