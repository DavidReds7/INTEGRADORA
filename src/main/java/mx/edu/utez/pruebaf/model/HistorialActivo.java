package mx.edu.utez.pruebaf.model;

import java.sql.Date;
import java.sql.Time;

public class HistorialActivo {
    private int id_cambio;
    private String nombre_usuario;
    private String correo;
    private String accion;
    private String codigo_activo;
    private String nombre_activo;
    private String edificio_activo;
    private String habitacion_activo;
    private Date fecha;
    private Time hora;

    //Constructor vacio
    public HistorialActivo (){}

    public HistorialActivo(int id_cambio, String nombre_usuario, String correo, String accion,
                           String codigo_activo, String nombre_activo, String edificio_activo, String habitacion_activo,
                           Date fecha, Time hora){

        this.id_cambio = id_cambio;
        this.nombre_usuario = nombre_usuario;
        this.correo = correo;
        this.accion = accion;
        this.codigo_activo = codigo_activo;
        this.nombre_activo = nombre_activo;
        this.edificio_activo = edificio_activo;
        this.habitacion_activo = habitacion_activo;
        this.fecha = fecha;
        this.hora = hora;
    }

    // Getters and Setters
    public int getId_cambio() {
        return id_cambio;
    }

    public void setId_cambio(int id_cambio) {
        this.id_cambio = id_cambio;
    }



    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }



    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }



    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }



    public String getCodigo_activo() {
        return codigo_activo;
    }

    public void setCodigo_activo(String codigo_activo) {
        this.codigo_activo = codigo_activo;
    }



    public String getNombre_activo() {
        return nombre_activo;
    }

    public void setNombre_activo(String nombre_activo) {
        this.nombre_activo = nombre_activo;
    }



    public String getEdificio_activo() {
        return edificio_activo;
    }

    public void setEdificio_activo(String edificio_activo) {
        this.edificio_activo = edificio_activo;
    }



    public String getHabitacion_activo() {
        return habitacion_activo;
    }

    public void setHabitacion_activo(String habitacion_activo) {
        this.habitacion_activo = habitacion_activo;
    }



    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }



    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }
}
