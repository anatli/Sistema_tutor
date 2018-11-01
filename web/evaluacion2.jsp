<%-- 
    Document   : evaluacion2
    Created on : 12-feb-2018, 21:27:01
    Author     : Asus
--%>

<%@page import="test.JavitaTest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos/testStyle.css">
        <title>Evaluacion</title>
    </head>
    <body>
        <% 
            int res=0,numElec=JavitaTest.elecciones.size(),numResp=JavitaTest.resps.size();
            System.out.println(""+numElec);
            for(int i=0;i<numElec;++i){
                if(JavitaTest.resps.get(i).equalsIgnoreCase(JavitaTest.elecciones.get(i)))res++;
            }
        %>
        <script>
        function deleteCookie(){
            document.cookie='auth=;=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        }
        </script>
        <a class="logout" href="index.jsp" onclick="deleteCookie()">Cerrar sesión</a>
        <br>
        <div class="test">
        Your total score is:
        <%= res%>/<%=numResp%>
        <br><br>
        <%= (float)(res * 100)/numResp%>%
        <br><br>
        <% String mensajito=""; if(res<3){ mensajito="Deberías estudiar más"; }
        else if(res<6){mensajito="No está horrible, pero se puede mejorar mucho.";}else{mensajito="¡Bien hecho!";} %>
        <%= mensajito %>
        <br><br>
        <a href="sistemaTutor.jsp">Volver a Sistema Tutor</a>            
        </div>
    </body>
</html>
