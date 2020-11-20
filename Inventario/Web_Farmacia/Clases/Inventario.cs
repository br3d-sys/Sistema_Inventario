using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Inventario
    {
        private int id_inventario;
        private string anio_periodo;
        private int periodo;
        private DateTime fecha_ini;
        private DateTime fecha_fin;

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

        public string Anio_periodo
        {
            get
            {
                return anio_periodo;
            }

            set
            {
                anio_periodo = value;
            }
        }

        public int Periodo
        {
            get
            {
                return periodo;
            }

            set
            {
                periodo = value;
            }
        }

        public DateTime Fecha_ini
        {
            get
            {
                return fecha_ini;
            }

            set
            {
                fecha_ini = value;
            }
        }

        public DateTime Fecha_fin
        {
            get
            {
                return fecha_fin;
            }

            set
            {
                fecha_fin = value;
            }
        }

    }
}