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
        <title>Usuário</title>
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
        <h1>Cadastrar Usuário</h1>
        
            <form action="gerenciar_usuario.do" method="POST">
                <input type="hidden" name="idUsuario" id="idUsuario" value="${usuario.idUsuario}"/>
                <div class="row">

                    <div class="form-group col-sm-5">
                         <label for="nome" class="control-label">Nome do Usuário</label>
                         <input type="text" name="nome" id ="nome" required="" maxlength="45" value="${usuario.nome}" class="form-control"/>
                    </div>

                    <div class="form-group col-sm-5">
                         <label for="link" class="control-label">Login</label>
                         <input type="text" name="login" id ="login" required="" maxlength="45" value="${usuario.login}" class="form-control"/>
                    </div>

                    <div class="form-group col-sm-5">
                         <label for="icone" class="control-label">Senha</label>
                         <input type="password" name="senha" id ="senha"  maxlength="45" value="${usuario.senha}" required="" class="form-control"/>
                    </div>

                    <div class="form-group col-sm-5">
                         <label for="status" class="control-label">Status</label>
                         <select class="form-control" name="status">
                             <option value="1" 
                                     <c:if test="${usuario.status==1}"> 
                                         selected=""
                                     </c:if>
                                         >Ativo</option>
                            <option value="2" 
                                     <c:if test="${usuario.status==2}"> 
                                         selected=""
                                     </c:if>
                                         >Inativo</option>
                         </select>
                    </div>


                    <div class="form-group col-sm-5">
                         <label for="perfil" class="control-label">Perfil</label>
                         <select class="form-control" name="idPerfil" required="">
                             <option value="">Selecione o Perfil</option>
                             <jsp:useBean class="model.PerfilDAO" id="perfil" />
                             <c:forEach var="p" items="${perfil.lista}">
                                 <option value="${p.idPerfil}"
                                         <c:if test="${p.idPerfil==usuario.perfil.idPerfil}">selected="" </c:if>
                                 >   ${p.nome}</option>

                             </c:forEach>     
                         </select>
                    </div>

                </div>

                <div class="">
                    <button class="btn btn-success">Gravar</button>

                    <a href="listar_usuario.jsp" class="btn btn-warning">
                        Voltar
                    </a>
                </div>

            </form>
        
    </body>
         </div>
         </div>
</html>
