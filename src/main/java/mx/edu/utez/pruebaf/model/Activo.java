package mx.edu.utez.pruebaf.model;

public class Activo {
    private int idActivo;
    private String codigo;
    private String nombre_activo;
    private String descripcion;
    private String especificaciones;
    private String marca;
    private String modelo;
    private int num_serie;
    private String observaciones;
    private int ubicaciones_id_ubicacion;
    private String edificio;
    private String habitacion;


    //Constructor vacio
    public Activo(){}

    public Activo(int idActivo, String codigo, String nombre_activo, String descripcion, String especificaciones,
                  String marca, String modelo, int num_serie, String observaciones, int ubicaciones_id_ubicacion,
                  String edificio, String habitacion){

        this.idActivo = idActivo;
        this.codigo = codigo;
        this.nombre_activo = nombre_activo;
        this.descripcion = descripcion;
        this.especificaciones = especificaciones;
        this.marca = marca;
        this.modelo = modelo;
        this.num_serie = num_serie;
        this.observaciones = observaciones;
        this.ubicaciones_id_ubicacion = ubicaciones_id_ubicacion;
        this.edificio = edificio;
        this.habitacion = habitacion;
    }

    public int getIdActivo() {
        return idActivo;
    }

    public void setIdActivo(int idActivo) {
        this.idActivo = idActivo;
    }


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }


    public int getNum_serie() {
        return num_serie;
    }

    public void setNum_serie(int num_serie) {
        this.num_serie = num_serie;
    }


    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }


    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }


    public String getEspecificaciones() {
        return especificaciones;
    }

    public void setEspecificaciones(String especificaciones) {
        this.especificaciones = especificaciones;
    }


    public String getNombre_activo() {
        return nombre_activo;
    }

    public void setNombre_activo(String nombre_activo) {
        this.nombre_activo = nombre_activo;
    }


    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }


    public int getUbicaciones_id_ubicacion() {
        return ubicaciones_id_ubicacion;
    }

    public void setUbicaciones_id_ubicacion(int ubicaciones_id_ubicacion) {
        this.ubicaciones_id_ubicacion = ubicaciones_id_ubicacion;
    }


    public String getEdificio() {
        return edificio;
    }

    public void setEdificio(String edificio) {
        this.edificio = edificio;
    }



    public String getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(String habitacion) {
        this.habitacion = habitacion;
    }
}