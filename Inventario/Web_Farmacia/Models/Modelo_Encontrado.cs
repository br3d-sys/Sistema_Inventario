﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Encontrado
    {

        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Encontrado()
        {

        }
        public Boolean guardar(Encontrado enc)
        {
            //try
            //{
            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_C_Tabla_Encontrado";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_bienes", enc.Id_bienes);
                    cmd.Parameters.AddWithValue("_id_inventario", enc.Id_inventario);
                    cmd.Parameters.AddWithValue("_fecha", enc.Fecha);
                    cmd.Parameters.AddWithValue("_estado", enc.Estado);
                    cmd.Parameters.AddWithValue("_imagen", enc.Imagen_byte);
                    cmd.Parameters.AddWithValue("_detalle_estado", enc.Detalle_estado);
                    cmd.Parameters.AddWithValue("_t_documento", enc.T_documento);
                    cmd.Parameters.AddWithValue("_n_documento", enc.N_documento);
                    cmd.Parameters.AddWithValue("_archivo", enc.Archivo);

                    //using(MemoryStream ms = new MemoryStream())
                    //{
                    //    enc.Imagen.Save(ms, ImageFormat.Jpeg);
                    //    byte[] img_byte = ms.ToArray();
                    //    cmd.Parameters.AddWithValue("_imagen", img_byte);

                    //}

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            //}
            //catch (Exception ex)
            //{
            //    return false;
            //}
        }

        public List<Encontrado> listar()
        {
            //try
            //{
            MySqlDataReader rd;
            List<Encontrado> lista = new List<Encontrado>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_R_Tabla_Encontrado";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Encontrado
                        {

                            Id_encontrado = rd.GetInt32("id_encontrado"),
                            Id_inventario = rd.GetInt32("id_inventario"),
                            Inventario = rd.GetString("inventario"),
                            Id_bienes = rd.GetInt32("id_bienes"),
                            Bien = rd.GetString("bien"),
                            Codigo = rd.GetString("codigo"),
                            Id_categoria = rd.GetInt32("id_categoria"),
                            Categoria = rd.GetString("categoria"),
                            Fecha = rd.GetDateTime("fecha"),
                            Estado = rd.GetString("estado"),
                            Detalle_estado = rd.IsDBNull(11)?"":rd.GetString("detalle_estado"),
                            T_documento = rd.IsDBNull(12) ? "" : rd.GetString("t_documento"),
                            N_documento = rd.IsDBNull(13) ? "" : rd.GetString("n_documento"),
                            Archivo = rd.IsDBNull(14) ? null : rd.GetString("archivo")

                        });
                    }

                    rd.Close();

                }
            }

            return lista;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}
        }

        public Boolean actualizar(Encontrado enc)
        {
            //try
            //{
            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {

                    cmd.CommandText = "SP_U_Tabla_Encontrado";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_encontrado", enc.Id_encontrado);
                    cmd.Parameters.AddWithValue("_id_bienes", enc.Id_bienes);
                    cmd.Parameters.AddWithValue("_id_inventario", enc.Id_inventario);
                    cmd.Parameters.AddWithValue("_fecha", enc.Fecha);
                    cmd.Parameters.AddWithValue("_estado", enc.Estado);
                    cmd.Parameters.AddWithValue("_imagen", enc.Imagen_byte);
                    cmd.Parameters.AddWithValue("_detalle_estado", enc.Detalle_estado);
                    cmd.Parameters.AddWithValue("_t_documento", enc.T_documento);
                    cmd.Parameters.AddWithValue("_n_documento", enc.N_documento);
                    cmd.Parameters.AddWithValue("_archivo", enc.Archivo);
                    //using (MemoryStream ms = new MemoryStream())
                    //{
                    //    enc.Imagen.Save(ms, ImageFormat.Jpeg);
                    //    byte[] img_byte = ms.ToArray();
                    //    cmd.Parameters.AddWithValue("_imagen", img_byte);

                    //}

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }

            }
            //}
            //catch (Exception)
            //{

            //    return false;
            //}

        }
        public Boolean eliminar(int id)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_D_Tabla_Encontrado";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_encontrado", id);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Encontrado obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Encontrado enc = new Encontrado();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Encontrado";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_encontrado", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {

                        byte[] arr_byte =(byte[]) rd.GetValue(10);
                        enc.Imagen_byte = arr_byte;

                        enc.Id_encontrado = rd.GetInt32("id_encontrado");
                        enc.Id_inventario = rd.GetInt32("id_inventario");
                        enc.Inventario = rd.GetString("inventario");
                        enc.Id_bienes = rd.GetInt32("id_bienes");
                        enc.Bien = rd.GetString("bien");
                        enc.Codigo = rd.GetString("codigo");
                        enc.Id_categoria = rd.GetInt32("id_categoria");
                        enc.Categoria = rd.GetString("categoria");
                        enc.Fecha = rd.GetDateTime("fecha");
                        enc.Estado = rd.GetString("estado");
                        enc.Detalle_estado = rd.IsDBNull(11) ? "" : rd.GetString("detalle_estado");
                        enc.T_documento = rd.IsDBNull(12) ? "" : rd.GetString("t_documento");
                        enc.N_documento = rd.IsDBNull(13) ? "" : rd.GetString("n_documento");
                        enc.Archivo = rd.IsDBNull(14) ? null : rd.GetString("archivo");
                        enc.Marca = rd.GetString("marca");
                        enc.Modelo = rd.GetString("modelo");
                        enc.Color = rd.GetString("color");
                        enc.Serie = rd.GetString("serie");
                    }

                    rd.Close();

                }
            }

            return enc;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        //public List<Encontrado> buscar(string nombre, int id_gerencia, int id_area)
        //{
        //    //try
        //    //{
        //    MySqlDataReader rd;
        //    List<Personal> lista = new List<Personal>();

        //    using (con = Conexion.conectar())
        //    {
        //        using (cmd = new MySqlCommand())
        //        {
        //            cmd.CommandText = "SP_B_Tabla_Personal";
        //            cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //            cmd.Connection = con;

        //            cmd.Parameters.AddWithValue("_nombre", nombre);
        //            cmd.Parameters.AddWithValue("_id_gerencia", id_gerencia);
        //            cmd.Parameters.AddWithValue("_id_area", id_area);

        //            rd = cmd.ExecuteReader();

        //            while (rd.Read())
        //            {
        //                lista.Add(new Personal
        //                {

        //                    Id_personal = rd.GetInt32("id_personal"),
        //                    Id_area = rd.GetInt32("id_area"),
        //                    Area = rd.GetString("area"),
        //                    Id_gerencia = rd.GetInt32("id_gerencia"),
        //                    Gerencia = rd.GetString("gerencia"),
        //                    Nombre = rd.GetString("nombre"),
        //                    Cargo = rd.GetString("cargo"),
        //                    T_documento = rd.GetString("t_documento"),
        //                    N_documento = rd.GetString("n_documento"),
        //                    Edad = rd.GetInt16("edad"),
        //                    Sexo = rd.GetString("sexo"),
        //                    Est_civil = rd.GetString("est_civil"),
        //                    Celular = rd.GetString("celular"),
        //                    Direccion = rd.GetString("direccion"),
        //                    Correo = rd.GetString("correo")

        //                });
        //            }

        //            rd.Close();

        //        }
        //    }

        //    return lista;
        //    //}
        //    //catch (Exception)
        //    //{
        //    //    return null;
        //    //}
        //}


        public List<Encontrado> buscar_rest(string id_gerencia, string id_area, string id_personal, string codigo)
        {
            //try
            //{
            MySqlDataReader rd;
            List<Encontrado> lista = new List<Encontrado>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_R_Consultar_Encontrado";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_gerencia", id_gerencia);
                    cmd.Parameters.AddWithValue("_id_area", id_area);
                    cmd.Parameters.AddWithValue("_id_personal", id_personal);
                    cmd.Parameters.AddWithValue("_codigo", codigo);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Encontrado
                        {
                            
                            Id_encontrado = rd.GetInt32("id_encontrado"),
                            Id_bienes = rd.GetInt32("id_bienes"),
                            Id_inventario = rd.GetInt32("id_inventario"),
                            Fecha = rd.GetDateTime("fecha"),
                            Estado = rd.GetString("estado"),
                            Bien = rd.GetString("bien"),
                            Inventario = rd.GetString("inventario"),
                            Categoria = rd.GetString("categoria"),
                            Codigo = rd.GetString("codigo"),
                            Imagen_byte = (byte[]) rd.GetValue(10),
                            Detalle_estado = rd.IsDBNull(11) ? "" : rd.GetString("detalle_estado"),
                            Id_personal = rd.GetInt32("id_personal"),
                            Personal = rd.GetString("personal"),
                            Id_gerencia = rd.GetInt32("id_gerencia"),
                            Gerencia = rd.GetString("gerencia"),
                            Id_area = rd.GetInt32("id_area"),
                            Area = rd.GetString("area"),
                            Marca = rd.GetString("marca"),
                            Modelo = rd.GetString("modelo"),
                            Color = rd.GetString("color"),
                            Serie = rd.GetString("serie")

                        });
                    }

                    rd.Close();

                }
            }

            return lista;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}
        }

    }
}