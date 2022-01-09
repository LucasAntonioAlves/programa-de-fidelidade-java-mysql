/* Author: Hilton Carvalho */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Entrega;
import model.EntregaDAO;
import model.Entregador;

public class GerenciarEntrega extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();   
        
        String acao = request.getParameter("acao");
        String idEntrega = request.getParameter("idEntrega");
        
        String mensagem = "";
        
        
        
        try {
            Entrega ee = new Entrega();
            EntregaDAO eeDAO = new EntregaDAO();
            
            if(acao.equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    ee = eeDAO.getCarregaPorID(Integer.parseInt(idEntrega));
                    if(ee.getIdEntrega()>0){
                        RequestDispatcher disp =  getServletContext().getRequestDispatcher("/form_entrega.jsp");
                        request.setAttribute("entrega", ee);
                        disp.forward(request, response);

                    }else{
                        mensagem = "Entrega não Encontrada!";
                    }
                
                }else{
                    mensagem = "Acesso Negado!";
                }    
                    
            }
            
            if(acao.equals("deletar")) {
                if(GerenciarLogin.verificarPermissao(request, response)) {
                    ee.setIdEntrega(Integer.parseInt(idEntrega));
                    if(eeDAO.deletar(ee)) {
                        mensagem = "Deletado com sucesso!";
                    } else {
                        mensagem = "Erro ao excluir cliente";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
            
        } catch(Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_entrega.jsp';");
        out.println("</script>");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter(); 
        String idEntrega = request.getParameter("idEntrega");
        String tipoEntrega = request.getParameter("tipoEntrega");
        String idEntregador = request.getParameter("idEntregador");
        
        String mensagem = ""; 
        
        Entrega ee = new Entrega();
        
        try {
            
            EntregaDAO eeDAO = new EntregaDAO();
            if(!idEntrega.isEmpty()) {
                ee.setIdEntrega(Integer.parseInt(idEntrega));
            }
            
            if(tipoEntrega.equals("")  ||idEntregador.equals("")) {
                mensagem = "Campos obrigatórios deverão ser Preechidos!!!";
            } else {
                ee.setTipoEntrega(Integer.parseInt(tipoEntrega));          
                Entregador e = new Entregador();
                e.setIdEntregador(Integer.parseInt(idEntregador));
                ee.setEntregador(e); 
                
                if(eeDAO.gravar(ee)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "!!!Erro ao gravar no Banco de Dados!!!";
                }
            }  
            
        } catch(Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }   
        out.println("<script type='text/javascript'>"); 
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_entrega.jsp';"); 
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
