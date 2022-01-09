/* Author: Hilton Carvalho */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Entregador;
import model.EntregadorDAO;

public class GerenciarEntregador extends HttpServlet {

    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String mensagem = "";
        
        String acao = request.getParameter("acao");
        String idEntregador = request.getParameter("idEntregador");
        
        Entregador e = new Entregador();
        
        try {
            
            EntregadorDAO eDAO = new EntregadorDAO();
            
            if(acao.equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)) {
                    e = eDAO.getCarregaPorID(Integer.parseInt(idEntregador));
                    if(e.getIdEntregador()>0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_entregador.jsp");
                        request.setAttribute("entregador", e);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Entregador não encontrado!";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
            
            if(acao.equals("deletar")) {
                if(GerenciarLogin.verificarPermissao(request, response)) {
                    e.setIdEntregador(Integer.parseInt(idEntregador));
                    if(eDAO.deletar(e)) {
                        mensagem = "Deletado com sucesso!";
                    } else {
                        mensagem = "Erro ao excluir Entregador";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
            
        } catch(Exception f) {
            out.print(f);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_entregador.jsp';");
        out.println("</script>");
        
    }

    
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter(); 
        
        String idEntregador = request.getParameter("idEntregador");
        String nome = request.getParameter("nome");
        
        String mensagem = "";
        
        Entregador e = new Entregador();
        
        try {
            EntregadorDAO eDAO = new EntregadorDAO();
            if(!idEntregador.isEmpty()) {
                e.setIdEntregador(Integer.parseInt(idEntregador));
            }
            if(nome.equals("") ||nome.isEmpty()) {
                mensagem = "Campos obrigatórios deverão ser Preechidos!!!";
            } else {
                e.setNome(nome);
                if(eDAO.gravar(e)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "!!!Erro ao gravar no Banco de Dados!!!";
                }
            }
        } catch(Exception f) {
            out.print(f);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>"); 
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_entregador.jsp';");
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
