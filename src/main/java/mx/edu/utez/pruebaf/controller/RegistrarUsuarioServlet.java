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

@WebServlet(name = "RegistrarUsuarioServlet", value = "/sign_in")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");

        // Conseguir la info del formulario
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String correo = req.getParameter("correo");
        String puesto = req.getParameter("puesto");
        boolean esAdmin = Boolean.parseBoolean(req.getParameter("esAdmin"));
        String rfc = req.getParameter("rfc");
        boolean estatus = Boolean.parseBoolean(req.getParameter("estatus"));
        String contra1 = req.getParameter("contra1");
        String contra2 = req.getParameter("contra2");
        String id = req.getParameter("id");  // Se usa en ambas operaciones

        // Verificar que las contraseñas coincidan para el registro
        if (operacion.equals("registrar")) {
            if (!contra1.equals(contra2)) {
                resp.sendRedirect("registrarUsuario.jsp");
                return;
            }
        }

        // Crear el objeto User
        User u = new User();
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setCorreo(correo);
        u.setPuesto(puesto);
        u.setEsAdmin(esAdmin);
        u.setRfc(rfc);
        u.setEstatus(estatus);
        u.setContra(contra1); // Usar contra1 en registro y contra en actualización

        // Establecer el ID solo si la operación es actualización
        if (operacion.equals("actualizar")) {
            u.setId(Integer.parseInt(id));
        }

        // Registrar o actualizar el usuario
        UserDao dao = new UserDao();
        boolean operacionExitosa;
        if (operacion.equals("registrar")) {
            operacionExitosa = dao.insert(u);
        } else {
            operacionExitosa = dao.update(u);
        }

        // Mandar una respuesta
        if (operacionExitosa) {
            // Redirigir al usuario según la operación
            resp.sendRedirect("gestionUsuario.jsp");
        } else {
            // Mandar un mensaje de error y regresar al formulario
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje", operacion.equals("registrar") ?
                    "No se pudo registrar al usuario en la BD" :
                    "No se pudo actualizar al usuario en la BD");
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
