<%-- 
    Document   : evaluacion
    Created on : 22-ene-2018, 17:00:47
    Author     : Asus
--%>

<%@page import="test.JavitaTest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos/testStyle.css">
        <title>Evaluación</title>
    </head>
    <body>
            <body style=" text-align: center;">
        CORRECCIÓN Pag <%= JavitaTest.aux/3 %>
        <br><br>
        <% int num=JavitaTest.aux-3; 
         for(int i=0; i<3;++i){
             %>Pregunta <%=(new JavitaTest()).getPreg(num)%>
            <br>
            Elección: <%= (new JavitaTest()).getElec(num) %>
            <br>
            <div class="correccion">Respuesta correcta: <%= (new JavitaTest()).getResp(num) %>
            </div><br><br> <%
                ++num;
         }
        %>
        <a href="evaluacion2.jsp">Fin</a>
        
    </body>
</html>
