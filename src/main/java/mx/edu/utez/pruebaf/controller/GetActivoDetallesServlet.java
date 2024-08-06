package mx.edu.utez.pruebaf.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.pruebaf.model.Activo;
import mx.edu.utez.pruebaf.dao.ActivoDao;

import java.io.IOException;

@WebServlet("/getActivoDetalles")
public class GetActivoDetallesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el código del activo desde la solicitud
        String codigo = request.getParameter("codigo");

        if (codigo != null && !codigo.isEmpty()) {
            // Crear una instancia de ActivoDao y obtener los detalles del activo
            ActivoDao dao = new ActivoDao();
            Activo activo = dao.getOne(codigo);

            // Configurar la respuesta para el formato JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Convertir el objeto Activo a JSON
            Gson gson = new Gson();
            String json = gson.toJson(activo);

            // Enviar el JSON como respuesta
            response.getWriter().write(json);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Código de activo no proporcionado");
        }
    }
}
