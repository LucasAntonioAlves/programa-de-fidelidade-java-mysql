<%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário Perfil</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="estilo/form_cadastro.css" type="text/css"/>
        
    </head>
      <body>
         <div id="interface">
        
        
        <div id="menu">
        <%@include file="banner.jsp" %>
        <%@include file="menu.jsp" %>
        </div>
        
        <div id="cadastro">
                <h1>Cadastrar Perfil</h1>

                <form action="gerenciar_perfil.do" method="POST">
                    <input type="hidden" name="idperfil" id="idperfil" value="${perfil.idPerfil}"/>
                    <div class="row">
                        <div class="form-group col-sm-5">
                             <label for="nome" class="control-label">Nome Perfil</label>
                             <input type="text" name="nome" id ="nome" required=""
                                    maxlength="45" value="${perfil.nome}" class="form-control"/>
                        </div>
                    </div>

                    <div class="">
                        <button class="btn btn-success">Gravar</button>

                        <a href="listar_perfil.jsp" class="btn btn-warning">
                            Voltar
                        </a>
                    </div>

                </form>
        
    </body>
         </div>
         </div>
</html>
