package mx.edu.utez.pruebaf.model;

public class User {
    private int id;
    private String nombre;
    private String apellido;
    private String correo;
    private String puesto;
    private boolean esAdmin;
    private String rfc;
    private String contra;
    private boolean estatus;  // Nuevo atributo para el estado del usuario

    public User(int id, String nombre, String apellido, String correo, String puesto, boolean esAdmin, String rfc, boolean estatus, String contra) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.puesto = puesto;
        this.esAdmin = esAdmin;
        this.rfc = rfc;
        this.contra = contra;
        this.estatus = estatus;  // Inicialización del nuevo atributo
    }

    public User() {
    }

    // Getters y Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public boolean isEsAdmin() {
        return esAdmin;
    }

    public void setEsAdmin(boolean esAdmin) {
        this.esAdmin = esAdmin;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public boolean isEstatus() {  // Getter para estatus
        return estatus;
    }

    public void setEstatus(boolean estatus) {  // Setter para estatus
        this.estatus = estatus;
    }
}




