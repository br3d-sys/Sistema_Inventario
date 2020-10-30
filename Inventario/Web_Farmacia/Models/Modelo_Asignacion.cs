using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Asignacion
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Asignacion()
        {

        }
        public Boolean guardar(Asignacion asig)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Asignacion";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_usuario", asig.Id_usuario);
                        cmd.Parameters.AddWithValue("_id_encontrado", asig.Id_encontrado);
                        cmd.Parameters.AddWithValue("_id_personal", asig.Id_personal);
                        cmd.Parameters.AddWithValue("_id_area", asig.Id_area);
                        cmd.Parameters.AddWithValue("_fecha", asig.Fecha_asig);

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

        public List<Asignacion> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Asignacion> lista = new List<Asignacion>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Asignacion";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Asignacion
                            {
                                Id_asignacion = rd.GetInt32("id_asignacion"),
                                Id_usuario = rd.GetInt32("id_usuario"),
                                Id_encontrado = rd.GetInt32("id_encontrado"),
                                Id_inventario = rd.GetInt32("id_inventario"),
                                Id_bienes = rd.GetInt32("id_bienes"),
                                Bien = rd.GetString("bien"),
                                Codigo = rd.GetString("codigo"),
                                Inventario = rd.GetString("inventario"),
                                Id_personal = rd.GetInt32("id_personal"),
                                Personal = rd.GetString("personal"),
                                Id_area = rd.GetInt32("id_area"),
                                Area = rd.GetString("area"),
                                Id_gerencia = rd.GetInt32("id_gerencia"),
                                Gerencia = rd.GetString("gerencia"),
                                Fecha_asig = rd.GetDateTime("fecha")
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

        public Boolean actualizar(Asignacion asig)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_U_Tabla_Asignacion";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_usuario", asig.Id_usuario);
                        cmd.Parameters.AddWithValue("_id_encontrado", asig.Id_encontrado);
                        cmd.Parameters.AddWithValue("_id_personal", asig.Id_personal);
                        cmd.Parameters.AddWithValue("_id_area", asig.Id_area);
                        cmd.Parameters.AddWithValue("_fecha", asig.Fecha_asig);

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
                        cmd.CommandText = "SP_D_Tabla_Asignacion";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_asignacion", id);

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

        public Asignacion obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Asignacion asi = new Asignacion();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Asignacion";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_asignacion", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {

                        asi.Id_asignacion = rd.GetInt32("id_asignacion");
                        asi.Id_usuario = rd.GetInt32("id_usuario");
                        asi.Id_encontrado = rd.GetInt32("id_encontrado");
                        asi.Id_inventario = rd.GetInt32("id_inventario");
                        asi.Id_bienes = rd.GetInt32("id_bienes");
                        asi.Bien = rd.GetString("bien");
                        asi.Codigo = rd.GetString("codigo");
                        asi.Inventario = rd.GetString("inventario");
                        asi.Id_personal = rd.GetInt32("id_personal");
                        asi.Personal = rd.GetString("personal");
                        asi.Id_area = rd.GetInt32("id_area");
                        asi.Area = rd.GetString("area");
                        asi.Id_gerencia = rd.GetInt32("id_gerencia");
                        asi.Gerencia = rd.GetString("gerencia");
                        asi.Fecha_asig = rd.GetDateTime("fecha");


                    }

                    rd.Close();

                }
            }

            return asi;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Asignacion> buscar(string nombre, int id_area)
        {
            //try
            //{
            MySqlDataReader rd;
            List<Asignacion> lista = new List<Asignacion>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Asignacion";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);
                    cmd.Parameters.AddWithValue("_id_area", id_area);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Asignacion
                        {

                            Id_asignacion = rd.GetInt32("id_asignacion"),
                            Id_usuario = rd.GetInt32("id_usuario"),
                            Id_encontrado = rd.GetInt32("id_encontrado"),
                            Id_inventario = rd.GetInt32("id_inventario"),
                            Id_bienes = rd.GetInt32("id_bienes"),
                            Bien = rd.GetString("bien"),
                            Codigo = rd.GetString("codigo"),
                            Inventario = rd.GetString("inventario"),
                            Id_personal = rd.GetInt32("id_personal"),
                            Personal = rd.GetString("personal"),
                            Id_area = rd.GetInt32("id_area"),
                            Area = rd.GetString("area"),
                            Id_gerencia = rd.GetInt32("id_gerencia"),
                            Gerencia = rd.GetString("gerencia"),
                            Fecha_asig = rd.GetDateTime("fecha")

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