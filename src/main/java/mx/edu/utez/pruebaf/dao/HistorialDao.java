package mx.edu.utez.pruebaf.dao;

import mx.edu.utez.pruebaf.model.Historial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistorialDao {

    private Connection getConnection() throws Exception {
        // Cambia la URL, usuario y contraseña según tu configuración
        String url = "jdbc:mysql://127.0.0.1:3306/SCAD_DATABASE_PRUEBAS";
        String user = "root";
        String password = "123456789";
        return DriverManager.getConnection(url, user, password);
    }

    public ArrayList<Historial> getAll() {
        ArrayList<Historial> lista = new ArrayList<>();
        String query = "SELECT * FROM Historial";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Historial historial = new Historial();
                historial.setIdCambio(rs.getInt("id_cambio"));
                historial.setActivosCodigo(rs.getInt("activos_idActivo")); // Asegúrate de que el tipo sea correcto
                historial.setUsuariosIdUsuarios(rs.getInt("usuarios_idUsuarios"));
                historial.setAccion(rs.getString("accion"));
                historial.setFecha(rs.getDate("fecha"));
                historial.setHora(rs.getTime("hora"));
                historial.setUbicacionesIdUbicacion(rs.getInt("ubicaciones_id_ubicacion"));
                lista.add(historial);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
