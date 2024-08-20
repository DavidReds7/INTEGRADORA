package mx.edu.utez.pruebaf.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.pruebaf.dao.UserDao;
import mx.edu.utez.pruebaf.model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ActualizarUsuarioServlet", value = "/ActualizarUsuarioServlet")
public class ActualizarUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        UserDao dao = new UserDao();
        User usuario = dao.getOne(id);

        // Responder con los datos del usuario en formato JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(new Gson().toJson(usuario));  // Usa Gson para convertir el objeto en JSON
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String correo = req.getParameter("correo");
        String puesto = req.getParameter("puesto");
        boolean esAdmin = Boolean.parseBoolean(req.getParameter("esAdmin"));
        String rfc = req.getParameter("rfc");
        boolean estatus = Boolean.parseBoolean(req.getParameter("estatus"));
        String contra = req.getParameter("contra");

        String codigo = req.getParameter("codigo");
        User u = new User(id, nombre, apellido, correo, puesto, esAdmin, rfc, estatus, contra, codigo);

        UserDao dao = new UserDao();
        boolean actualizacion = dao.update(u);

        if (actualizacion) {
            resp.sendRedirect("gestionUsuario.jsp");
        } else {
            req.setAttribute("mensaje", "No se pudo actualizar al usuario.");
            req.getRequestDispatcher("gestionUsuario.jsp").forward(req, resp);
        }
    }
}

