
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <title>Listar Entrega</title>
        <script type="text/javascript">
            function confirmarExclusao(id, tipoEntrega) {
                if(confirm('Deseja relmente excluir a entrega ' +tipoEntrega+ '?')) {
                    location.href='gerenciar_entrega.do?acao=deletar&idEntrega='+id;
                }
            }
        </script>
    </head>
    <body>
        <div id="interface">
            
             <div id="menu">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
             </div>
            
            <div id="listar">
            <h1>Entregas</h1>
            
            <a href="form_entrega.jsp" class="btn btn-primary">Nova Entrega</a><br><br>
            
            <table class="table table-hover table-striped table-bordered display" id="listarEntrega">                
                <thead style="background-color: orange"> 
                    <tr>
                        <th>ID</th>
                        <th>Nome do Entregador</th>
                        <th>Tipo de Entrega</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot style="background-color: orange"> 
                    <tr> 
                        <th>ID</th>
                        <th>Nome do Entregador</th>
                        <th>Tipo de Entrega</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>               
                <jsp:useBean class="model.EntregaDAO" id="eeDAO"/> 
                
                <tbody>
                    <c:forEach var="ee" items="${eeDAO.lista}"> 
                    <tr>
                        <td>${ee.idEntrega}</td>
                        <td>${ee.entregador.nome}</td>
                        <td>
                        <c:if test="${ee.tipoEntrega==1}">
                            Delivery
                        </c:if>
                        <c:if test="${ee.tipoEntrega==2}">
                            Balcão
                        </c:if>    
                           
                    </td>
                            <td>
                                    <a class="btn btn-primary" href="gerenciar_entrega.do?acao=alterar&idEntrega=${ee.idEntrega}">
                                        <i class="glyphicon glyphicon-pencil"></i>             
                                    </a>
                                        
                                    <button class="btn btn-danger" onclick="confirmarExclusao(${ee.idEntrega},'${ee.tipoEntrega}')">
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
                    $("#listarEntrega").dataTable({
                        "bJQueryUI": true,
                        "oLanguage": {
                            "sProcessing":"Processando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrar de _START_ até _END_ de _TOTAL_ registros",
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
                    })
                })
            </script>
           
            
        </div>
    </body>
</html>
