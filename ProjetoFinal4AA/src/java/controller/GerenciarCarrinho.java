/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Pedido;
import model.PedidoProduto;
import model.Produto;
import model.ProdutoDAO;


public class GerenciarCarrinho extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            try{
                Pedido p = (Pedido) session.getAttribute("pedido");
                ArrayList<PedidoProduto> carrinho = p.getCarrinho();
                String acao = request.getParameter("acao");
                ProdutoDAO pDAO = new ProdutoDAO();
                if(acao.equals("add")){
                    Produto pd = new Produto();
                    int idProduto = Integer.parseInt(request.getParameter("idProduto"));
                    pd = pDAO.getCarregaPorID(idProduto);
                    int qtdVendida = Integer.parseInt(request.getParameter("qtdVendida"));
                    PedidoProduto pp = new PedidoProduto();
                    pp.setProduto(pd);
                    pp.setQtdVendida(qtdVendida);
                    pp.setValor(pd.getValor());
                    carrinho.add(pp);
                    p.setCarrinho(carrinho);
                    session.setAttribute("pedido", p);
                    response.sendRedirect("form_pedido.jsp?acao=c");
                    
                    
                }else if(acao.equals("del")){
                    int index = Integer.parseInt(request.getParameter("index"));
                    carrinho.remove(index);
                    p.setCarrinho(carrinho);
                    session.setAttribute("pedido", p);
                    response.sendRedirect("form_finalizar_pedido.jsp");
                   
                }
                
                
            }catch(Exception e){
                out.print(e);
            }
            
            
            
            
            
            out.println("<h1>Servlet GerenciarCarrinho at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
