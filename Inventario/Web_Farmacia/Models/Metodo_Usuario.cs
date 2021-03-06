﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Metodo_Usuario
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Metodo_Usuario()
        {

        }
        public Boolean guardar(Usuario usu)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Usuario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", usu.Nombre);
                        cmd.Parameters.AddWithValue("_contrasena", usu.Contrasena);
                        cmd.Parameters.AddWithValue("_documento", usu.Documento);
                        cmd.Parameters.AddWithValue("_n_documento", usu.N_documento);
                        cmd.Parameters.AddWithValue("_correo", usu.Correo);
                        cmd.Parameters.AddWithValue("_celular", usu.Celular);
                        cmd.Parameters.AddWithValue("_direccion", usu.Direccion);
                        cmd.Parameters.AddWithValue("_cargo", usu.Cargo);

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

        public List<Usuario> listar()
        {
            //try
            //{

                MySqlDataReader rd;
                List<Usuario> lista = new List<Usuario>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Usuario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Usuario
                            {
                                Id_usuario = rd.GetInt32("id_usuario"),
                                Nombre = rd.GetString("nombre"),
                                Documento = rd.GetString("documento"),
                                N_documento = rd.GetString("n_documento"),
                                Correo = rd.GetString("correo"),
                                Celular = rd.GetString("celular"),
                                Direccion = rd.GetString("direccion"),
                                Cargo = rd.GetString("cargo")
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

        public Boolean eliminar(int id)
        {
            //try
            //{
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_D_Tabla_Usuario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_usuario", id);

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

        public Boolean actualizar(Usuario usu)
        {
            //try
            //{
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_U_Tabla_Usuario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", usu.Nombre);
                        cmd.Parameters.AddWithValue("_contrasena", usu.Contrasena);
                        cmd.Parameters.AddWithValue("_documento", usu.Documento);
                        cmd.Parameters.AddWithValue("_n_documento", usu.N_documento);
                        cmd.Parameters.AddWithValue("_correo", usu.Correo);
                        cmd.Parameters.AddWithValue("_celular", usu.Celular);
                        cmd.Parameters.AddWithValue("_direccion", usu.Direccion);
                        cmd.Parameters.AddWithValue("_cargo", usu.Cargo);
                        cmd.Parameters.AddWithValue("_id_usuario", usu.Id_usuario);


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

        public Usuario obtener(int? id)
        {
            //try
            //{
                MySqlDataReader rd;
                Usuario usu = new Usuario();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_O_Tabla_Usuario";
                        //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_usuario", id);

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            usu.Id_usuario = rd.GetInt32("id_usuario");
                            usu.Nombre = rd.GetString("nombre");
                            usu.Contrasena = rd.GetString("contrasena");
                            usu.Documento = rd.GetString("documento");
                            usu.N_documento = rd.GetString("n_documento");
                            usu.Correo = rd.GetString("correo");
                            usu.Celular = rd.GetString("celular");
                            usu.Direccion = rd.GetString("direccion");
                            usu.Cargo = rd.GetString("Cargo");
                        }

                        rd.Close();

                    }
                }

                return usu;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public Usuario validar(string correo, string contrasena)
        {
            //try
            //{
                MySqlDataReader rd;
                Usuario usu = new Usuario();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_V_Tabla_Usuario";
                        //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_correo", correo);
                        cmd.Parameters.AddWithValue("_contrasena", contrasena);

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            usu.Id_usuario = rd.GetInt32("id_usuario");
                            usu.Nombre = rd.GetString("nombre");
                            usu.Documento = rd.GetString("documento");
                            usu.N_documento = rd.GetString("n_documento");
                            usu.Correo = rd.GetString("correo");
                            usu.Celular = rd.GetString("celular");
                            usu.Direccion = rd.GetString("direccion");
                            usu.Cargo = rd.GetString("cargo");
                        }

                        rd.Close();

                    }
                }

                return usu;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Usuario> buscar(string nombre, string n_documento)
        {
            //try
            //{

            MySqlDataReader rd;
            List<Usuario> lista = new List<Usuario>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Usuario";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);
                    cmd.Parameters.AddWithValue("_n_documento", n_documento);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Usuario
                        {
                            Id_usuario = rd.GetInt32("id_usuario"),
                            Nombre = rd.GetString("nombre"),
                            Documento = rd.GetString("documento"),
                            N_documento = rd.GetString("n_documento"),
                            Correo = rd.GetString("correo"),
                            Celular = rd.GetString("celular"),
                            Direccion = rd.GetString("direccion"),
                            Cargo = rd.GetString("cargo")
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