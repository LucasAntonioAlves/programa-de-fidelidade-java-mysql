

<%@page import="java.util.ArrayList"%>
<%@page import="model.PedidoProduto"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Entrega"%>
<%@page import="model.Cliente"%>
<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário Pedido</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="estilo/form_cadastro.css" type="text/css"/>
        
    </head>
         <div id="interface">
    <body>
        
        
        <div id="menu">
        <%@include file="banner.jsp" %>
        <%@include file="menu.jsp" %>
        </div>
        
        
        <div id="cadastro">
        <h1>Cadastrar Pedido Parte I</h1>
        
        <% 
        
            Pedido p = new Pedido();
            Cliente c = new Cliente();
            Entrega e = new Entrega();
            try{
                
              String acao = request.getParameter("acao");
              ClienteDAO cDAO = new ClienteDAO();
              if(acao.equals("novo")){
                  int idCliente= Integer.parseInt(request.getParameter("idCliente"));
                  c = cDAO.getCarregaPorID(idCliente);
                  p.setCliente(c);
                  p.setVendedor(ulogado);
                  p.setEntrega(e);
                  p.setCarrinho(new ArrayList<PedidoProduto>());
                  session.setAttribute("pedido", p);
                  
              }else{
                  
                  p = (Pedido)session.getAttribute("pedido");
              }
                
            }catch(Exception f){
                out.print("Erro: " +f);
                
        }
        %>
        
        <br />
        <h4>Vendedor: <%=p.getVendedor().getNome()%></h4>
      
        <h4>Cliente: <%=p.getCliente().getNome()%></h4>
      
        Catálago: (<%=p.getCarrinho().size()%> Itens no Carrinho)
         <br />
       
        <jsp:useBean class="model.ProdutoDAO" id="produto" />
        <c:forEach var="p" items="${produto.lista}">
            
            <div id="prod${p.idProduto}">
                
                <form action="gerenciar_carrinho.do" method="POST">   
                                   
                    <input type="hidden" name="acao" value="add">
                    <input type="hidden" name="idProduto" value="${p.idProduto}">
                    ${p.descricao}
                    <input type="number" name="qtdVendida" value="1" style="width: 60px">
                    
                    <button class="btn btn-default">
                        <i class="glyphicon glyphicon">Adicionar</i>
                    </button>
                       
                </form>    
            </div>
                                               
          </c:forEach>
          
             
      
        
        <br>
        <a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a>
        <a href="form_finalizar_pedido.jsp" class="btn btn-success">Finalizar Pedido</a>
        </div>  
    </body>
         </div>
</html>
