package mx.edu.utez.pruebaf.dao;
import mx.edu.utez.pruebaf.model.Activo;
import mx.edu.utez.pruebaf.utils.DatabaseConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ActivoDao {

    //Traer solo uno con todos sus datos
    public Activo getOne(String codigo){
        Activo a = new Activo();
        String query = "select * from activos where codigo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, codigo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                a.setIdActivo(rs.getInt("idActivo"));
                a.setCodigo(rs.getString("codigo"));
                a.setNombre_activo(rs.getString("nombre_activo"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setEspecificaciones(rs.getString("especificaciones"));
                a.setMarca(rs.getString("marca"));
                a.setModelo(rs.getString("modelo"));
                a.setNum_serie(rs.getInt("num_serie"));
                a.setObservaciones(rs.getString("observaciones"));
                a.setUbicaciones_id_ubicacion(rs.getInt("ubicaciones_id_ubicacion"));
                a.setEdificio(rs.getString("edificio"));
                a.setHabitacion(rs.getString("habitacion"));
            }
            con.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return a;
    }

    //Insertar
    public boolean insert(Activo a){
        boolean respuesta = false;
        String query = "insert into activos(codigo, nombre_activo, descripcion, especificaciones, marca," +
                "modelo, num_serie, obsrvaciones, ubicaciones_id_ubicaciones) values(?,?,?,?,?,?,?,?,?)";
        try{
            //1)Conectarme a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            //2)Preparar la query
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, a.getCodigo());
            ps.setString(2,a.getNombre_activo());
            ps.setString(3,a.getDescripcion());
            ps.setString(4,a.getEspecificaciones());
            ps.setString(5,a.getMarca());
            ps.setString(6,a.getModelo());
            ps.setInt(7,a.getNum_serie());
            ps.setString(8,a.getObservaciones());
            ps.setInt(9,a.getUbicaciones_id_ubicacion());

            //3)Ejecutar el query
            if(ps.executeUpdate()>0){
                //Si se hizo la inserción
                respuesta = true;
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    //Traer todos en lista con todos sus datos
    public ArrayList<Activo> getAll(){
        ArrayList<Activo> lista = new ArrayList<>();
        String query = "SELECT a.*, u.edificio, u.habitacion FROM activos a JOIN ubicaciones u " +
                "ON a.ubicaciones_id_ubicacion = u.id_ubicacion";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Activo a = new Activo();
                /* columnLabel es como aparece en la base de datos "idUsuarios" */

                a.setCodigo(rs.getString("codigo"));
                a.setNombre_activo(rs.getString("nombre_activo"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setEspecificaciones(rs.getString("especificaciones"));
                a.setMarca(rs.getString("marca"));
                a.setModelo(rs.getString("modelo"));
                a.setNum_serie(rs.getInt("num_serie"));
                a.setObservaciones(rs.getString("observaciones"));
                a.setUbicaciones_id_ubicacion(rs.getInt("ubicaciones_id_ubicacion"));
                a.setEdificio(rs.getString("edificio"));
                a.setHabitacion(rs.getString("habitacion"));
                lista.add(a);
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return lista;
    }

    //Actualizar <-- aveces se apoya de otro metodo getOne
    public boolean update(Activo a){
        boolean flag = false;
        String query = "update activos set codigo=?, nombre_activo=?, descripcion=?, especificaciones=?," +
                "marca=?, modelo=?, num_serie=?, observaciones=?, ubicaciones_id_ubicacion=? where codigo=?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, a.getCodigo());
            ps.setString(2,a.getNombre_activo());
            ps.setString(3,a.getDescripcion());
            ps.setString(4,a.getEspecificaciones());
            ps.setString(5,a.getMarca());
            ps.setString(6,a.getModelo());
            ps.setInt(7,a.getNum_serie());
            ps.setString(8,a.getObservaciones());
            ps.setInt(9,a.getUbicaciones_id_ubicacion());

            if(ps.executeUpdate()>0){
                //Que si se hizo la modificación o modificaciones
                flag = true;
            }
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    /* No se si se ocupe mas adelante pero mejor comento el codigo de abajo */
    /*
    public User getOne(int id) {
        User u = new User();
        String query = "select * from users where id = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setNombre(rs.getString("nombre"));
                u.setContra(rs.getString("contra"));
                u.setCorreo(rs.getString("correo"));
                u.setId(rs.getInt("id"));
            }
            con.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return u;
    } */

    //Eliminar
    public boolean deleteFisico(String codigo) {
        boolean flag = false;
        String query = "delete from activo where codigo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, codigo);
            if(ps.executeUpdate()>0){
                flag = true;
            }
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

}