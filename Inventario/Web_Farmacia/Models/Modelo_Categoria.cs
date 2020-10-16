using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

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
            //try
            //{
            MySqlDataReader rd;
            List<Categoria> lista = new List<Categoria>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_R_Tabla_Categoria";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Categoria
                        {
                            Id_categoria = rd.GetInt32("id_categoria"),
                            Nombre = rd.GetString("nombre"),
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

                        cmd.Parameters.AddWithValue("_nombre", cate.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", cate.Descripcion);

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

        public Categoria obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Categoria cat = new Categoria();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Categoria";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_categoria", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        cat.Id_categoria = rd.GetInt32("id_categoria");
                        cat.Nombre = rd.GetString("nombre");
                        cat.Descripcion = rd.GetString("descripcion");
                    }

                    rd.Close();

                }
            }

            return cat;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Categoria> buscar(string nombre)
        {
            //try
            //{

            MySqlDataReader rd;
            List<Categoria> lista = new List<Categoria>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Categoria";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Categoria
                        {
                            Id_categoria = rd.GetInt32("id_categoria"),
                            Nombre = rd.GetString("nombre"),
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

    }

}