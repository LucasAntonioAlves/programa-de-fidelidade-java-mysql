
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class EntregaDAO extends DataBaseDAO{
    
    public EntregaDAO() throws Exception{
        
    }
    
    public ArrayList<Entrega> getLista() throws Exception{
        Entregador e = new Entregador();
        this.conectar();   
        String sql = "SELECT *, e.nome FROM entrega ee " + "INNER JOIN entregador e ON e.idEntregador = ee.idEntregador ";           
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Entrega> lista = new ArrayList<Entrega>();
        while(rs.next()){
                Entrega ee = new Entrega();
                ee.setIdEntrega(rs.getInt("ee.idEntrega"));                             
                e.setNome(rs.getString("e.nome"));
                e.setIdEntregador(rs.getInt("ee.idEntregador"));
                ee.setTipoEntrega(rs.getInt("ee.tipoEntrega"));
                ee.setEntregador(e);
                lista.add(ee);          
            
        }
        
        this.desconectar();
        return lista;
    } 
    
    public boolean gravar(Entrega ee){
        
        try{
            String sql;
            this.conectar();
            if(ee.getIdEntrega()==0){
                sql = "INSERT INTO entrega (idEntregador, tipoEntrega) "
                        + "VALUES (?,?)";
                        
            }else{
                
                sql = "UPDATE entrega SET idEntregador=?, tipoEntrega=? "
                        + "WHERE idEntrega=?";
                
            }
            
            PreparedStatement pstm = conn.prepareStatement(sql);         
            pstm.setInt(1, ee.getEntregador().getIdEntregador());
            pstm.setInt(2, ee.getTipoEntrega());
            if(ee.getIdEntrega()>0){
                pstm.setInt(3, ee.getIdEntrega());
            }
            pstm.execute();
            this.desconectar();
            return true;
            
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public Entrega getCarregaPorID(int idEntrega) throws Exception{
        Entrega ee = new Entrega();
        
        Entregador e = new Entregador();
        String sql = "SELECT ee.* , e.nome FROM entrega ee "
                + "INNER JOIN entregador e ON e.idEntregador = ee.idEntregador "
                + "WHERE ee.idEntrega=? ";
        
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEntrega);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
                ee.setIdEntrega(rs.getInt("ee.idEntrega"));              
                e.setNome(rs.getString("e.nome"));
                e.setIdEntregador(rs.getInt("ee.idEntregador"));
                ee.setTipoEntrega(rs.getInt("ee.tipoEntrega"));
                ee.setEntregador(e);    
               
               
        }
        
        this.desconectar();
        return ee;
    }
    
     public boolean deletar(Entrega ee){
        
        try{
            this.conectar();
            String sql = "DELETE FROM entrega WHERE idEntrega=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, ee.getIdEntrega());
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
            
            
        }
    }
    
}