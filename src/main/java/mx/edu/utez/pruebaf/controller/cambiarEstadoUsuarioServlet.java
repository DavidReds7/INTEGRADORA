package mx.edu.utez.pruebaf.controller;

import com.google.gson.Gson;
import mx.edu.utez.pruebaf.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "cambiarEstadoUsuarioServlet", value = "/cambiarEstadoUsuarioServlet")
public class cambiarEstadoUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> resultado = new HashMap<>();

        try {
            // Leer el cuerpo de la solicitud JSON
            Gson gson = new Gson();
            Map<String, Object> data = gson.fromJson(request.getReader(), Map.class);

            int id = ((Number) data.get("id")).intValue(); // Asegúrate de que el id sea un número
            String estatus = (String) data.get("estatus");

            // Determinar el nuevo estado (Activo/Inactivo)
            boolean nuevoEstado = estatus.equalsIgnoreCase("Activo");

            // Actualizar el estado del usuario
            UserDao dao = new UserDao();
            boolean success = dao.updateStatus(id, nuevoEstado);

            resultado.put("success", success);
        } catch (Exception e) {
            e.printStackTrace();
            resultado.put("success", false);
        }

        // Enviar la respuesta JSON
        out.print(new Gson().toJson(resultado));
        out.flush();
    }
}
