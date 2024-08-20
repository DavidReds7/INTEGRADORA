package mx.edu.utez.pruebaf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.pruebaf.dao.UserDao;

import java.io.IOException;

@WebServlet(name="NuevaContraServelt",value="/nuevaClave")
public class NuevaContraServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String contra1 = req.getParameter("contra1");

        UserDao dao = new UserDao();
        boolean flag = dao.updateContra(contra1);

        HttpSession sesion = req.getSession();

        if(flag){
            System.out.println("Si se actualizó la contraseña");
            //Entonces no se encuentra registrado

            resp.sendRedirect("index.jsp");
            sesion.setAttribute("mensaje", "Se actualizó la contraseña correctamente");

        }else{

            sesion.setAttribute("mensaje", "No se ha actualizado la contraseña");
        }

    }
}
