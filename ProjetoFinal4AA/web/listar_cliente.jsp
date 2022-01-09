    <%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lista de Clientes</title>
            <script type="text/javascript">
                function confirmarExclusao(id,nome){
                    if(confirm('Deseja realmente excluir o cliente ' +nome+ '?'))
                        location.href="gerenciar_cliente.do?acao=deletar&idCliente="+id;
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
                    <%@include file="banner.jsp" %>
                    <%@include file="menu.jsp" %>
                 </div>
      
                 <div id="listar">
        <h1>Lista de Clientes</h1>
         
        <a href="form_cliente.jsp" class="btn btn-primary">
                        Novo Cliente</a>
         
        <table class="table table-hover table-striped table-bordered"
               id="listarCliente"><br/><br/>
            
           
            
            <thead style="background: orange;">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF / CNPJ</th>
                    <th>Quantidade de Pedidos</th>
                    <th>Endereço</th>
                    <th>Data Nasc / Abertura</th>
                    <th>Tipo</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background: orange;">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF / CNPJ</th>
                    <th>Quantidade de Pedidos</th>
                    <th>Endereço</th>
                    <th>Data Nasc / Abertura</th>
                    <th>Tipo</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.ClienteDAO" id="cDAO"/>
            <tbody>
                 <c:forEach var="c" items="${cDAO.lista}">
            
            <tr>
                    <td>${c.idCliente}</td>
                    <td>${c.nome}</td>
                    <td>${c.cpfCnpj}</td>
                    <td>${c.quantidadePedidos}</td>
                    <td>${c.endereco}</td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.dataNascAbertura}"/> </td>
                    <td>
                        <c:if test="${c.tipo==1}">
                            Fisica
                        </c:if>
                        <c:if test="${c.tipo==2}">
                            Juridica
                        </c:if>    
                           
                    </td>
                   
                <td>
                    <a href="gerenciar_cliente.do?acao=alterar&idCliente=${c.idCliente}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${c.idCliente}, '${c.nome}')">
                        <i class="glyphicon glyphicon-trash"></i>
                    </button>
                        
                        <a href="form_pedido.jsp?acao=novo&idCliente=${c.idCliente}" class="btn btn-primary">
                            <i class="glyphicon glyphicon">Pedidos</i>
                        </a>    
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
                        $("#listarCliente").dataTable({
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
