using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Bienes
    {
        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Bienes()
        {

        }
        public Boolean guardar(Bienes bn)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Bienes";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_categoria", bn.Id_categoria);
                        cmd.Parameters.AddWithValue("_nombre", bn.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", bn.Descripcion);
                        cmd.Parameters.AddWithValue("_codigo", bn.Codigo);
                        cmd.Parameters.AddWithValue("_precio", bn.Precio);
                        cmd.Parameters.AddWithValue("_imagen", bn.Imagen);
                        cmd.Parameters.AddWithValue("_estado", bn.Estado);
                        cmd.Parameters.AddWithValue("_fecha_ing", bn.Fecha_ing);
                        cmd.Parameters.AddWithValue("_marca", bn.Marca);
                        cmd.Parameters.AddWithValue("_color", bn.Color);
                        cmd.Parameters.AddWithValue("_modelo", bn.Modelo);
                        cmd.Parameters.AddWithValue("_alto", bn.Alto);
                        cmd.Parameters.AddWithValue("_ancho", bn.Ancho);
                        cmd.Parameters.AddWithValue("_profundidad", bn.Profundidad);

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

        public List<Bienes> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Bienes> lista = new List<Bienes>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_A_Tabla_Bienes";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Bienes
                            {
                                Id_categoria = rd.GetInt32("id_categoria"),
                                Nombre = rd.GetString("nombre"),
                                Descripcion = rd.GetString("descripcion"),
                                Codigo = rd.GetString("codigo"),
                                Precio = rd.GetDouble ("precio"),
                                Imagen = rd.GetString("imagen"),
                                Estado = rd.GetString("estado"),
                                Fecha_ing = rd.GetString("fecha_ing"),
                                Marca = rd.GetString("marca"),
                                Color = rd.GetString("color"),
                                Modelo = rd.GetString("modelo"),
                                Alto = rd.GetString("alto"),
                                Ancho = rd.GetString("ancho"),
                                Profundidad = rd.GetString("profundidad")
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

        public Boolean actualizar(Bienes bnn)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_M_Tabla_Bienes";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_categoria", bnn.Id_categoria);
                        cmd.Parameters.AddWithValue("_nombre", bnn.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", bnn.Descripcion);
                        cmd.Parameters.AddWithValue("_codigo", bnn.Codigo);
                        cmd.Parameters.AddWithValue("_precio", bnn.Precio);
                        cmd.Parameters.AddWithValue("_imagen", bnn.Imagen);
                        cmd.Parameters.AddWithValue("_estado", bnn.Estado);
                        cmd.Parameters.AddWithValue("_fecha_ing", bnn.Fecha_ing);
                        cmd.Parameters.AddWithValue("_marca", bnn.Marca);
                        cmd.Parameters.AddWithValue("_color", bnn.Color);
                        cmd.Parameters.AddWithValue("_modelo", bnn.Modelo);
                        cmd.Parameters.AddWithValue("_alto", bnn.Alto);
                        cmd.Parameters.AddWithValue("_ancho", bnn.Ancho);
                        cmd.Parameters.AddWithValue("_profundidad", bnn.Profundidad);

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
                        cmd.CommandText = "SP_E_Tabla_Bienes";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_bienes", id);

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