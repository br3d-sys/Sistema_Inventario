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
            //try
            //{
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
            //}
            //catch (Exception ex)
            //{
            //    return false;
            //}
        }

        public List<Personal> listar()
        {
            //try
            //{
                MySqlDataReader rd;
                List<Personal> lista = new List<Personal>();

                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_R_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        rd = cmd.ExecuteReader();

                        while (rd.Read())
                        {
                            lista.Add(new Personal
                            {

                                Id_personal = rd.GetInt32("id_personal"),
                                Id_area = rd.GetInt32("id_area"),
                                Area = rd.GetString("area"),
                                Id_gerencia = rd.GetInt32("id_gerencia"),
                                Gerencia = rd.GetString("gerencia"),
                                Nombre = rd.GetString("nombre"),
                                Cargo = rd.GetString("cargo"),
                                T_documento = rd.GetString("t_documento"),
                                N_documento = rd.GetString("n_documento"),
                                Edad = rd.GetInt16("edad"),
                                Sexo = rd.GetString("sexo"),
                                Est_civil = rd.GetString("est_civil"),
                                Celular = rd.GetString("celular"),
                                Direccion = rd.GetString("direccion"),
                                Correo = rd.GetString("correo")

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

        public Boolean actualizar(Personal pers)
        {
            //try
            //{
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {

                        cmd.CommandText = "SP_U_Tabla_Personal";
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
                        cmd.Parameters.AddWithValue("_id_personal", pers.Id_personal);

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
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_D_Tabla_Personal";
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

        public Personal obtener(int? id)
        {
            //try
            //{
            MySqlDataReader rd;
            Personal per = new Personal();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_O_Tabla_Personal";
                    //cmd.CommandText = string.Format("Select * from tbl_categoria where id_categoria='{0}'", id);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_id_personal", id);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        per.Id_personal = rd.GetInt32("id_personal");
                        per.Id_area = rd.GetInt32("id_area");
                        per.Area = rd.GetString("area");
                        per.Id_gerencia = rd.GetInt32("id_gerencia");
                        per.Gerencia = rd.GetString("gerencia");
                        per.Nombre = rd.GetString("nombre");
                        per.Cargo = rd.GetString("cargo");
                        per.T_documento = rd.GetString("t_documento");
                        per.N_documento = rd.GetString("n_documento");
                        per.Edad = rd.GetInt32("edad");
                        per.Sexo = rd.GetString("sexo");
                        per.Est_civil = rd.GetString("est_civil");
                        per.Celular = rd.GetString("celular");
                        per.Direccion = rd.GetString("direccion");
                        per.Correo = rd.GetString("correo");
                    }

                    rd.Close();

                }
            }

            return per;
            //}
            //catch (Exception)
            //{
            //    return null;
            //}

        }

        public List<Personal> buscar(string nombre, int id_gerencia, int id_area)
        {
            //try
            //{
            MySqlDataReader rd;
            List<Personal> lista = new List<Personal>();

            using (con = Conexion.conectar())
            {
                using (cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SP_B_Tabla_Personal";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;

                    cmd.Parameters.AddWithValue("_nombre", nombre);
                    cmd.Parameters.AddWithValue("_id_gerencia", id_gerencia);
                    cmd.Parameters.AddWithValue("_id_area", id_area);

                    rd = cmd.ExecuteReader();

                    while (rd.Read())
                    {
                        lista.Add(new Personal
                        {

                            Id_personal = rd.GetInt32("id_personal"),
                            Id_area = rd.GetInt32("id_area"),
                            Area = rd.GetString("area"),
                            Id_gerencia = rd.GetInt32("id_gerencia"),
                            Gerencia = rd.GetString("gerencia"),
                            Nombre = rd.GetString("nombre"),
                            Cargo = rd.GetString("cargo"),
                            T_documento = rd.GetString("t_documento"),
                            N_documento = rd.GetString("n_documento"),
                            Edad = rd.GetInt16("edad"),
                            Sexo = rd.GetString("sexo"),
                            Est_civil = rd.GetString("est_civil"),
                            Celular = rd.GetString("celular"),
                            Direccion = rd.GetString("direccion"),
                            Correo = rd.GetString("correo")

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