package mx.edu.utez.pruebaf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.pruebaf.dao.ActivoDao;
import mx.edu.utez.pruebaf.model.Activo;

import java.io.IOException;

@WebServlet(name = "RegistrarActivo", value = "/registrarActivo")
public class RegistrarActivo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");

        // Conseguir la info del formulario
        String codigoAct = req.getParameter("codigoAct");
        String nombreact = req.getParameter("nombreAct");
        String descripAct = req.getParameter("descripAct");
        String espeAct = req.getParameter("espeAct");
        String marcaAct = req.getParameter("marcaAct");
        String modAct = req.getParameter("modAct");
        String numAct = req.getParameter("numAct");
        String obsAct = req.getParameter("obsAct");

        String id = req.getParameter("id");  // Se usa en ambas operaciones



        // Crear el objeto User
        Activo a = new Activo();
        a.setCodigo(codigoAct);
        a.setNombre_activo(nombreact);
        a.setDescripcion(descripAct);
        a.setEspecificaciones(espeAct);
        a.setMarca(marcaAct);
        a.setModelo(modAct);
        a.setNum_serie(Integer.parseInt(numAct));
        a.setObservaciones(obsAct);



        // Registrar o actualizar el usuario
        ActivoDao dao = new ActivoDao();
        boolean operacionExitosa = dao.insert(a);

        // Mandar una respuesta
        if (operacionExitosa) {
            // Redirigir al usuario según la operación
            resp.sendRedirect("gestionActivos.jsp");
        } else {
            // Mandar un mensaje de error y regresar al formulario
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje", operacion.equals("registrar") ?
                    "No se pudo registrar el activo en la BD" :
                    "No se pudo actualizar el activo en la BD");
            resp.sendRedirect("gestionActivos.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
