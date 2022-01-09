
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class EntregadorDAO extends DataBaseDAO {
    
    public EntregadorDAO() throws Exception {} 
    
    public boolean gravar (Entregador e){
        
        try {
            
            String sql;
            this.conectar();
            
            if(e.getIdEntregador()==0) {
                sql= "INSERT INTO entregador(nome) VALUES(?)";
            } else {
                sql= "UPDATE entregador SET nome=? WHERE idEntregador=?";
            }   
            
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, e.getNome());
            
            if (e.getIdEntregador()>0) {
                pstm.setInt(2, e.getIdEntregador());
            }    
            
            pstm.execute();
            this.desconectar();
            return true;  
            
        }catch(Exception f){
            System.out.println(f);
            return false;
        }   
    }
    
    public ArrayList<Entregador> getLista() throws Exception { 
        
        ArrayList<Entregador>  lista = new ArrayList<Entregador>(); 
        String SQL = "SELECT * FROM entregador"; 
        this.conectar(); 
        Statement stm = conn.createStatement(); 
        ResultSet rs = stm.executeQuery(SQL); 
        while(rs.next()) { 
            Entregador e = new Entregador();
            e.setIdEntregador(rs.getInt("idEntregador"));
            e.setNome(rs.getString("nome"));
            lista.add(e);
        }
        this.desconectar();
        return lista;
    }
    
    public Entregador getCarregaPorID(int idEntregador) throws Exception {
        
        Entregador e = new Entregador();
        String sql = "SELECT * FROM entregador WHERE idEntregador=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEntregador);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()) {
            e.setIdEntregador(rs.getInt("idEntregador"));
            e.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return e;
    }
    
    public boolean deletar (Entregador e) {
        
        try {
            this.conectar();
            String sql = "DELETE FROM entregador WHERE idEntregador=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, e.getIdEntregador());
            pstm.execute();
            this.desconectar();
            return true;
        } catch(Exception f) {
            System.out.println(f);
            return false;
        }
        
    }
    
}

