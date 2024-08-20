package mx.edu.utez.pruebaf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.pruebaf.dao.UserDao;
import mx.edu.utez.pruebaf.model.User;
import java.io.IOException;

//el parametro de value es la ruta para llegar a este servlet
//Debe de comenzar con una / y la ruta que tu quieras
//Nota no le vayan a poner espacios
@WebServlet(name="UserServlet", value="/login")
public class UserServlet extends HttpServlet{


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Porque estamos mandando un "?" es una request GET
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao dao = new UserDao();
        User usuario = dao.getOne(id);
        HttpSession sesion = req.getSession();
        sesion.setAttribute("usuario", usuario);
        resp.sendRedirect("registrarUsuario.jsp");
    }

    //Normalmente siempre ocupen el método doPost
    //Para información de formularios
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // el objeto req contiene toda la información que proviene del jsp

        String correoU = req.getParameter("correoU");
        String contra = req.getParameter("contra");

        //En este punto solo tengo los valores de los inputs
        // Me hace falta llamar a un archivo para ver si existe
        // o no el usuario en la base de datos
        UserDao dao = new UserDao();
        User usuario = dao.getOne(correoU, contra);

        //Imprimir el nombre del usuario en la base de datos
        //Si no existe el usuario entonces imprime null
        System.out.println("Si el usuario existe imprime el correo y si no; imprime (null):\n"+usuario.getCorreo());
        String ruta = "index.jsp";
        HttpSession sesion = req.getSession();
        if(usuario.getCorreo() == null) {
            //Entonces no voy a poder iniciar sesión
            sesion.setAttribute("mensaje", "El usuario no existe");

        }else if (!usuario.isEstatus()) {
            sesion.setAttribute("mensaje", "El usuario está inactivo");

        }else{
            //Entonces si inicie la sesión
            ruta = "menuPrincipal.jsp";
            sesion.removeAttribute("mensaje");
            sesion.setAttribute("usuario", usuario);
        }
        resp.sendRedirect(ruta);
    }

    public void destroy() {
    }

    public void init() throws ServletException {
    }
}
