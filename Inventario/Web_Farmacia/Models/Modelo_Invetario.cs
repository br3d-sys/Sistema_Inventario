using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Invetario
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Invetario()
        {

        }
        public Boolean guardar(Inventario inven)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_bien", inven.Id_bien);
                        cmd.Parameters.AddWithValue("_inventario", inven.N_inventario);
                        cmd.Parameters.AddWithValue("_fecha", inven.Fecha_inven);
                        cmd.Parameters.AddWithValue("_estado", inven.Estado);

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

        public List<Inventario> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Inventario> lista = new List<Inventario>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_A_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Inventario
                            {
                                Id_bien = rd.GetInt32("id_bien"),
                                N_inventario = rd.GetString("n_inventario"),
                                Fecha_inven = rd.GetString("fecha_inven"),
                                Estado = rd.GetString("estado")                         
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

        public Boolean actualizar(Inventario inven)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_M_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_bien", inven.Id_bien);
                        cmd.Parameters.AddWithValue("_inventario", inven.N_inventario);
                        cmd.Parameters.AddWithValue("_fecha", inven.Fecha_inven);
                        cmd.Parameters.AddWithValue("estado", inven.Estado);

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
                        cmd.CommandText = "SP_E_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_inventario", id);

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