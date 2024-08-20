package mx.edu.utez.pruebaf.dao;

import mx.edu.utez.pruebaf.model.HistorialActivo;
import mx.edu.utez.pruebaf.utils.DatabaseConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HistorialActivoDao {

    public ArrayList<HistorialActivo> getAll() {
        ArrayList<HistorialActivo> lista = new ArrayList<>();
        String query = "SELECT * FROM Historial_activos";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HistorialActivo a = new HistorialActivo();

                a.setId_cambio(rs.getInt("id_cambio"));
                a.setNombre_usuario(rs.getString("nombre_usuario"));
                a.setCorreo(rs.getString("correo"));
                a.setAccion(rs.getString("accion"));
                a.setCodigo_activo(rs.getString("codigo_activo"));
                a.setNombre_activo(rs.getString("nombre_activo"));
                a.setEdificio_activo(rs.getString("edificio_activo"));
                a.setHabitacion_activo(rs.getString("habitacion_activo"));
                a.setFecha(rs.getDate("fecha"));
                a.setHora(rs.getTime("hora"));
                lista.add(a);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}