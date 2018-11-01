import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/javitaReg")
public class JavitaReg extends HttpServlet{
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        // read form fields
        String username = request.getParameter("usuario");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        
        if(!username.isEmpty() && !password.isEmpty()){
            if(username.length()>30||password.length()>30){
                request.setAttribute("badName", "Usuario y contraseña deben tener un máximo de 30 caracteres");
                RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/registro.jsp");
                rd.forward(request, response);
                response.sendRedirect("registro.jsp");
            }else if(username.contains(" ")){
                request.setAttribute("badName", "No pueden incluirse espacios en el nombre de usuario");
                RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/registro.jsp");
                rd.forward(request, response);
                response.sendRedirect("registro.jsp");
            }else if(!password.equals(password2)){
                request.setAttribute("badName", "Las contraseñas no coinciden");
                RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/registro.jsp");
                rd.forward(request, response);
                response.sendRedirect("registro.jsp");
            }
            //System.out.println("username: " + username);
            //System.out.println("password: " + password);
            
            // do some processing here...
            try{
                File file=new File("usuYcontra.txt");
                //System.out.println(file.getCanonicalPath());
                //C:\Users\Asus\AppData\Roaming\NetBeans\8.2\config\GF_4.1.1\domain1\config\\usuAYcontra.txt
                file.createNewFile();
                BufferedReader br= new BufferedReader(new FileReader(file));
                String linea;
                String[] usus;
                while((linea=br.readLine())!=null){
                    usus=linea.split(",");
                    if(username.equals(usus[0]))break;
                }
                if(linea==null){
                    FileWriter fichero = new FileWriter(file,true);
                    PrintWriter pw = new PrintWriter(fichero);
                    pw.println(username+","+password);
                    pw.close();
                    fichero.close();
                    request.setAttribute("ok", "Usuario registrado correctamente");
                    RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                    response.sendRedirect("index.jsp");
                }else{
                    request.setAttribute("badName", "Nombre de usuario ya existente");
                    RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/registro.jsp");
                    rd.forward(request, response);
                    response.sendRedirect("registro.jsp");
                }
            }catch(Exception e){
                e.printStackTrace();
            }
//            // get response writer
//            PrintWriter writer = response.getWriter();
//
//            // build HTML code
//            String htmlRespone = "<html>";
//            htmlRespone += "<h2>Your username is: " + username + "<br/>";      
//            htmlRespone += "Your password is: " + password + "</h2>";    
//            htmlRespone += "</html>";
//
//            // return response
//            writer.println(htmlRespone);
        }else{
            response.sendRedirect("registro.jsp");
        }
       
    }
}