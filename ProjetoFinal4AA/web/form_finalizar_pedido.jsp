

<%@page import="model.PedidoProduto"%>
<%@page import="model.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <script type="text/javascript">
            function excluir(index, item){
                
                if(confirm("Tem certeza que deseja excluir o item"+item+"?")){
                    
                    window.open("gerenciar_carrinho.do?acao=del&index="+index,"_self");
                    
                }
                
            }
        </script>
        <title>Finalizar Pedido</title>
    </head>
    <body>
        
        
        <div id="interface">
            
            
             <div id="menu">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
             </div>
            
             
             <div id="listar">
            <h1>Finalizar Pedido</h1>
            
            <%
                Pedido p = new Pedido();
                Cliente c = new Cliente();
                try{
                    
                        p = (Pedido)session.getAttribute("pedido");
                    
                
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
            
            %>
            
            <br /><br />
            <h4>Vendedor: <%=p.getVendedor().getNome()%></h4>
           
            <h4>Cliente: <%=p.getCliente().getNome()%><br /><br/></h4>
            
             
            
            
                <form action="gerenciar_pedido.do" method="POST">   
                                   
                    <div class="form-group col-sm-5">
                        <label for="status" class="control-label">Forma de Pagamento</label>
                        <select class="form-control" name="status">
                            <option value="1" 
                                    <c:if test="${pedido.formaPagamento==1}"> 
                                        selected=""
                                    </c:if>
                                        >Dinheiro</option>
                           <option value="2" 
                                    <c:if test="${pedido.formaPagamento==2}"> 
                                        selected=""
                                    </c:if>
                                        >Cartão</option>
                        </select>
                     </div>
                
                    
                    <div class="form-group col-sm-5">
                        <label for="total" class="control-label">Valor Total do Pedido</label>
                        <input type="total" name="total" id ="total"  maxlength="45" 
                             
                               value="${pedido.total}" required="" class="form-control"/>
                    </div>
                    
                    
                    <div class="form-group col-sm-5">
                        <label for="status" class="control-label">Status</label>
                        <select class="form-control" name="status">
                            <option value="1" 
                                    <c:if test="${pedido.status==1}"> 
                                        selected=""
                                    </c:if>
                                        >Ativo</option>
                           <option value="2" 
                                    <c:if test="${pedido.status==2}"> 
                                        selected=""
                                    </c:if>
                                        >Inativo</option>
                        </select>
                     </div>
                    
                    
                    <div class="form-group col-sm-5">
                        <label for="tipoPedido" class="control-label">Tipo de Pedido</label>
                        <select class="form-control" name="tipoPedido">
                            <option value="1" 
                                    <c:if test="${pedido.tipoPedido==1}"> 
                                        selected=""
                                    </c:if>
                                        >BEBIDAS</option>
                           <option value="2" 
                                    <c:if test="${pedido.tipoPedido==2}"> 
                                        selected=""
                                    </c:if>
                                        >LANCHES</option>
                        </select>
                     </div>
                    
                    <div class="form-group col-sm-5">
                        <label for="entrega" class="control-label">Entrega</label>
                        <select class="form-control" name="idEntrega" required="">
                            <option value="">Selecione a Entrega</option>
                            <jsp:useBean class="model.EntregaDAO" id="entrega" />
                            <c:forEach var="e" items="${entrega.lista}">
                                <option value="${e.idEntrega}"
                                        <c:if test="${e.idEntrega==pedido.entrega.idEntrega}">selected="" </c:if>
                                >   ${e.idEntrega}</option>

                            </c:forEach>     
                        </select>
                   
            </div>
                       
                </form>    
                   
                    
                    
                    
                           
            <table class="table table-striped table-bordered table-hover display" id="listarPedido">
                
                <thead style="background-color: orange">
                    <tr>
                        <th>Item</th>
                        <th>Produto</th>
                        <th>QTD</th>
                        <th>Valor</th>
                        <th>Total</th>
                        <th>Remover</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        double total = 0;
                        int cont = 0;
                        for(PedidoProduto pp:p.getCarrinho()){
                    
                    %>
                    <tr>
                        <td align="center"><%=cont+1%></td>
                        <td><%=pp.getProduto().getDescricao()%></td>
                        <td><%=pp.getQtdVendida()%></td>
                        <td>R$ <%=pp.getValor()%></td>
                        <td>R$ <%=pp.getQtdVendida()*pp.getValor()%></td>
                        <td align="center">
                            <a href="#" onclick="excluir(<%=cont%>,<%=cont+1%>)" class="btn btn-danger">
                                <i class="glyphicon glyphicon-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        total = total + (pp.getQtdVendida()*pp.getValor());
                        
                        cont++;
                    }
                    
                    %>
                </tbody>
                
                
            </table>
            
            
            <a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a>
            <a href="form_pedido.jsp?acao=c" class="btn btn-success">Continuar Pedido</a>
            <a href="gerenciar_pedido.do" class="btn btn-success">Gravar</a>
        </div>
                </div>
           
    </body>
    <script type="text/javascript" src="datatables/jquery.js"></script>
          <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
          <script type="text/javascript">
              $(document).ready(function(){
                  $("#listarPedido").dataTable({
                      "bJQueryUI": true,
                      "oLanguage":{
                          "sProcessing":"Processando...",
                          "sLengthMenu": "Mostrar _MENU_ registros",
                          "sZeroRecords": "Não foram encontrados resultados",
                          "sInfo": "Mostrar de _START_ até _END_ de _TOTAL_ registros",
                          "sInfoEmpty":"Mostrando de 0 até 0 de 0 registros",
                          "sInfoFiltered": "",
                          "sInfoPostFix":"",
                          "sSearch": "Pesquisar",
                          "sUrl":"",
                          "oPaginate":{
                              "sFirst":"Primeiro",
                              "sPrevious":"Anterior",
                              "sNext":"Próximo",
                              "sLast":"Último"
                          }
                      }
                  })
              })
          </script>      
</html>

