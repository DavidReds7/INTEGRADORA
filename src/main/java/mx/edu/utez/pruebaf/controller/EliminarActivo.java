package mx.edu.utez.pruebaf.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.pruebaf.dao.ActivoDao;
import java.io.IOException;

@WebServlet(name = "EliminarActivo", value = "/deleteActivo")
public class EliminarActivo extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String codigo = (req.getParameter("codigo"));
        ActivoDao dao = new ActivoDao();
        if(dao.delete(codigo)){
            resp.sendRedirect("gestionActivos.jsp");
        }else{
            req.getSession().setAttribute("mensaje","No se pudo borrar el activo");
            resp.sendRedirect("gestionActivos.jsp");
        }
    }
}
