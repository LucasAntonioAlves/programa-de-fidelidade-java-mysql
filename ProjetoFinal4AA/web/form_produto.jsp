<%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário Produto</title>
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
        <h1>Cadastrar Produto</h1>
        
        <form action="gerenciar_produto.do" method="POST">
            <input type="hidden" name="idProduto" id="idProduto" value="${produto.idProduto}"/>
            <div class="row">
                
                <div class="form-group col-sm-5">
                     <label for="nome" class="control-label">Nome/Descrição</label>
                     <input type="text" name="descricao" id="descricao" required="" maxlength="45" value="${produto.descricao}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="quantidade" class="control-label">Quantidade</label>
                     <input type="text" name="quantidade" id="quantidade" required="" maxlength="45" value="${produto.quantidade}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="valor" class="control-label">Valor</label>
                     <input type="text" class="form-control" name="valor" id="valor" maxlength="45" value="<fmt:formatNumber pattern="#,##0.00" value="${produto.valor}"/>"/>
                </div>
                
                
                
            </div>
            
            <div class="">
                <button class="btn btn-success">Gravar</button>
                 
                <a href="listar_produto.jsp" class="btn btn-warning">
                    Voltar
                </a>
            </div>
          
        </form>
             </div>
        
    </body>
         </div>
</html>
