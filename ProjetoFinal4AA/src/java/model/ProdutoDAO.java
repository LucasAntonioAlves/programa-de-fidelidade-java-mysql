
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class ProdutoDAO extends DataBaseDAO{
    
    public ProdutoDAO() throws Exception{
        
    }
    
    public ArrayList<Produto> getLista() throws Exception{
        
        ArrayList<Produto> lista = new ArrayList<Produto>();
        String sql = "SELECT * FROM produto";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            
            Produto p = new Produto();
            p.setIdProduto(rs.getInt("idProduto"));
            p.setDescricao(rs.getString("descricao"));
            p.setQuantidade(rs.getInt("quantidade"));
            p.setValor(rs.getDouble("valor"));
            lista.add(p);
            
        }
        
        this.desconectar();
        return lista;
        
    }
    
    public boolean gravar(Produto p){
        
        try{
          this.conectar();
          String sql;
          if(p.getIdProduto()== 0){
              sql = "INSERT INTO produto(descricao, quantidade, valor) "
                      + "VALUES(?,?,?)";
          }else{
              sql = "UPDATE produto SET descricao=?, quantidade=?, valor=? "
                      + "WHERE idProduto=?";
          }
          
          PreparedStatement pstm = conn.prepareStatement(sql);
          pstm.setString(1, p.getDescricao());
          pstm.setInt(2, p.getQuantidade());
          pstm.setDouble(3, p.getValor());
          if(p.getIdProduto()> 0){
              pstm.setInt(4, p.getIdProduto());
          }
          
          pstm.execute();
          this.desconectar();
          return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
            
        }
    }
    
    public boolean deletar(Produto p){
        
        try{
            this.conectar();
            String sql = "DELETE FROM produto WHERE idProduto=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, p.getIdProduto());
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
            
            
        }
    }
    
    public Produto getCarregaPorID(int idProduto) throws Exception{
        
        Produto p = new Produto();
        String sql = "SELECT * FROM produto WHERE idProduto=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idProduto);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            p.setIdProduto(rs.getInt("idProduto"));
            p.setDescricao(rs.getString("descricao"));
            p.setQuantidade(rs.getInt("quantidade"));
            p.setValor(rs.getDouble("valor"));
           
            
        }
            this.desconectar();
            return p;
    }
}
