using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Inventario
    {
        private int id_inventario;
        private int id_bien;
        private string n_inventario;
        private string fecha_inven;
        private string estado;
        private int disponibilidad;

        public int Id_inventario
        {
            get
            {
                return id_inventario;
            }

            set
            {
                id_inventario = value;
            }
        }

        public int Id_bien
        {
            get
            {
                return id_bien;
            }

            set
            {
                id_bien = value;
            }
        }

        public string N_inventario
        {
            get
            {
                return n_inventario;
            }

            set
            {
                n_inventario = value;
            }
        }

        public string Fecha_inven
        {
            get
            {
                return fecha_inven;
            }

            set
            {
                fecha_inven = value;
            }
        }

        public string Estado
        {
            get
            {
                return estado;
            }

            set
            {
                estado = value;
            }
        }

        public int Disponibilidad
        {
            get
            {
                return disponibilidad;
            }

            set
            {
                disponibilidad = value;
            }
        }
    }
}