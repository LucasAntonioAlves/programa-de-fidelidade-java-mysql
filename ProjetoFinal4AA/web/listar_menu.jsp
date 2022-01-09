    <%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <title>Lista de Perfis</title>
            <script type="text/javascript">
                function confirmarExclusao(id,nome){
                    if(confirm('Deseja realmente excluir o menu ' +nome+ '?'))
                        location.href="gerenciar_menu.do?acao=deletar&idMenu="+id;
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
        <h1>Lista de Menus</h1>
         
        <a href="form_menu.jsp" class="btn btn-primary">
                        Novo Menu</a>
        
        
        <table class="table table-hover table-striped table-bordered"
               id="listarMenu"><br/><br/>
            
           
            
            <thead style="background-color: orange">
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Icone</th>
                    <th>Exibir</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background-color: orange">
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Icone</th>
                    <th>Exibir</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.MenuDAO" id="mDAO"/>
            <tbody>
                 <c:forEach var="m" items="${mDAO.lista}">
            
            <tr>
                    <td>${m.idMenu}</td>
                    <td>${m.nome}</td>
                    <td>${m.link}</td>
                    <td>${m.icone}</td>
                    <td>
                        <c:if test="${m.exibir==1}">
                            Sim
                        </c:if>
                        <c:if test="${m.exibir==2}">
                            Não
                        </c:if>    
                           
                    </td>
                   
                <td>
                    <a href="gerenciar_menu.do?acao=alterar&idMenu=${m.idMenu}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${m.idMenu}, '${m.nome}')">
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
                        $("#listarMenu").dataTable({
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
