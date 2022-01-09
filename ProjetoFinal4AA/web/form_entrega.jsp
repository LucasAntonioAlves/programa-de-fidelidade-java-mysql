<%-- Author: Hilton Carvalho --%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="estilo/form_cadastro.css" type="text/css"/>
        
        <title>Formulário de Entrega</title>
    </head>
    <body>
        <div id="interface" class="container"> 
            
            <div id="menu">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            </div>
            
            
             <div id="cadastro">
            <h1>Cadastrar Entrega</h1>
            <form action="gerenciar_entrega.do" method="POST"> 
                <input type="hidden" name="idEntrega" id="idEntrega" value="${entrega.idEntrega}"/>
                <div class="row">
                    
                    <div class="form-group col-sm-5">
                     <label for="tipoEntrega" class="control-label">Tipo de Entrega</label>
                     <select class="form-control" name="tipoEntrega">
                         <option value="1" 
                                 <c:if test="${entrega.tipoEntrega==1}"> 
                                     selected=""
                                 </c:if>
                                     >Delivery</option>
                        <option value="2" 
                                 <c:if test="${entrega.tipoEntrega==2}"> 
                                     selected=""
                                 </c:if>
                                     >Balcão</option>
                     </select>
                    </div>
                    
                  
                    
                    <div class="form-group col-sm-6">
                        <label for="entregador" class="control-label">Nome do Entregador</label>
                        <select class="form-control" name="idEntregador" required="">
                            <option value="">Selecione o Entregador</option>
                            <jsp:useBean class="model.EntregadorDAO" id="entregador"/>
                            <c:forEach var="ee" items="${entregador.lista}">
                                <option value="${ee.idEntregador}"
                                        <c:if test="${ee.idEntregador==entrega.entregador.idEntregador}">selected=""</c:if>
                                >   ${ee.nome}</option>
                            </c:forEach>
                        </select>
                    </div>
                            
                </div>
                            
                <div class="row">&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_entrega.jsp" class="btn btn-warning">Voltar</a>
                </div> 
            </form>
        </div>
        </div>
    </body>
</html>
