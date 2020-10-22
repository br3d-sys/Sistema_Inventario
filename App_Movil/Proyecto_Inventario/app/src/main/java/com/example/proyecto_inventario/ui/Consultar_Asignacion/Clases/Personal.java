package com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases;

public class Personal {

    private int id_personal;
    private String nombre;

    public Personal() {
    }

    public Personal(int id_personal, String nombre) {
        this.id_personal = id_personal;
        this.nombre = nombre;
    }

    public int getId_personal() {
        return id_personal;
    }

    public void setId_personal(int id_personal) {
        this.id_personal = id_personal;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
