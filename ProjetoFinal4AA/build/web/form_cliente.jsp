<%-- 
    Document   : index
    Created on : 19/02/2020, 10:21:16
    Author     : Administrador
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário Cliente</title>
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
            <h1>Cadastrar Cliente</h1>
        <form action="gerenciar_cliente.do" method="POST">
            <input type="hidden" name="idCliente" id="idCliente" value="${cliente.idCliente}"/>
            <div class="row">
                
                <div class="form-group col-sm-5">
                     <label for="nome" class="control-label">Nome</label>
                     <input type="text" name="nome" id ="nome" required="" maxlength="45" value="${cliente.nome}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="cpfCnpj" class="control-label">CPF / CNPJ</label>
                     <input type="text" name="cpfCnpj" id="cpfCnpj" required="" maxlength="14" value="${cliente.cpfCnpj}" class="form-control"/>
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="quantidadePedidos" class="control-label">Quantidade de Pedidos</label>
                     <input type="text" name="quantidadePedidos" id ="quantidadePedidos"  maxlength="45" value="${cliente.quantidadePedidos}" class="form-control"/>
                </div>
                <div class="form-group col-sm-5">
                     <label for="endereco" class="control-label">Endereço</label>
                     <input type="text" name="endereco" id ="endereco"  maxlength="100" value="${cliente.endereco}" class="form-control"/>
                </div>
                <div class="form-group col-sm-5">
                     <label for="dataNascAbertura" class="control-label">Data Nasc / Abertura</label>
                     <br>
                     <input type="text" name="dataNascAbertura" id ="dataNascAbertura"  maxlength="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataNascAbertura}"/>">
                </div>
                
                <div class="form-group col-sm-5">
                     <label for="tipo" class="control-label">Tipo</label>
                     <select class="form-control" name="tipo">
                         <option value="1" 
                                 <c:if test="${cliente.tipo==1}"> 
                                     selected=""
                                 </c:if>
                                     >Física</option>
                        <option value="2" 
                                 <c:if test="${cliente.tipo==2}"> 
                                     selected=""
                                 </c:if>
                                     >Juridica</option>
                     </select>
                </div>
                
            </div>
            
           
               <p> 
            <button class="btn btn-success">Gravar</button>
            <a href="listar_cliente.jsp" class="btn btn-warning">
                    Voltar
                </a>
                </p>
                
                 
          
            
          
        </form>
                </div>
                                  
        
    </body>
         </div>
</html>
