package com.example.proyecto_inventario.ui.Consultar_Asignacion;

public class Modelo_Items {

    private String m_codigo;
    private String m_nombre;
    private String m_color;
    private int m_idImagen;

    public Modelo_Items(int m_idImagen, String m_codigo, String m_nombre, String m_color) {
        this.m_idImagen = m_idImagen;
        this.m_codigo = m_codigo;
        this.m_nombre = m_nombre;
        this.m_color = m_color;
    }



    public int getM_idImagen() {
        return m_idImagen;
    }

    public void setM_idImagen(int m_idImagen) {
        this.m_idImagen = m_idImagen;
    }

    public String getM_codigo() {
        return m_codigo;
    }

    public void setM_codigo(String m_codigo) {
        this.m_codigo = m_codigo;
    }

    public String getM_nombre() {
        return m_nombre;
    }

    public void setM_nombre(String m_nombre) {
        this.m_nombre = m_nombre;
    }

    public String getM_color() {
        return m_color;
    }

    public void setM_color(String m_color) {
        this.m_color = m_color;
    }





}
