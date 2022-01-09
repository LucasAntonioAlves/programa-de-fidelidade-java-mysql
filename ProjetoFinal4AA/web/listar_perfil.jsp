    <%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
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
                    if(confirm('Deseja realmente excluir o perfil ' +nome+ '?'))
                        location.href="gerenciar_perfil.do?acao=deletar&idPerfil="+id;
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
        <h1>Lista de Perfis</h1>
         
        <a href="form_perfil.jsp" class="btn btn-primary">
            Novo Perfil</a>
        
        
        <table class="table table-hover table-striped table-bordered"
               id="listarperfil"><br/><br/>
            
           
            
            <thead style="background: orange;">
                <tr>
                    <th>IdPerfil</th>
                    <th>Nome</th>
                    <th>Opções</th>
                </tr>
            </thead>
            
            
            <tfoot style="background: orange;">
                <tr>
                    <th>IdPerfil</th>
                    <th>Nome</th>
                    <th>Opções</th>
                </tr>
            </tfoot>

            
                <jsp:useBean class="model.PerfilDAO" id="pDAO"/>
            <tbody>
                 <c:forEach var="p" items="${pDAO.lista}">
            
            <tr>
                    <td>${p.idPerfil}</td>
                    <td>${p.nome}</td>
                <td>
                    <a href="gerenciar_perfil.do?acao=alterar&idPerfil=${p.idPerfil}" class="btn btn-primary">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                    <button class="btn btn-danger" onclick="confirmarExclusao(${p.idPerfil}, '${p.nome}')">
                        <i class="glyphicon glyphicon-trash"></i>
                    </button>
                        
                    <a class="btn btn-default" href="gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=${p.idPerfil}">
                        <i class="glyphicon">Acessos</i>
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
                        $("#listarperfil").dataTable({
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
