
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


public class GerenciarPerfil extends HttpServlet {

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String mensagem="";
        
        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");
        
        Perfil p = new Perfil();
        
        try {
            
            PerfilDAO pDAO = new PerfilDAO();
            if(acao.equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    p = pDAO.getCarregaPorID(Integer.parseInt(idPerfil));
                    if(p.getIdPerfil()>0){
                        RequestDispatcher disp =  getServletContext().getRequestDispatcher("/form_perfil.jsp");
                        request.setAttribute("perfil", p);
                        disp.forward(request, response);

                    }else{
                        mensagem = "Perfil não Encontrado";
                    }
                
                }else{
                    mensagem = "Acesso Negado!";
                }    
                    
            }
            
            if(acao.equals("deletar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    p.setIdPerfil(Integer.parseInt(idPerfil));
                    if(pDAO.deletar(p));
                        mensagem = "Perfil deletado com sucesso!";

                    }else{
                        mensagem= "Erro ao excluir o Perfil!";
                    }
                
            }else{
                mensagem = "Acesso Negado!";
            }
            
        }catch(Exception e){
                out.print(e);
                mensagem = "Erro ao executar";
            } 
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_perfil.jsp';");
        out.println("</script>");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
        String idperfil = request.getParameter("idperfil");
        String nome = request.getParameter("nome");
        
        String mensagem="";
        
        Perfil p = new Perfil();
      
        try{
            
            PerfilDAO pDAO = new PerfilDAO();
            if(!idperfil.isEmpty()){
                p.setIdPerfil(Integer.parseInt(idperfil));
        }
            
            if(nome.equals("")||nome.isEmpty()){
                mensagem = "Campos obrigatorios deverão ser preenchidos!";
               
            }else{
               
                p.setNome(nome);
                if(pDAO.gravar(p)){
                    mensagem= "Gravado com sucesso";
            }else{
                    mensagem= "Erro ao gravar no banco!";    
                }
            }
            
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar!";
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_perfil.jsp';");
        out.println("</script>");
        
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
