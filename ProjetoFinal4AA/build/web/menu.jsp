<%@page import="controller.GerenciarLogin"%>
<%@page import="model.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="estilo/imagens.css" type="text/css"/>
<link rel="stylesheet" href="estilo/estilo.css" type="text/css"/>
<link rel="stylesheet" href="estilo/menu.css" type="text/css"/>

<%
    
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);

%>
<body>
    

   
   
	<div class="header">    
            <a href="index.jsp" class="logo"><span style="color: red;font-family: Arial Black">Big</span>Burg</a>           
            <div class="header-right">
                <c:if test="${ulogado != null && ulogado.perfil != null}">
                    <c:forEach var="menu" items="${ulogado.perfil.menus}">
                        <c:if test="${menu.exibir==1}">                       
                             <a id="menu" href="${menu.link}">${menu.nome}</a>
                        </c:if>    
                    </c:forEach>
                 </c:if>
            </div>              
            
        </div>

 
    
        <div class="pull-right"><h4>Bem Vindo, <c:if test="${ulogado != null }">${ulogado.nome}</c:if>
            <a href="gerenciar_login.do" class="btn btn-success">Sair</h4></a>    
        </div>    

   
         
          
</body>   
         
        
    
   

  
 
