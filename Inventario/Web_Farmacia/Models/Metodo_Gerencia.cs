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

        public Boolean guardar(Gerencia ger)
        {
            try
            {
                using (con = Conexion.conectar())
                {
                    using (cmd = new MySqlCommand())
                    {
                        cmd.CommandText = "SP_A_Tabla_Gerencia";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = con;

                        cmd.Parameters.AddWithValue("_nombre", ger.Nombre);
                        cmd.Parameters.AddWithValue("_descripcion", ger.Descripcion);
                        

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

    }
}