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


@WebServlet(name = "ActualizarActivoServelet", value = "/ActualizarActivo")
public class ActualizarActivoServelet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Porque estamos mandando un "?" es una request GET
        String codigo = (req.getParameter("codigo"));
        ActivoDao dao = new ActivoDao();
        Activo a = dao.getOne(codigo);
        HttpSession sesion = req.getSession();
        sesion.setAttribute("activo", a);
        resp.sendRedirect("ActualizarActivo.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");

        // Conseguir la info del formulario
        String codigoAct = req.getParameter("codigoAct");
        String nombreact = req.getParameter("nombreAct");
        String espeAct = req.getParameter("espeAct");
        String marcaAct = req.getParameter("marcaAct");
        String modAct = req.getParameter("modAct");
        String numAct = req.getParameter("numAct");
        String obsAct = req.getParameter("obsAct");
        String descripAct = req.getParameter("descripAct");
        String ubicacion = req.getParameter("combinacionId");

        String id = req.getParameter("id");  // Se usa en ambas operaciones

        // Crear el objeto Activo
        Activo a = new Activo();
        a.setCodigo(codigoAct);
        a.setNombre_activo(nombreact);
        a.setEspecificaciones(espeAct);
        a.setMarca(marcaAct);
        a.setModelo(modAct);
        a.setNum_serie(Integer.parseInt(numAct));
        a.setObservaciones(obsAct);
        a.setDescripcion(descripAct);
        a.setUbicaciones_id_ubicacion(Integer.parseInt(ubicacion));


        // Registrar o actualizar el usuario
        ActivoDao dao = new ActivoDao();
        boolean operacionExitosa = dao.update(a);

        // Mandar una respuesta
        if (operacionExitosa) {
            // Redirigir al usuario según la operación
            resp.sendRedirect("gestionActivos.jsp");
        } else {
            // Mandar un mensaje de error y regresar al formulario
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje","No se pudo actualizar el activo");
            resp.sendRedirect("registrarActivo.jsp");
        }
    }

}
