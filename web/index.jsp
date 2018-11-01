<%-- 
    Document   : index.jsp
    Created on : 14-dic-2017, 11:48:24
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Author     : Ana T.
-->
<html>
    <head>
        <title>Sistema tutor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilos/style.css">
        <script type="text/javascript" src="images\Test-512.png" ></script>
    </head>
    <body>
        <div class="body">
            <div class="princi">
                <a class="bienvenida">Testea</a>
                <img class="iconoTestea" src="images/Test-512.png" alt="img_not_found"/>         
            </div>
            <div class="iniciarSesion">Iniciar sesión: </div>
            <form action="javitaInicio" method="POST" onsubmit="return validateForm();">
                <table>
                    <tr>
                        <th>Usuario:</th>
                        <th><input type="text" name="usuario" placeholder="usuario" id="usuario"/></th>
                    </tr>
                    <tr>
                        <th>Contraseña:</th>
                        <th><input type="password" name="password" placeholder="xxx" id="password"/></th>
                    </tr>
                </table>
                <div class="iniciarSesion">
                    <input type="submit" name="bIniciarSesion" value="Entrar"/>
                </div>
                <% 
                    String error = "", valido = null;
                    if(request.getAttribute("errores")!=null){
                        error = request.getAttribute("errores").toString();
                    }else if(request.getAttribute("ok")!=null){
                        valido=request.getAttribute("ok").toString();
                    }
                    if(valido!=null){%>
                        <script>alert('<%=valido%>');</script>
                <%}%>
                <p class="error"><%= error %></p>
            </form> 
                <div class="reg">
                    ¿No está registrado aún?
                    <a href="registro.jsp">Registrarse</a>
                </div>
        </div>
            <hr>
            Ana Tinoco. Copyright<img class="copyright" src="images/copyright.png" alt="img_not_found" height="10em"width="10em"/>2018
    </body>
</html>
