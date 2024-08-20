package mx.edu.utez.pruebaf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "CerrarSesionServlet", value = "/CerrarSesion")
public class CerrarSesionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Obtener la sesión actual, si existe
        if (session != null) {
            session.invalidate(); // Invalidar la sesión
        }
        response.sendRedirect("index.jsp"); // Redireccionar a index.jsp
    }
}