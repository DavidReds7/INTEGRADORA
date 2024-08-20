package mx.edu.utez.pruebaf.model;

import java.sql.Date;
import java.sql.Time;

public class HistorialUsuario {
    private int id_cambio_usuarios;
    private int idUsuarios;
    private String nombre_usuario;
    private String correo;
    private String accion_us;
    private String idUsuarios2;
    private String nombre_usuario2;
    private String correo2;
    private Date fecha;
    private Time hora;



    public int getId_cambio_usuarios() {
        return id_cambio_usuarios;
    }

    public void setId_cambio_usuarios(int id_cambio_usuarios) {
        this.id_cambio_usuarios = id_cambio_usuarios;
    }



    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
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



    public String getAccion_us() {
        return accion_us;
    }

    public void setAccion_us(String accion_us) {
        this.accion_us = accion_us;
    }



    public String getIdUsuarios2() {
        return idUsuarios2;
    }

    public void setIdUsuarios2(String idUsuarios2) {
        this.idUsuarios2 = idUsuarios2;
    }



    public String getNombre_usuario2() {
        return nombre_usuario2;
    }

    public void setNombre_usuario2(String nombre_usuario2) {
        this.nombre_usuario2 = nombre_usuario2;
    }



    public String getCorreo2() {
        return correo2;
    }

    public void setCorreo2(String correo2) {
        this.correo2 = correo2;
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
