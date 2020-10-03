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

        public Boolean guardar(Personal per)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_G_Tabla_Personal";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_id_area", per.Id_area);
                        cmd.Parameters.AddWithValue("_nombre",per.Nombre);
                        cmd.Parameters.AddWithValue("cargo", per.Cargo);
                        cmd.Parameters.AddWithValue("_documento", usu.Documento);
                        cmd.Parameters.AddWithValue("_n_documento", usu.N_documento);
                        cmd.Parameters.AddWithValue("_correo", usu.Correo);
                        cmd.Parameters.AddWithValue("_celular", usu.Celular);
                        cmd.Parameters.AddWithValue("_direccion", usu.Direccion);
                        cmd.Parameters.AddWithValue("_id_cargo", usu.Id_cargo);

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

    }
}