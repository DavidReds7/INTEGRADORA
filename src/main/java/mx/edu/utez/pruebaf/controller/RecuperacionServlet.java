package mx.edu.utez.pruebaf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.pruebaf.SimpleRandomStringGenerator;
import mx.edu.utez.pruebaf.dao.UserDao;
import mx.edu.utez.pruebaf.model.User;
import mx.edu.utez.pruebaf.utils.GmailSender;

import java.io.IOException;

@WebServlet(name="RecuperacionServlet",value="/recuContra")
public class RecuperacionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String correo = req.getParameter("correo");

        UserDao dao = new UserDao();
        User usuario = dao.getOne(correo);


        //Imprimir el nombre del usuario en la base de datos
        //Si no existe el usuario entonces imprime null
        System.out.println("Correo para recuperar: " + usuario.getCorreo());
        String correo2 = usuario.getCorreo();
        String ruta = "recuperarContra.jsp";
        HttpSession sesion = req.getSession();
        if(usuario.getCorreo() == null){

            //Entonces no se encuentra registrado
            sesion.setAttribute("mensaje", "El correo electrónico no existe en la base de datos");

        }else{

            //Entonces si se encuentra
            String codigoGenerado = SimpleRandomStringGenerator.generateRandomString(256);
            boolean insertarCodigo = dao.insertCodigo(codigoGenerado, correo2);

            if(insertarCodigo){
                try {
                    GmailSender mLink = new GmailSender();
                    String linkRecu = "</h1>Para cambiar su contraseña acceda al siguiente link: </h1><br><br>" +
                            "</h1><a href=http://localhost:8080/scad_war_exploded/nuevaContra.jsp?codigoGenerado="+codigoGenerado+">Crear nueva contraseña</a></h1>";
                    mLink.sendMail(correo,"Link de recuperación", linkRecu);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                System.out.println("El código se insertó corretamente");
            }else {
                System.out.println("El código no se insertó corretamente");
            }
            sesion.setAttribute("mensaje", "Se ha enviado un código de recuperación a su correo");
        }
        resp.sendRedirect(ruta);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Porque estamos mandando un "?" es una request GET

        String codigoGenerado = req.getParameter("codigoGenerado");

        UserDao dao = new UserDao();
        boolean flag = dao.coincideCodigo(codigoGenerado);

        if(flag){
            resp.sendRedirect("nuevaContra.jsp");
        }else {
            System.out.println("Ocurrió un error");
        }

    }

    public void destroy() {

    }

    public void init() throws ServletException {

    }
}
