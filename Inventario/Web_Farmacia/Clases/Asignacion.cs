using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Asignacion
    {
        private int id_asignacion;
        private int id_usuario;
        private int id_encontrado;
        private int id_personal;
        private int id_area;
        private string fecha_asig;
        private int disponibilidad;

        public int Id_asignacion
        {
            get
            {
                return id_asignacion;
            }

            set
            {
                id_asignacion = value;
            }
        }

        public int Id_usuario
        {
            get
            {
                return id_usuario;
            }

            set
            {
                id_usuario = value;
            }
        }

        public int Id_encontrado
        {
            get
            {
                return id_encontrado;
            }

            set
            {
                id_encontrado = value;
            }
        }

        public int Id_personal
        {
            get
            {
                return id_personal;
            }

            set
            {
                id_personal = value;
            }
        }

        public int Id_area
        {
            get
            {
                return id_area;
            }

            set
            {
                id_area = value;
            }
        }

        public string Fecha_asig
        {
            get
            {
                return fecha_asig;
            }

            set
            {
                fecha_asig = value;
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