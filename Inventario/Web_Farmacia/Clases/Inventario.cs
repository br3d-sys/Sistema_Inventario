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
        private string inventario;
        private string fecha_inven;
        private string estado;
        private string disponibilidad;

        public int Id_inventario 
        { 
            get => id_inventario; 
            set => id_inventario = value; 
        }
        public int Id_bien 
        { 
            get => id_bien; 
            set => id_bien = value; 
        }
        public string Inventario 
        { 
            get => inventario; 
            set => inventario = value; 
        }
        public string Fecha_inven 
        { 
            get => fecha_inven; 
            set => fecha_inven = value; 
        }
        public string Estado 
        { 
            get => estado; 
            set => estado = value; 
        }
        public string Disponibilidad 
        { 
            get => disponibilidad; 
            set => disponibilidad = value; 
        }
    }
}