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
            //try
            //{
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
            //}
            //catch (Exception ex)
            //{
            //    return false;
            //}
        }

        public List<Bienes> listar()
        {
            //try
            //{
                MySqlDataReader rd;
                List<Bienes> lista = new List<Bienes>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Bienes";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Bienes
                            {
                                Id_bienes = rd.GetInt32("id_bienes"),
                                Id_categoria = rd.GetInt32("id_categoria"),
                                Categoria = rd.GetString("categoria"),
                                Nombre = rd.GetString("nombre"),
                                Descripcion = rd.GetString("descripcion"),
                                Codigo = rd.GetString("codigo"),
                                Precio = rd.GetDouble ("precio"),
                                Imagen = rd.GetString("imagen"),
                                Estado = rd.GetString("estado"),
                                Fecha_ing = rd.GetDateTime("fecha_ing"),
                                Marca = rd.GetString("marca"),
                                Color = rd.GetString("color"),
                                Modelo = rd.GetString("modelo"),
                                Alto = rd.GetInt32("alto"),
                                Ancho = rd.GetInt32("ancho"),
                                Profundidad = rd.GetInt32("profundidad")
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

        public Boolean actualizar(Bienes bnn)
        {
            //try
            //{
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_U_Tabla_Bienes";
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
                        cmd.Parameters.AddWithValue("_id_bienes", bnn.Id_bienes);

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
            //try
            //{
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_D_Tabla_Bienes";
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
            //}
            //catch (Exception)
            //{
            //    return false;
            //}
        }

        public Bienes obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Bienes bie = new Bienes();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Bienes";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_bienes", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        bie.Id_bienes = rd.GetInt32("id_bienes");
                        bie.Id_categoria = rd.GetInt32("id_categoria");
                        bie.Categoria = rd.GetString("categoria");
                        bie.Nombre = rd.GetString("nombre");
                        bie.Descripcion = rd.GetString("descripcion");
                        bie.Codigo = rd.GetString("codigo");
                        bie.Precio = rd.GetDouble("precio");
                        bie.Estado = rd.GetString("estado");
                        bie.Fecha_ing = rd.GetDateTime("fecha_ing");
                        bie.Marca = rd.GetString("marca");
                        bie.Color = rd.GetString("color");
                        bie.Modelo = rd.GetString("modelo");
                        bie.Alto = rd.GetInt32("alto");
                        bie.Ancho = rd.GetInt32("ancho");
                        bie.Profundidad = rd.GetInt32("profundidad");
                    }

                    rd.Close();

                }
            }

            return bie;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }


        public List<Bienes> buscar(string nombre, string codigo, int id_categoria)
        {
            //try
            //{
            MySqlDataReader rd;
            List<Bienes> lista = new List<Bienes>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Bienes";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);
                    cmd.Parameters.AddWithValue("_codigo", codigo);
                    cmd.Parameters.AddWithValue("_id_categoria", id_categoria);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Bienes
                        {
                            Id_bienes = rd.GetInt32("id_bienes"),
                            Id_categoria = rd.GetInt32("id_categoria"),
                            Categoria = rd.GetString("categoria"),
                            Nombre = rd.GetString("nombre"),
                            Descripcion = rd.GetString("descripcion"),
                            Codigo = rd.GetString("codigo"),
                            Precio = rd.GetDouble("precio"),
                            Imagen = rd.GetString("imagen"),
                            Estado = rd.GetString("estado"),
                            Fecha_ing = rd.GetDateTime("fecha_ing"),
                            Marca = rd.GetString("marca"),
                            Color = rd.GetString("color"),
                            Modelo = rd.GetString("modelo"),
                            Alto = rd.GetInt32("alto"),
                            Ancho = rd.GetInt32("ancho"),
                            Profundidad = rd.GetInt32("profundidad")
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