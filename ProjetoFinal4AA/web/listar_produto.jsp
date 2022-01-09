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
        
        <title>Lista de Produtos</title>
            <script type="text/javascript">
                function confirmarExclusao(id,descricao){
                    if(confirm('Deseja realmente excluir o produto ' +descricao+ '?'))
                        location.href="gerenciar_produto.do?acao=deletar&idProduto="+id;
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
        <h1>Lista de Produtos</h1>
         
        <a href="form_produto.jsp" class="btn btn-primary">
                        Novo Produto</a>
        
        
        <table class="table table-hover table-striped table-bordered"
               id="listarProduto"><br/><br/>
            
           
            
            <thead style="background-color: orange">
                <tr>
                    <th>ID Produto</th>
                    <th>Nome/Descrição</th>
                    <th>Quantidade</th>
                    <th>Valor</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background-color: orange">
                <tr>
                    <th>ID Produto</th>
                    <th>Nome/Descrição</th>
                    <th>Quantidade</th>
                    <th>Valor</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.ProdutoDAO" id="pDAO"/>
            <tbody>
                 <c:forEach var="p" items="${pDAO.lista}">
            
            <tr>
                    <td>${p.idProduto}</td>
                    <td>${p.descricao}</td>
                    <td>${p.quantidade}</td>
                    <td>R$ <fmt:formatNumber pattern="#,##0.00" value="${p.valor}"/></td>
                   
                   
                <td>
                    <a href="gerenciar_produto.do?acao=alterar&idProduto=${p.idProduto}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${p.idProduto}, '${p.descricao}')">
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
                        $("#listarProduto").dataTable({
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
