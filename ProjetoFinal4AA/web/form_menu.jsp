<%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
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
        <h1>Cadastrar Menu</h1>
        
        <form action="gerenciar_menu.do" method="POST">
            <input type="hidden" name="idMenu" id="idMenu" value="${menu.idMenu}"/>
            <div class="row">
                
                <div class="form-group col-sm-5">
                     <label for="nome" class="control-label">Nome Menu</label>
                     <input type="text" name="nome" id ="nome" required="" maxlength="45" value="${menu.nome}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="link" class="control-label">Link</label>
                     <input type="text" name="link" id ="link" required="" maxlength="45" value="${menu.link}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="icone" class="control-label">Icone</label>
                     <input type="text" name="icone" id ="icone"  maxlength="45" value="${menu.icone}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="exibir" class="control-label">Exibir</label>
                     <select class="form-control" name="exibir">
                         <option value="1" 
                                 <c:if test="${menu.exibir==1}"> 
                                     selected=""
                                 </c:if>
                                     >Sim</option>
                        <option value="2" 
                                 <c:if test="${menu.exibir==2}"> 
                                     selected=""
                                 </c:if>
                                     >Não</option>
                     </select>
                </div>
                
            </div>
            
            <div class="">
                <button class="btn btn-success">Gravar</button>
                 
                <a href="listar_menu.jsp" class="btn btn-warning">
                    Voltar
                </a>
            </div>
          
        </form>
        
    </body>
         </div>
</html>
