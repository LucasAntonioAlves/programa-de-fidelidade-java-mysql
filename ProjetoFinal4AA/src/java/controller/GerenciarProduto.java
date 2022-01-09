/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import model.ProdutoDAO;

/**
 *
 * @author LucasPC
 */
public class GerenciarProduto extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                PrintWriter out = response.getWriter();
                String acao = request.getParameter("acao");
                String idProduto = request.getParameter("idProduto");             
                String mensagem = "";
               
                
                try{
                    Produto p = new Produto();
                    ProdutoDAO pDAO = new ProdutoDAO();
                    if(acao.equals("alterar")){
                        if(GerenciarLogin.verificarPermissao(request, response)){
                                p = pDAO.getCarregaPorID(Integer.parseInt(idProduto));
                                if(p.getIdProduto()>0){
                                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_produto.jsp");
                                    request.setAttribute("produto", p);
                                    disp.forward(request, response);
                                }else{
                                    mensagem = "Produto não encontrado!";

                                }
                                
                        }else{
                            mensagem = "Acesso Negado!";
                        }
                    }
                    
                    if(acao.equals("deletar")){
                        if(GerenciarLogin.verificarPermissao(request, response)){
                                p.setIdProduto(Integer.parseInt(idProduto));
                                if(pDAO.deletar(p)){
                                    mensagem = "Produto deletado com Sucesso!";

                                }else{
                                    mensagem = "Erro ao deletar o Produto";
                                }
                        }else{
                            mensagem = "Acesso Negado!";
                        }
                        
                    }
                    
                }catch(Exception e){
                    out.print(e);
                    mensagem = "Erro ao executar!";
                }
                
                 out.println("<script type='text/javascript'>");
                 out.println("alert('"+mensagem+"')");
                 out.println("location.href='listar_produto.jsp';");
                 out.println("</script>");
            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String idProduto = request.getParameter("idProduto");
        String descricao = request.getParameter("descricao");
        String quantidade = request.getParameter("quantidade");
        String valor = request.getParameter("valor");
        String mensagem = "";
        
        Produto p = new Produto();
        if(!idProduto.isEmpty()){
            p.setIdProduto(Integer.parseInt(idProduto));
            
        }
        if(descricao.equals("") || quantidade.equals("") || valor.equals("")){
            mensagem = "Campos obrigatórios deverão ser preenchidos!";
            
        }else{
            p.setDescricao(descricao);
            p.setQuantidade(Integer.parseInt(quantidade));
            double novoValor=0;
            if(!valor.isEmpty()){
                novoValor= Double.parseDouble(valor.replace(".", "").replace(",", "."));
            }
            
            p.setValor(novoValor);
            try{
                ProdutoDAO pDAO = new ProdutoDAO();
                if(pDAO.gravar(p)){
                    mensagem = "Gravado com sucesso!";
                }else{
                    mensagem = "Erro ao gravar o Produto no banco de dados!";
                }
                
            }catch(Exception e){
                System.out.println(e);
                mensagem = "Erro ao executar!";
            }
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_produto.jsp';");
        out.println("</script>");
            
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
