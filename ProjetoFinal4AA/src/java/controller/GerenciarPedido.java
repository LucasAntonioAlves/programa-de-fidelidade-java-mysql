/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Entrega;
import model.Pedido;
import model.PedidoDAO;


public class GerenciarPedido extends HttpServlet {

    
 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
                PrintWriter out = response.getWriter();
                String mensagem ="";
                String idPedido = request.getParameter("idPedido");
                String formaPagamento = request.getParameter("formaPagamento");
                String total = request.getParameter("total");
                String status = request.getParameter("status");
                String tipoPedido = request.getParameter("tipoPedido");
                String idEntrega = request.getParameter("idEntrega");
               
        HttpSession session = request.getSession(); 
                                 

                        try{
            Pedido p = (Pedido) session.getAttribute("pedido");
            PedidoDAO pDAO = new PedidoDAO();
            if(!idPedido.isEmpty()){
                p.setIdPedido(Integer.parseInt(idPedido));          
            }

            if(formaPagamento.equals("") || total.equals("") || status.equals("") || tipoPedido.equals("") || idEntrega.equals("")){
                mensagem = "Campos obrigatórios deverão ser preenchidos!";
            }else{
                        p.setFormaPagamento(Integer.parseInt(formaPagamento));
                        p.setTotal(Double.parseDouble(total));
                        p.setStatus(Integer.parseInt(status));
                        p.setTipoPedido(Integer.parseInt(tipoPedido));
                        Entrega e = new Entrega();
                        e.setIdEntrega(Integer.parseInt(idEntrega));
                        p.setEntrega(e);

                if (pDAO.registrar(p)){
                    mensagem = "Gravado com sucesso!";
            }else{
                    mensagem = "Erro ao gravar o Pedido!";
                    }
            }
            
        }catch(Exception ef){
            out.print(ef);
            mensagem = "Erro ao executar";
            
        }
                        
                        out.println("<script type='text/javascript'>");
                        out.println("alert('"+mensagem+"')");
                        out.println("location.href='listar_menu.jsp';");
                        out.println("</script>");

        }
            
    

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
        
        
        
    }

   