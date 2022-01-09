/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class PedidoDAO extends DataBaseDAO{
     
    public PedidoDAO() throws Exception{
    }
    
    public boolean registrar(Pedido p){
        
        try{
            
            this.conectar();
            String sql = "INSERT INTO pedido (data, horario, formaPagamento, total, status, tipoPedido, idEntrega, idUsuario, idCliente) "
                    + "VALUES(now(), now(), ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, p.getFormaPagamento());
            pstm.setDouble(2, p.getTotal());
            pstm.setInt(3, p.getStatus());
            pstm.setInt(4, p.getTipoPedido());
            pstm.setInt(5, p.getEntrega().getIdEntrega());
            pstm.setInt(6, p.getVendedor().getIdUsuario());
            pstm.setInt(7, p.getCliente().getIdCliente());
            pstm.execute();
            ResultSet rs = pstm.getGeneratedKeys();
            if(rs.next()){
                p.setIdPedido(rs.getInt(1));
                
            }
            for(PedidoProduto pp: p.getCarrinho()){
                String sql_pp = "INSERT INTO pedido_produto(idPedido, idProduto, qtdVendida, valor) "
                        + "VALUES(?,?,?,?)";
                PreparedStatement pstm_pp = conn.prepareStatement(sql_pp);
                pstm_pp.setInt(1, p.getIdPedido());
                pstm_pp.setInt(2, pp.getProduto().getIdProduto());
                pstm_pp.setInt(3, pp.getQtdVendida());
                pstm_pp.setDouble(4, pp.getValor());
                pstm_pp.execute();
            }
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
        
    }
    
    public ArrayList<Pedido> getLista() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM pedido";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        while(rs.next()){
            Pedido p = new Pedido();
            p.setIdPedido(rs.getInt("idPedido"));
            p.setData(rs.getDate("data"));
            p.setHorario(rs.getDate("horario"));
            p.setFormaPagamento(rs.getInt("formaPagamento"));
            p.setTotal(rs.getDouble("total"));
            p.setStatus(rs.getInt("status"));
            p.setTipoPedido(rs.getInt("tipoPedido"));
            EntregaDAO eDAO = new EntregaDAO();
            p.setEntrega(eDAO.getCarregaPorID(rs.getInt("idEntrega")));
            UsuarioDAO uDAO = new UsuarioDAO();
            p.setVendedor(uDAO.getCarregaPorID(rs.getInt("idUsuario")));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.getCarregaPorID(rs.getInt("idCliente")));
            lista.add(p);      
        }
        this.desconectar();
        return lista;
        
    }
}
