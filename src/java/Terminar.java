
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.JavitaTest;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Asus
 */
@WebServlet("/terminar")
public class Terminar extends HttpServlet{
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
         for(int i=0; i<3;++i){
                int num=JavitaTest.aux+i;
                System.out.println("pos: "+num+ " valor: "+request.getParameter("opcion"+(i+1)));
                JavitaTest.elecciones.add(num, request.getParameter("opcion"+(i+1)));
            }
          (new JavitaTest()).sigPag();
          
          response.sendRedirect("evaluacion.jsp");
    
    }
}