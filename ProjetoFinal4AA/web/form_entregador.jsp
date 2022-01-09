
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="estilo/form_cadastro.css" type="text/css"/>
        
        <title>Formulario Entregador</title>
    </head>
    
    <body id="planoDeFundo">
        
        <div id="interface" class="container">
            
            <div id="menu">
                <%@include file="banner.jsp" %>
                <%@include file="menu.jsp" %>
            </div>
            
            <div id="cadastro">
            <h1>Cadastrar Entregador</h1>
            <form action="gerenciar_entregador.do" method="POST">
                <input type="hidden" name="idEntregador" id="idEntregador" value="${entregador.idEntregador}"/>
                
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="nome" class="control-label">Nome do Entregador</label>
                        <input type="text" class="form-control" id="nome" name="nome" required="" value="${entregador.nome}" maxlength="45"/>
                   </div>
               </div>
                   
               <div class="row">&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_entregador.jsp" class="btn btn-warning">Voltar</a>
                </div> 
                   
            </form>
        </div>
        </div>
    </body>
</html>
