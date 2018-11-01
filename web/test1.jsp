<%-- 
    Document   : test1
    Created on : 14-dic-2017, 11:53:48
    Author     : Asus
--%>

<%@page 
    contentType="text/html" pageEncoding="UTF-8"
    import="test.JavitaTest"
%>
<!DOCTYPE html>
<!--
Author     : Ana T.
-->

<html>
    <head>
        <title>test1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilos/testStyle.css">
        <script src="funciones.js"></script>
    </head>
    <body>
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
        <br>
        <div class="test">
            <div class="cambiarTest">
                <% System.out.println(JavitaTest.aux);
                    int numeroPag=JavitaTest.aux/3+1;
                    %>
             </div>   
                <form action="javitaRespuestas" method="post">
                    <hr>
                    <div class="preguntas">
                        <p class="clase"><%= JavitaTest.pregs.get(JavitaTest.aux)%> </p>
                            <ul style="list-style-type:none;">
                                <li><input type="radio" class="opcion" name="opcion1" value="si">Sí</li>
                                <li><input type="radio" class="opcion" name="opcion1" value="no">No</li>
                                <li><input type="radio" class="opcion" name="opcion1" value="algunas_veces">Algunas veces</li>
                            </ul>
                        <p><%= JavitaTest.pregs.get(JavitaTest.aux+1)%> </p>
                            <ul style="list-style-type:none">
                                <li><input type="radio" class="opcion" name="opcion2" value="si">Sí</li>
                                <li><input type="radio" class="opcion" name="opcion2" value="no">No</li>
                                <li><input type="radio" class="opcion" name="opcion2" value="algunas_veces">Algunas veces</li>
                            </ul>
                        <p><%= JavitaTest.pregs.get(JavitaTest.aux+2)%></p>
                            <ul style="list-style-type:none">
                                <li><input type="radio" class="opcion" name="opcion3" value="si">Sí</li>
                                <li><input type="radio" class="opcion" name="opcion3" value="no">No</li>
                                <li><input type="radio" class="opcion" name="opcion3" value="algunas_veces">Algunas veces</li>
                            </ul>
                    </div>
                    <br>
                    <input type="reset" value="Limpiar" >
                    <br><br>
                    pag <%=numeroPag%>/3
                    <br>
                    <% if(numeroPag!=3)%><input type="submit" name="siguiente" value="Siguiente">
                </form>
                <form action="terminar" method="post"> 
                    <input type="submit" value="Terminar" />
                </form>
            <br>
            <hr>
            <br>
            <form action="evaluacion.jsp">
            </form>
            <a href="sistemaTutor.jsp">Cancelar</a>
            <br>
            <script src="myScript.js"></script>
        </div>
        <hr>
            Ana Tinoco. Copyright<img class="copyright" src="images/copyright.png" alt="img_not_found" height="10em"width="10em"/>2018
    
    </body>
</html>
