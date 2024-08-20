package mx.edu.utez.pruebaf.dao;

import mx.edu.utez.pruebaf.model.HistorialActivo;
import mx.edu.utez.pruebaf.model.HistorialUsuario;
import mx.edu.utez.pruebaf.utils.DatabaseConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HistorialUsuarioDao {

    public ArrayList<HistorialUsuario> getAll() {
        ArrayList<HistorialUsuario> lista = new ArrayList<>();
        String query = "SELECT * FROM Historial_Usuarios";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HistorialUsuario a = new HistorialUsuario();

                a.setIdUsuarios(rs.getInt("idUsuarios"));
                a.setNombre_usuario(rs.getString("nombre_usuario"));
                a.setCorreo(rs.getString("correo"));
                a.setAccion_us(rs.getString("accion_us"));


                lista.add(a);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}