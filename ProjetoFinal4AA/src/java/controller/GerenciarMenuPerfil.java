
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.PerfilDAO;


public class GerenciarMenuPerfil extends HttpServlet {

 
            
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String mensagem= "";
        String idPerfil = request.getParameter("idPerfil");
        String acao = request.getParameter("acao");
        try{
            
            PerfilDAO pDAO = new PerfilDAO();
            Perfil p = new Perfil();
            if(acao.equals("gerenciar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                p = pDAO.getCarregaPorID(Integer.parseInt(idPerfil));
                if(p.getIdPerfil()>0){
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu_perfil.jsp");
                    request.setAttribute("perfilv", p);
                    disp.forward(request, response);
                    
                }else{
                    mensagem = "Perfil não encontrado";
                }
                
                }else{
                    mensagem = "Acesso Negado!";
                }
                
            }
            
            if(acao.equals("desvincular")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                String idMenu = request.getParameter("idMenu");
                if(idMenu.equals("")){
                    mensagem = "O campo idMenu deverá ser selecionado!";
                }else{
                    if(pDAO.desvincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))){
                        mensagem = "Desvinculado com sucesso!";
                    }else{
                        mensagem = "Erro ao desvincular!";
                    }
                }
                
                }else{
                    mensagem = "Acesso Negado!";
                }
            }
            
        }catch(Exception e){
            out.println(e);
            mensagem = "Erro ao executar";
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil="+idPerfil+"';");
        out.println("</script>");
       
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        PrintWriter out = response.getWriter();
        String mensagem="";
        String idPerfil = request.getParameter("idPerfil");
        String idMenu = request.getParameter("idMenu");
        
        try{
            
            if(idPerfil.equals("")||idMenu.equals("")){
                mensagem = "Campos obrigatórios deverão ser selecionados!";
                
            }else{
                PerfilDAO pDAO = new PerfilDAO();
                if(pDAO.vincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))){
                    mensagem = "Vinculado com sucesso!";
                }else{
                    mensagem = "Erro ao vincular o menu ao Perfil!";
                }
               
            }
            
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar!";
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil="+idPerfil+"';");
        out.println("</script>");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
