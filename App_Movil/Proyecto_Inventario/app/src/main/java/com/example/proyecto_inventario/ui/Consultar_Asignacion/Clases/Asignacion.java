package com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases;

public class Asignacion {

    private int id_asignacion;
    private int id_usuario;
    private int id_inventario;
    private int id_bienes;
    private String bien;
    private String codigo;
    private int id_personal;
    private String personal;
    private int id_gerencia;
    private String gerencia;
    private int id_area;
    private String area;

    public Asignacion() {
    }

    public int getId_asignacion() {
        return id_asignacion;
    }

    public void setId_asignacion(int id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public int getId_bienes() {
        return id_bienes;
    }

    public void setId_bienes(int id_bienes) {
        this.id_bienes = id_bienes;
    }

    public String getBien() {
        return bien;
    }

    public void setBien(String bien) {
        this.bien = bien;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId_personal() {
        return id_personal;
    }

    public void setId_personal(int id_personal) {
        this.id_personal = id_personal;
    }

    public String getPersonal() {
        return personal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public int getId_gerencia() {
        return id_gerencia;
    }

    public void setId_gerencia(int id_gerencia) {
        this.id_gerencia = id_gerencia;
    }

    public String getGerencia() {
        return gerencia;
    }

    public void setGerencia(String gerencia) {
        this.gerencia = gerencia;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
