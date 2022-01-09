/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.ClienteDAO;

/**
 *
 * @author LucasPC
 */
public class GerenciarCliente extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         PrintWriter out = response.getWriter();
         String mensagem="";
         String idCliente = request.getParameter("idCliente");
         String acao = request.getParameter("acao");
       

          try { 
              Cliente c= new Cliente();
              ClienteDAO cDAO = new ClienteDAO();
              if(acao.equals("alterar")){
                  if(GerenciarLogin.verificarPermissao(request, response)){
                      c = cDAO.getCarregaPorID(Integer.parseInt(idCliente));
                      if(c.getIdCliente()>0){
                          RequestDispatcher disp = getServletContext ().getRequestDispatcher("/form_cliente.jsp");
                          request.setAttribute("cliente", c);
                          disp.forward(request, response);
                      }else{
                          mensagem ="Cliente não encontrado";
                      }
                  }else{
                      mensagem ="Acesso Negado";
                  }
              }
              if(acao.equals("deletar")){
                  if(GerenciarLogin.verificarPermissao(request, response)){
                      c.setIdCliente(Integer.parseInt(idCliente));
                      if(cDAO.deletar(c)){
                          mensagem ="Cliente deletado com sucesso";
                         
                      }else{
                          mensagem ="Erro ao deletar o cliente do banco de dados";
                      }
                      
                  }else{
                      mensagem ="Acesso negado";
                  }
              }
          
          }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
          }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_cliente.jsp';");
        out.println("</script>");
          
         
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
        String mensagem="";
        String idCliente = request.getParameter("idCliente");
        String nome = request.getParameter("nome");
        String cpfCnpj = request.getParameter("cpfCnpj");
        String quantidadePedidos = request.getParameter("quantidadePedidos");
        String endereco = request.getParameter("endereco");
        String dataNascAbertura = request.getParameter("dataNascAbertura");
        String tipo = request.getParameter("tipo");
        
        try { 
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Cliente c= new Cliente();
            ClienteDAO cDAO= new ClienteDAO();  
            if(!idCliente.isEmpty()){
                c.setIdCliente(Integer.parseInt(idCliente));
  
            }
            
            if(nome.equals("") || cpfCnpj.equals("")|| quantidadePedidos.equals("")|| endereco.equals("")|| dataNascAbertura.equals("")|| tipo.equals("")){
                mensagem = "Campos Obrigatorios deverao ser preenchidos!!";
            }else{
                c.setNome(nome);
                c.setCpfCnpj(cpfCnpj);
                c.setQuantidadePedidos(Integer.parseInt(quantidadePedidos));
                c.setEndereco(endereco);
                if(!dataNascAbertura.isEmpty()){
                    c.setDataNascAbertura(df.parse(dataNascAbertura));
                }
                c.setTipo(Integer.parseInt(tipo));
                if(cDAO.gravar(c)){
                    mensagem= "Gravado com sucesso!";
                }else{
                    mensagem= "Erro ao gravar cliente no banco de dados";
                    
                }
     
            }
            
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
                    
                    
                    }
            out.println("<script type='text/javascript'>");
            out.println("alert('"+mensagem+"')");
            out.println("location.href='listar_cliente.jsp';");
            out.println("</script>");
        }
        
              

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
