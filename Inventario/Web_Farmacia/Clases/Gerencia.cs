using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Gerencia
    {

        private int id_gerencia;
        private string nombre;
        private string descripcion;
        private int disponibilidad;

        public int Id_gerencia
        {
            get
            {
                return id_gerencia;
            }

            set
            {
                id_gerencia = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public string Descripcion
        {
            get
            {
                return descripcion;
            }

            set
            {
                descripcion = value;
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