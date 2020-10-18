using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Metodo_Gerencia
    {

        MySqlCommand cmd;
        MySqlConnection con;

        public Metodo_Gerencia()
        {

        }
        public Boolean guardar(Gerencia gere)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Gerencia";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", gere.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", gere.Descripcion);

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

        public List<Gerencia> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Gerencia> lista = new List<Gerencia>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Gerencia";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Gerencia
                            {
                                Id_gerencia = rd.GetInt32("id_gerencia"),
                                Nombre = rd.GetString("nombre"),
                                Descripcion = rd.GetString("descripcion")
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

        public Boolean actualizar(Gerencia are)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_U_Tabla_Gerencia";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", are.Nombre);
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
                        cmd.CommandText = "SP_D_Tabla_Gerencia";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_gerencia", id);

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

        public Gerencia obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Gerencia ger = new Gerencia();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Gerencia";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_gerencia", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        ger.Id_gerencia = rd.GetInt32("id_gerencia");
                        ger.Nombre = rd.GetString("nombre");
                        ger.Descripcion = rd.GetString("descripcion");
                        
                    }

                    rd.Close();

                }
            }

            return ger;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Gerencia> buscar(string nombre)
        {
            //try
            //{

            MySqlDataReader rd;
            List<Gerencia> lista = new List<Gerencia>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Gerencia";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Gerencia
                        {
                            Id_gerencia = rd.GetInt32("id_gerencia"),
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