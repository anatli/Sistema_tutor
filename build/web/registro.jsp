<%-- 
    Document   : registro
    Created on : 14-dic-2017, 11:52:38
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
        <script type="text/javascript" src="validateForm.js" ></script>
    </head>
    <body>
        <div class="body">
            <div class="princi">
                <img class="iconoTestea" src="images\Test-512.png" alt="img_not_found"/>
                <a class="bienvenida" style="padding: 0px"></a>
            </div>
            <div class="registrarse">Registrar nuevo usuario:</div>
            <form action="javitaReg" method="POST" onsubmit="return validateForm()">
                <table>
                    <tr>
                        <th>Nombre:</th>
                        <th><input type="text" name="nombre" placeholder="Pepe" id="nombre"/></th>
                    </tr>
                    <tr>
                        <th>Apellido:</th>
                        <th><input type="text" name="apellido" placeholder="García" id="apellido"/></th>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <th><input type="text" name="email" placeholder="Tu_correo@ejemplo.com" id="email"/></th>
                    </tr>
                    <tr>
                        <th>Usuario:</th>
                        <th><input type="text" name="usuario" placeholder="usuario" id="usuario"/></th>
                    </tr>
                    <tr>
                        <th>Contraseña:</th>
                        <th><input type="password" name="password" placeholder="xxx" id="password"/></th>
                    </tr>
                    <tr>
                        <th>Repite contraseña:</th>
                        <th><input type="password" name="password2" placeholder="xxx" id="password2"/></th>
                    </tr>
                </table>
                <div class="registro">
                    <input type="submit" name="bRegistro" value="Registrar"/>
                </div>
                <% 
                    String badName ="";
                    if(request.getAttribute("badName")!=null){
                        badName = request.getAttribute("badName").toString();
                    }
                %>
                <p class="error" id="error"><%= badName %></p>
            </form>
            <br>
            <a href="index.jsp">Cancelar</a>
        </div>
            <hr>
            Ana Tinoco. Copyright<img class="copyright" src="images/copyright.png" alt="img_not_found" height="10em"width="10em"/>2018
    
    </body>
</html>
