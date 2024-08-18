package mx.edu.utez.pruebaf.model;

import java.sql.Date;
import java.sql.Time;

public class Historial {
    private int idCambio;
    private int activosCodigo;
    private int usuariosIdUsuarios;
    private String accion;
    private Date fecha;
    private Time hora;
    private int ubicacionesIdUbicacion;

    // Getters and Setters

    public int getIdCambio() {
        return idCambio;
    }

    public void setIdCambio(int idCambio) {
        this.idCambio = idCambio;
    }

    public int getActivosCodigo() {
        return activosCodigo;
    }

    public void setActivosCodigo(int activosCodigo) {
        this.activosCodigo = activosCodigo;
    }

    public int getUsuariosIdUsuarios() {
        return usuariosIdUsuarios;
    }

    public void setUsuariosIdUsuarios(int usuariosIdUsuarios) {
        this.usuariosIdUsuarios = usuariosIdUsuarios;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
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

    public int getUbicacionesIdUbicacion() {
        return ubicacionesIdUbicacion;
    }

    public void setUbicacionesIdUbicacion(int ubicacionesIdUbicacion) {
        this.ubicacionesIdUbicacion = ubicacionesIdUbicacion;
    }
}
