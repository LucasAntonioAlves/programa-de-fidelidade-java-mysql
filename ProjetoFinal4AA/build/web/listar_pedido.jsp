    <%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lista de Usuários</title>
            <script type="text/javascript">
                function confirmarExclusao(id){
                    if(confirm('Deseja realmente desativar o pedido' +id+ '?'))
                        location.href="gerenciar_pedido.do?acao=deletar&idPedido="+id;
                }
            </script>
            
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
    </head>
         
        
        <body>
          <div id="interface">
              
              <div id="menu">
                  <div id="menu">
                    <%@include file="banner.jsp" %>
                    <%@include file="menu.jsp" %>
                 </div>
              </div>
      
                 
        <div id="listar">           
        <h1>Lista de Pedidos</h1>
         
        <a href="listar_cliente.jsp" class="btn btn-primary">
                        Voltar para Cliente</a>
        
        
        <table class="table table-hover table-striped table-bordered"
               id="listarPedido"><br/><br/>
            
           
            
            <thead style="background-color: orange">
                <tr>
                    <th>ID Pedido</th>
                    <th>Data</th>
                    <th>Horario</th>
                    <th>Forma Pagamento</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Tipo Pedido</th>
                    <th>ID Entrega</th>
                    <th>ID Usuario(Vendedor)</th>
                    <th>ID Cliente</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background-color: orange">
                <tr>
                    <th>ID Pedido</th>
                    <th>Data</th>
                    <th>Horario</th>
                    <th>Forma Pagamento</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Tipo Pedido</th>
                    <th>ID Entrega</th>
                    <th>ID Usuario(Vendedor)</th>
                    <th>ID Cliente</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.PedidoDAO" id="pDAO"/>
            <tbody>
                 <c:forEach var="p" items="${pDAO.lista}">
            
            <tr>
                    <td>${p.idPedido}</td>
                    <td><fmt:formatDate pattern="dd/MM/YYYY" value="${p.data}"/></td>
                    <td>${p.horario}</td>
                    
                    <td>
                        <c:if test="${p.formaPagamento==1}">
                            Dinheiro
                        </c:if>
                        <c:if test="${p.formaPagamento==2}">
                            Cartão
                        </c:if>    
                           
                    </td>
                    
                    <td>${p.total}</td>
                    
                   <td>
                        <c:if test="${p.status==1}">
                            Ativo
                        </c:if>
                        <c:if test="${p.status==2}">
                            Inativo
                        </c:if>    
                           
                    </td>
                    
                    <td>
                        <c:if test="${p.tipoPedido==1}">
                            Hamburguer
                        </c:if>
                        <c:if test="${p.tipoPedido==2}">
                            Bebidas
                        </c:if>    
                           
                    </td>
                    
                    <td>${p.entrega}</td>  
                    <td>
                        ${p.vendedor.idUsuario} -
                        ${p.vendedor.nome}</td>                   
                    <td>
                        ${p.cliente.idCliente} -
                        ${p.cliente.nome}</td>
                    
                           
                   
                <td>
                    <a href="gerenciar_pedido.do?acao=alterar&idPedido=${p.idPedido}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${p.idPedido})">
                        <i class="glyphicon glyphicon-trash"></i>
                    </button>
                </td>
            </tr>
                
                </c:forEach>
             </tbody>
             
             
        </table>
        </div>
                <script type="text/javascript" src="datatables/jquery.js"></script>
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarPedido").dataTable({
                            "bJQueryUI": true,
                            "oLanguage": {
                                "sProcessing":"Processando...",
                                "sLengthMenu":"Mostrar _MENU_ registros",
                                "sZeroRecords": "Não foram encontrados resultados",
                                "sInfo": "Mostrar de _START_ ate _END_ de _TOTAL_ registros",
                                "sInfoEmpty": "Mostrando de 0 ate 0 de 0 registros",
                                "sInfoFiltered": "",
                                "sInfoPostFix": "",
                                "sSearch": "Pesquisar",
                                "sUrl": "",
                                "oPaginate": {
                                    "sFirst": "Primeiro",
                                    "sPrevious": "Anterior",
                                    "sNext": "Próximo",
                                    "sLast": "Último"
                                 
                                    
                                }
                            }
                        });
                    });
                </script>
                
        </body>
        </div>
</html>
