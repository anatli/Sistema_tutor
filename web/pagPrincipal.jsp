<%-- 
    Document   : pagPrincipal
    Created on : 14-dic-2017, 11:51:01
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Author     : Ana T.
-->
<html>
    <head>
        <title>Testea</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilos/style.css">
    </head>
    <body>
        <input type="hidden" id="refreshed" value="no">
        <script type="text/javascript">
            function getDate(){
                var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric'};
                var now = new Date();
                document.getElementById("date").innerHTML = now.toLocaleDateString('es-ES',options);
            }
            onload=function(){
            var e=document.getElementById("refreshed");
            if(e.value==="no")e.value="yes";
            else{e.value="no";location.reload();}
            getDate();
            }
        </script>
        <%
                    Cookie[] cks = request.getCookies();
                    String name=null,value=null;
                    if (cks != null) {
                            for (int i = 0; i < cks.length; i++) {
                                    name = cks[i].getName();
                                    value = cks[i].getValue();
                                    if (name.equals("auth")) {
                                            break; // salimos del loop y creamos pag
                                    }
                                    if (i == (cks.length - 1)) // Si no hay cookie valida
                                    {
                                            response.sendRedirect("sessionExpired.jsp");
                                            return;
                                    }
                                    i++;
                            }
                    } else {
                            response.sendRedirect("sessionExpired.jsp");
                            return;
                    }
                %>
        <div class="nombreUsu"> <%= value %> </div>
        <script>
            function deleteCookie(){
                document.cookie='auth=;=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            }
        </script>
        <a class="logout" href="index.jsp" onclick="deleteCookie()">Cerrar sesión</a>
        <button name="imprimir" onclick="window.print()">IMPRIMIR</button>
        <div class="body">
            <br>
            <a class="bienvenida">Bienvenid@ a Testea</a>
            <br><br>
            <hr>
            <fieldset>
                <pre class="descripcion" >
                    <i>¿Qué es Testea?</i>
                    Testea es el sistema tutor que ofrece diferentes tests para evaluar al alumno en la asignatura "desarrollo de servicios telemáticos".
                    Una vez finalizados los tests, aparecerá la solución correcta.
                </pre>
            </fieldset>
            <br>
            <a href="sistemaTutor.jsp" class="enlaceTutor">Acceder al sistema tutor</a>
        </div>
        <p class="ultimoAcceso">Último acceso a la página principal: <span id="date"></span></p>
        <hr>
            Ana Tinoco. Copyright<img class="copyright" src="images/copyright.png" alt="img_not_found" height="10em"width="10em"/>2018
    
    </body>
</html>

