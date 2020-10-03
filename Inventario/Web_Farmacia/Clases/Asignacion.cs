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
        private int id_inventario;
        private int id_personal;
        private int id_area;
        private string fecha_asig;
        private string disponibilidad;

        public int Id_asignacion 
        { 
            get => id_asignacion; 
            set => id_asignacion = value; 
        }
        public int Id_usuario 
        { 
            get => id_usuario; 
            set => id_usuario = value; 
        }
        public int Id_inventario 
        { 
            get => id_inventario; 
            set => id_inventario = value; 
        }
        public int Id_personal 
        { 
            get => id_personal; 
            set => id_personal = value; 
        }
        public int Id_area 
        { 
            get => id_area; 
            set => id_area = value; 
        }
        public string Fecha_asig 
        { 
            get => fecha_asig; 
            set => fecha_asig = value; 
        }
        public string Disponibilidad 
        { 
            get => disponibilidad; 
            set => disponibilidad = value;
        }
    }
}