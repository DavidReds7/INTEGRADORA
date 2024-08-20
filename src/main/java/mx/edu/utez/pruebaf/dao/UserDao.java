package mx.edu.utez.pruebaf.dao;

import mx.edu.utez.pruebaf.model.User;
import mx.edu.utez.pruebaf.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {

    public User getOne(String correoU, String contra) {
        User u = new User();
        String query = "SELECT * FROM usuarios WHERE correo = ? AND password = SHA2(?, 256)";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, correoU);
            ps.setString(2, contra);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u.setCorreo(rs.getString("correo"));
                    u.setContra(rs.getString("password"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setPuesto(rs.getString("puesto"));
                    u.setEsAdmin(rs.getBoolean("admin"));
                    u.setRfc(rs.getString("rfc"));
                    u.setEstatus(rs.getBoolean("estado"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean insert(User u) {
        boolean respuesta = false;
        String query = "INSERT INTO usuarios(nombre, apellido, correo, password, puesto, admin, rfc, estado) VALUES(?, ?, ?, SHA2(?, 256), ?, ?, ?, ?)";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getContra());
            ps.setString(5, u.getPuesto());
            ps.setBoolean(6, u.isEsAdmin());
            ps.setString(7, u.getRfc());
            ps.setBoolean(8, u.isEstatus());
            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public ArrayList<User> getAll() {
        ArrayList<User> lista = new ArrayList<>();
        String query = "SELECT * FROM usuarios";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("idUsuarios"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setPuesto(rs.getString("puesto"));
                u.setEsAdmin(rs.getBoolean("admin"));
                u.setRfc(rs.getString("rfc"));
                u.setEstatus(rs.getBoolean("estado"));
                u.setContra(rs.getString("password"));
                lista.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean update(User u) {
        boolean flag = false;
        String query = "UPDATE usuarios SET nombre=?, apellido=?, correo=?, password=SHA2(?, 256), puesto=?, admin=?, rfc=? WHERE idUsuarios=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getContra());
            ps.setString(5, u.getPuesto());
            ps.setBoolean(6, u.isEsAdmin());
            ps.setString(7, u.getRfc());
            ps.setInt(8, u.getId());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public User getOne(int id) {
        User u = new User();
        String query = "SELECT * FROM usuarios WHERE idUsuarios = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setCorreo(rs.getString("correo"));
                    u.setPuesto(rs.getString("puesto"));
                    u.setEsAdmin(rs.getBoolean("admin"));
                    u.setRfc(rs.getString("rfc"));
                    u.setEstatus(rs.getBoolean("estado"));
                    u.setContra(rs.getString("password"));
                    u.setId(rs.getInt("idUsuarios"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    // Recuperacion de contraseña ######################################################################################
    public User getOne(String correo) {
        User u = new User();
        String query = "SELECT * FROM usuarios WHERE correo = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u.setCorreo(rs.getString("correo"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean insertCodigo(String codigoGenerado, String correo2) {
        boolean flag = false;
        String query = "UPDATE Usuarios SET codigo = ? WHERE correo = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, codigoGenerado);
            ps.setString(2, correo2);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean coincideCodigo(String codigoGenerado) {
        boolean flag = false;
        String query = "SELECT * FROM usuarios WHERE codigo = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, codigoGenerado);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("Si existe el codigo");
                    flag = true;
                } else {
                    System.out.println("No existe el codigo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updateContra(String contra1) {
        boolean flag = false;
        String query = "UPDATE Usuarios SET password = SHA2(?, 256) WHERE codigo IS NOT NULL";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            System.out.println("Ya llego al update");
            ps.setString(1, contra1);
            if (ps.executeUpdate() > 0) {
                flag = true;
                System.out.println("si se hizo update");
            } else {
                System.out.println("no se hizo update");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    // #################################################################################################################

    public boolean deleteFisico(int id) {
        boolean flag = false;
        String query = "DELETE FROM usuarios WHERE idUsuarios = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean deleteLogico(int id) {
        boolean flag = false;
        String query = "UPDATE usuarios SET estado = false WHERE idUsuarios = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updateStatus(int id, boolean nuevoEstado) {
        boolean flag = false;
        String query = "UPDATE usuarios SET estado=? WHERE idUsuarios=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setBoolean(1, nuevoEstado);
            ps.setInt(2, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
