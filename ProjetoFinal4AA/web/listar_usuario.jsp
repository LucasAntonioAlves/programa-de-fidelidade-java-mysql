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
        
        <title>Lista de Usuários</title>
            <script type="text/javascript">
                function confirmarExclusao(id,nome){
                    if(confirm('Deseja realmente desativar o usuario ' +nome+ '?'))
                        location.href="gerenciar_usuario.do?acao=deletar&idUsuario="+id;
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
        <h1>Lista de Usuários</h1>
         
        <a href="form_usuario.jsp" class="btn btn-primary">
                        Novo Usuário</a>
        
        
        <table class="table table-hover table-striped table-bordered"
               id="listarUsuario"><br/><br/>
            
           
            
            <thead style="background-color: orange">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Login</th>
                    <th>Status</th>
                    <th>Perfil</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background-color: orange">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Login</th>
                    <th>Status</th>
                    <th>Perfil</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.UsuarioDAO" id="uDAO"/>
            <tbody>
                 <c:forEach var="u" items="${uDAO.lista}">
            
            <tr>
                    <td>${u.idUsuario}</td>
                    <td>${u.nome}</td>
                    <td>${u.login}</td>
                    
                    <td>
                        <c:if test="${u.status==1}">
                            Ativo
                        </c:if>
                        <c:if test="${u.status==2}">
                            Inativo
                        </c:if>    
                           
                    </td>
                   
                    <td>${u.perfil.nome}</td>
                <td>
                    <a href="gerenciar_usuario.do?acao=alterar&idUsuario=${u.idUsuario}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${u.idUsuario}, '${u.nome}')">
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
                        $("#listarUsuario").dataTable({
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
