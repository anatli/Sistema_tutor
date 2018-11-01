import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/javitaInicio")
public class JavitaInicio extends HttpServlet{
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        // read form fields
        String username = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        if(!username.isEmpty() && !password.isEmpty()){
            
            //System.out.println("username: " + username);
            //System.out.println("password: " + password);
            
            // do some processing here...
            try{
                File file=new File("usuYcontra.txt");
                BufferedReader br= new BufferedReader(new FileReader(file));
                String linea;
                String[] usus=null;
                while((linea=br.readLine())!=null){
                    usus=linea.split(",");
                    if(username.equals(usus[0]))break;
                } br.close();
                if(linea!=null && usus!=null && usus[1].equals(password)){
                    Cookie ck= new Cookie("auth",usus[0]);
                    ck.setMaxAge(1200*1000); //expires after 20 minutes*1000
                    response.addCookie(ck);
                    response.sendRedirect("pagPrincipal.jsp");
                }else{
                    errores(request,response);
                }
            }catch(FileNotFoundException e){
                errores(request,response);
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("index.jsp");
        }
       
    }

    private void errores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("errores", "Usuario o contraseña incorrectos");
        RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
        response.sendRedirect("index.jsp");    
    }
}