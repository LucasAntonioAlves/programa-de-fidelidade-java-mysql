/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author LucasPC
 */
public class ClienteDAO extends DataBaseDAO{
    
    public ClienteDAO() throws Exception{}
    
    public ArrayList<Cliente> getLista() throws Exception{
        
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql= "SELECT *FROM cliente";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            Cliente c = new Cliente();
            c.setIdCliente(rs.getInt("idCliente"));
            c.setNome(rs.getString("nome"));
            c.setCpfCnpj(rs.getString("cpfCnpj"));
            c.setQuantidadePedidos(rs.getInt("quantidadePedidos"));
            c.setEndereco(rs.getString("endereco"));
            c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
            c.setTipo(rs.getInt("tipo"));
            lista.add(c);
            
        }
        
        this.desconectar();
        return lista;
        
        
    }
    
        public boolean gravar (Cliente c){
            try{
                this.conectar();
                String sql;
                if (c.getIdCliente()==0){
                    sql = "INSERT INTO cliente(nome, cpfCnpj, quantidadePedidos, endereco, dataNascAbertura, tipo) "
                            +"VALUES(?, ?, ?, ?, ?, ?)";
                }else{
                             sql= "UPDATE cliente SET nome=?, cpfCnpj=?, quantidadePedidos=?, endereco=?, dataNascAbertura=?, tipo=? "
                                     + "WHERE idCliente=? " ;
                          
                            }
                PreparedStatement pstm= conn.prepareStatement(sql);
                pstm.setString(1, c.getNome());
                pstm.setString(2, c.getCpfCnpj());
                pstm.setInt(3, c.getQuantidadePedidos());
                pstm.setString(4, c.getEndereco());
                pstm.setDate(5, new Date (c.getDataNascAbertura().getTime()));
                pstm.setInt(6, c.getTipo());
                if(c.getIdCliente()>0){
                    pstm.setInt(7, c.getIdCliente());
                    
                }
                pstm.execute();
                this.desconectar();
                return true;
                
               
 
            }catch(Exception e){
                System.out.println(e);
                return false;
            }
        }
        
        
        
            public boolean deletar(Cliente c){
                
                try{
                    this.conectar();
                    String sql= "DELETE FROM cliente WHERE idCliente=?";
                    PreparedStatement pstm= conn.prepareStatement(sql);   
                    pstm.setInt(1, c.getIdCliente());
                    pstm.execute();
                    this.desconectar();
                    return true;
                    
                    
                    
                }catch(Exception e){
                System.out.println(e);
                return false;
            }
                
                
            }
            
            public Cliente getCarregaPorID (int idCliente) throws Exception {
                
                Cliente c= new Cliente();
                String sql = "SELECT * FROM cliente WHERE idCliente=? ";
                this.conectar();
                PreparedStatement pstm= conn.prepareStatement(sql);
                pstm.setInt(1, idCliente);  
                ResultSet rs= pstm.executeQuery();
                if(rs.next()){
                    c.setIdCliente(rs.getInt("idCliente"));
                    c.setNome(rs.getString("nome"));
                    c.setCpfCnpj(rs.getString("cpfCnpj"));
                    c.setQuantidadePedidos(rs.getInt("quantidadePedidos"));
                    c.setEndereco(rs.getString("endereco"));
                    c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
                    c.setTipo(rs.getInt("tipo"));

                }
                this.desconectar();
                return c;
                
                
                
            }
        
        
                
        
   
    }
            
     
    

