using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Models
{
    public class Modelo_Personal
    {

        MySqlCommand cmd;
        MySqlConnection con;

        public Modelo_Personal()
        {

        }
        public Boolean guardar(Personal pers)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_C_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_area", pers.Id_area);
                        cmd.Parameters.AddWithValue("_nombre", pers.Nombre);
                        cmd.Parameters.AddWithValue("_cargo", pers.Cargo);
                        cmd.Parameters.AddWithValue("_t_documento", pers.T_documento);
                        cmd.Parameters.AddWithValue("_n_documento", pers.N_documento);
                        cmd.Parameters.AddWithValue("_edad", pers.Edad);
                        cmd.Parameters.AddWithValue("_sexo", pers.Sexo);
                        cmd.Parameters.AddWithValue("_est_civil", pers.Est_civil);
                        cmd.Parameters.AddWithValue("_celular", pers.Celular);
                        cmd.Parameters.AddWithValue("_direccion", pers.Direccion);
                        cmd.Parameters.AddWithValue("_correo", pers.Correo);

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

        public List<Personal> listar()
        {
            try
            {
                MySqlDataReader rd;
                List<Personal> lista = new List<Personal>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_A_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Personal
                            {
                                Id_area = rd.GetInt32("id_area"),
                                Nombre = rd.GetString("nombre"),
                                Cargo = rd.GetString("cargo"),
                                T_documento = rd.GetString("Tipo_documento"),
                                N_documento = rd.GetString("n_documento"),
                                Edad = rd.GetInt16("edad"),
                                Sexo = rd.GetString("sexo"),
                                Est_civil = rd.GetString("est_civil"),
                                Celular = rd.GetString("celular"),
                                Direccion = rd.GetString("direccion"),
                                Correo = rd.GetString("correo"),

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

        public Boolean actualizar(Personal pers)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_M_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_area", pers.Id_area);
                        cmd.Parameters.AddWithValue("_nombre", pers.Nombre);
                        cmd.Parameters.AddWithValue("_cargo", pers.Cargo);
                        cmd.Parameters.AddWithValue("_t_documento", pers.T_documento);
                        cmd.Parameters.AddWithValue("_n_documento", pers.N_documento);
                        cmd.Parameters.AddWithValue("_edad", pers.Edad);
                        cmd.Parameters.AddWithValue("_sexo", pers.Sexo);
                        cmd.Parameters.AddWithValue("_est_civil", pers.Est_civil);
                        cmd.Parameters.AddWithValue("_celular", pers.Celular);
                        cmd.Parameters.AddWithValue("_direccion", pers.Direccion);
                        cmd.Parameters.AddWithValue("_correo", pers.Correo);

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
                        cmd.CommandText = "SP_E_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_personal", id);

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