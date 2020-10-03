using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Area
    {
        private int id_area;
        private int id_categoria;
        private string nombre;
        private string ubicacion;
        private string descripcion;
        private string disponibilidad;

        public int Id_area 
        { 
            get => id_area; 
            set => id_area = value; 
        }
        public int Id_categoria 
        { 
            get => id_categoria; 
            set => id_categoria = value; 
        }
        public string Nombre 
        { 
            get => nombre; 
            set => nombre = value; 
        }
        public string Ubicacion 
        { 
            get => ubicacion; 
            set => ubicacion = value; 
        }
        public string Descripcion 
        { 
            get => descripcion; 
            set => descripcion = value; 
        }
        public string Disponibilidad 
        { 
            get => disponibilidad; 
            set => disponibilidad = value; 
        }
    }
}