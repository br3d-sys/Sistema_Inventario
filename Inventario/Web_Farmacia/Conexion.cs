using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Web_Farmacia
{
    public class Conexion
    {
        MySqlConnection con;

        public Conexion()
        {
            con = new MySqlConnection("server=localhost;database=sistema_inventario;Uid=root;pwd=;port=3308");
            //con = new MySqlConnection("Server=MYSQL5021.site4now.net;Database=db_a63fe8_ventas;Uid=a63fe8_ventas;Pwd=branco_937");
        }

        public static MySqlConnection conectar()
        {
            Conexion cn = new Conexion();
            cn.con.Open();
            return cn.con;
        }
    }
}