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
                        cmd.Parameters.AddWithValue("_fecha_asig", asig.Fecha_asig);

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
                                Id_personal = rd.GetInt32("id_personal"),
                                Id_area = rd.GetInt32("id_area"),
                                Fecha_asig = rd.GetString("fecha_asig")
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
                        cmd.Parameters.AddWithValue("_fecha_asig", asig.Fecha_asig);

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
    }
}