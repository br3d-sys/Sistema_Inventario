﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Models
{
    public class Modelo_Categoria
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Categoria()
        {

        }
        public Boolean guardar(Categoria cate)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Categoria";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", cate.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", cate.Descripcion);
                        cmd.Parameters.AddWithValue("_disponibilidad", cate.Disponibilidad);


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
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Categoria> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Categoria> lista = new List<Categoria>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_A_Tabla_Categoria";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Producto
                            {
                                Id_categoria = rd.GetInt32("id_categoria"),
                                Nombre = rd.GetString("nombre"),
                                Descripcion = rd.GetString("descripcion"),
                                Disponibilidad = rd.GetString("disponibilidad"),
                            });
                        }

                        rd.Close();

                    }
                }

                return lista;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public Boolean actualizar(Categoria cate)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_M_Tabla_Categoria";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", are.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", are.Descripcion);
                        cmd.Parameters.AddWithValue("_disponibilidad", are.Disponibilidad);

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
        public Boolean eliminar(int id)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_E_Tabla_Categoria";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_categoria", id);

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
    }
}