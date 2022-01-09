<%-- 
    Document   : form_login
    Created on : 04/09/2020, 21:57:20
    Author     : LucasPC
--%>

<!DOCTYPE html>
<html>
    
        <head>
                <meta charset="utf-8">
                <title>Login Big Burguer</title>                
                <link rel="stylesheet" href="estilo/login.css" type="text/css"/>
                
        </head>
        
    <body>
        <div class="wrapper">
      <div class="title">
    Login</div>
        
        <%
            String mensagem = (String)request.getSession().getAttribute("mensagem");
            if(mensagem != null){
                request.getSession().removeAttribute("mensagem");
               
        
        %>
        
        <div class="alert alert-info"><%=mensagem%></div>
        
        <%
            }
        %>    
        
       <form action="gerenciar_login.do" method="POST">
           
                        <div class="field">
                          <input type="text" name="login" id="login" required>
                          <label>Login</label>
                        </div>
           
                        <div class="field">
                          <input type="password" name="senha" id="senha" required>
                          <label>Senha</label>
                        </div>
           
                        <div class="content">                                  
                                    <label>Big Burguer feito para Você!</label>                                 
                        </div>
           
        <div class="field">
          <input type="submit" value="Entrar">
        </div>
                            

</form>
</div>
</body>
</html>
