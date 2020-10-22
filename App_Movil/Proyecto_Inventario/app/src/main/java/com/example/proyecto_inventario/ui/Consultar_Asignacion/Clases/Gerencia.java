package com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases;

public class Gerencia {

    private int id_gerencia;
    private String nombre;

    public Gerencia() {
    }

    public Gerencia(int id_gerencia, String nombre) {
        this.id_gerencia = id_gerencia;
        this.nombre = nombre;
    }

    public int getId_gerencia() {
        return id_gerencia;
    }

    public void setId_gerencia(int id_gerencia) {
        this.id_gerencia = id_gerencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
