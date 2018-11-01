<%-- 
    Document   : sistemaTutor
    Created on : 03-ene-2018, 1:32:49
    Author     : Asus
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page 
    contentType="text/html" pageEncoding="UTF-8"
    import="test.JavitaTest"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema tutor</title>
        <link rel="stylesheet" type="text/css" href="estilos/style.css">
        <script type="text/javascript" src="moverImagen.js" />

    </head>
    <body>
                <input type="hidden" id="refreshed" value="no">
        <script type="text/javascript">
            onload=function(){
            var e=document.getElementById("refreshed");
            if(e.value==="no")e.value="yes";
            else{e.value="no";location.reload();}
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
        <div class="body">
            <a class="logout" href="index.jsp" onclick="deleteCookie()">Cerrar sesión</a>
            <br>
            <a class="SistemaTutor">
                Testea
                <br>
                <i>Sistema tutor</i>
                <br><br>
            </a>
            
            <div style="font-size:1.1em;">Tests de desarrollo de servicios telemáticos</div>
            <br>
            <script type="text/javascript">
                function subm(){
                    document.getElementById('testForm').submit();
                }
            </script>
            <table id="tests" >
                <form id="testForm" action="javitaTestForm" method="POST"> </form>
                <form id="testForm2" action="javitaTestForm2" method="POST"> </form>
                <form id="testForm3" action="javitaTestForm3" method="POST"> </form>
                    <tr>
                        <th>Test</th>
                        <th>Dificultad</th>
                      </tr>
                      <tr>
                          <td><a href="javascript:subm();"  >Test 1</a></td>
                        <td>*</td>
                      </tr>
                        <td><a href="javascript:redirect();" onclick="document.getElementById('testForm2').submit()">Test 2</a></td>
                        <td>**</td>
                      <tr>
                        <td><a href="javascript:redirect();" onclick="document.getElementById('testForm3').submit()">Test 3</a></td>
                        <td>***</td>
                      </tr>
               
            </table>
            <br>
            <hr>
            Ana Tinoco. Copyright<img class="copyright" src="images/copyright.png" alt="img_not_found" height="10em"width="10em"/>2018     
            <div id="imagenAnimacion">
                <img src="images\keep-calm-and-prepare-for-a-test.png" alt="img_not_found" onMouseOver="moverImg()" height="130px" width="120px"/>
            
            </div>
        </div>
        </body>
</html>
