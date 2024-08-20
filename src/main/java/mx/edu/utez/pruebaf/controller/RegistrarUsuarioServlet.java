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

@WebServlet(name = "RegistrarUsuarioServlet", value = "/registrarUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Conseguir la info del formulario
        String nombreUs = req.getParameter("nombreUs");
        String apellidoUs = req.getParameter("apellidoUs");
        String correoInsti = req.getParameter("correoInsti");
        String PuestoUs = req.getParameter("PuestUs");
        String rfc = req.getParameter("rfc");
        boolean adminUs = Boolean.parseBoolean(req.getParameter("adminUs"));
        boolean estado = true;
        String contra1 = req.getParameter("contra1");


        User u = new User();
        u.setNombre(nombreUs);;
        u.setApellido(apellidoUs);
        u.setCorreo(correoInsti);
        u.setPuesto(PuestoUs);
        u.setRfc(rfc);
        u.setEsAdmin(adminUs);
        u.setEstatus(estado);
        u.setContra(contra1);


        UserDao dao = new UserDao();
        boolean operacionExitosa = dao.insert(u);
        System.out.println("correo usuario "+u.getCorreo());

        if (operacionExitosa) {
            resp.sendRedirect("gestionActivos.jsp");
        } else {

            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje","No se pudo registrar el usuario");
            resp.sendRedirect("registrarActivo.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
