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

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        if (operacion.equals("registrar")) {
            // Conseguir la info del formulario
            String nombre = req.getParameter("nombre");
            String apellido = req.getParameter("apellido");
            String correo = req.getParameter("correo");
            String puesto = req.getParameter("puesto");
            boolean esAdmin = Boolean.parseBoolean(req.getParameter("esAdmin"));
            boolean estatus = Boolean.parseBoolean(req.getParameter("estatus"));
            String contra1 = req.getParameter("contra1");
            String contra2 = req.getParameter("contra2");

            if (!contra1.equals(contra2)) {
                resp.sendRedirect("registrarUsuario.jsp");
                return;
            }

            // Hacer un usuario
            User u = new User();
            u.setNombre(nombre);
            u.setApellido(apellido);
            u.setCorreo(correo);
            u.setPuesto(puesto);
            u.setEsAdmin(esAdmin);
            u.setEstatus(estatus);
            u.setContra(contra1);

            // Registrar al usuario
            UserDao dao = new UserDao();
            boolean insercion = dao.insert(u);

            // Mandar una respuesta
            if (insercion) {
                // Mandar al usuario al inicio de sesión
                resp.sendRedirect("index.jsp");
            } else {
                // Mandar un mensaje de error y regresar al formulario de registro
                HttpSession sesion = req.getSession();
                sesion.setAttribute("mensaje", "No se pudo registrar al usuario en la BD");
                resp.sendRedirect("index.jsp");
            }
        } else {
            // Actualización
            // Conseguir la info del formulario
            String nombre = req.getParameter("nombre");
            String apellido = req.getParameter("apellido");
            String correo = req.getParameter("correo");
            String puesto = req.getParameter("puesto");
            boolean esAdmin = Boolean.parseBoolean(req.getParameter("esAdmin"));
            boolean estatus = Boolean.parseBoolean(req.getParameter("estatus"));
            String contra = req.getParameter("contra");
            String id = req.getParameter("id");

            // Hacer un usuario
            User u = new User();
            u.setId(Integer.parseInt(id));
            u.setNombre(nombre);
            u.setApellido(apellido);
            u.setCorreo(correo);
            u.setPuesto(puesto);
            u.setEsAdmin(esAdmin);
            u.setEstatus(estatus);
            u.setContra(contra);

            // Actualizar al usuario
            UserDao dao = new UserDao();
            boolean actualizacion = dao.update(u);

            // Mandar una respuesta
            if (actualizacion) {
                // Mandar al usuario al inicio de sesión
                resp.sendRedirect("index.jsp");
            } else {
                // Mandar un mensaje de error y regresar al formulario de registro
                HttpSession sesion = req.getSession();
                sesion.setAttribute("mensaje", "No se pudo actualizar al usuario en la BD");
                resp.sendRedirect("index.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}