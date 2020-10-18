using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Inventario
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Inventario()
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

                        cmd.Parameters.AddWithValue("_nombre", inven.Nombre);
                        cmd.Parameters.AddWithValue("_fecha_ini", inven.Fecha_ini);
                        cmd.Parameters.AddWithValue("_fecha_fin", inven.Fecha_fin);

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
                        cmd.CommandText = "SP_R_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Inventario
                            {
                                Id_inventario = rd.GetInt32("id_inventario"),
                                Nombre = rd.GetString("nombre"),
                                Fecha_ini = rd.GetDateTime("fecha_ini"),
                                Fecha_fin = rd.GetDateTime("fecha_fin")                         
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

                        cmd.CommandText = "SP_U_Tabla_Inventario";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", inven.Nombre);
                        cmd.Parameters.AddWithValue("_fecha_ini", inven.Fecha_ini);
                        cmd.Parameters.AddWithValue("_fecha_fin", inven.Fecha_fin);

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
                        cmd.CommandText = "SP_D_Tabla_Inventario";
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

        public Inventario obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Inventario inv = new Inventario();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Inventario";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_inventario", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        inv.Id_inventario = rd.GetInt32("id_inventario");
                        inv.Nombre = rd.GetString("nombre");
                        inv.Fecha_ini = rd.GetDateTime("fecha_ini");
                        inv.Fecha_fin = rd.GetDateTime("fecha_fin");
                    }

                    rd.Close();

                }
            }

            return inv;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Inventario> buscar(DateTime fecha_ini, DateTime fecha_fin)
        {
            //try
            //{

            MySqlDataReader rd;
            List<Inventario> lista = new List<Inventario>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Inventario";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_fecha_ini", fecha_ini);
                    cmd.Parameters.AddWithValue("_fecha_fin", fecha_fin);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Inventario
                        {
                            Id_inventario = rd.GetInt32("id_inventario"),
                            Nombre = rd.GetString("nombre"),
                            Fecha_ini = rd.GetDateTime("fecha_ini"),
                            Fecha_fin = rd.GetDateTime("fecha_fin"),
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