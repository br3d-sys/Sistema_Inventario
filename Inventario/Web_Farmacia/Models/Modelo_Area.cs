using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
   
    public class Modelo_Area
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Area()
        {

        }
        public Boolean guardar(Area are)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Area";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_categoria", are.Id_categoria);
                        cmd.Parameters.AddWithValue("_nombre", are.Nombre);
                        cmd.Parameters.AddWithValue("_ubicacion", are.Ubicacion);
                        cmd.Parameters.AddWithValue("_descripcion", are.Descripcion);

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

        public List<Area> listar()
        {
            //try
            //{
                MySqlDataReader rd;
                List<Area> lista = new List<Area>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Area";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Area
                            {
                                Id_area = rd.GetInt32("id_area"),
                                Id_categoria = rd.GetInt32("id_gerencia"),
                                Nombre = rd.GetString("nombre"),
                                Ubicacion = rd.GetString("ubicacion"),
                                Descripcion = rd.GetString("descripcion")
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

        public Boolean actualizar(Area are)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_M_Tabla_Area";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_categoria", are.Id_categoria);
                        cmd.Parameters.AddWithValue("_nombre", are.Nombre);
                        cmd.Parameters.AddWithValue("_ubicacion", are.Ubicacion);
                        cmd.Parameters.AddWithValue("_descripcion", are.Descripcion);

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
                        cmd.CommandText = "SP_E_Tabla_Area";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_area", id);

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