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
        private int id_personal;
        private string personal;
        private int id_area;
        private string area;
        private int id_gerencia;
        private string gerencia;
        private int id_bienes;
        private string bien;
        private string codigo;
        private int id_inventario;
        private string inventario;
        private DateTime fecha_asig;

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

        public int Id_bienes
        {
            get
            {
                return id_bienes;
            }

            set
            {
                id_bienes = value;
            }
        }

        public string Bien
        {
            get
            {
                return bien;
            }

            set
            {
                bien = value;
            }
        }

        public string Codigo
        {
            get
            {
                return codigo;
            }

            set
            {
                codigo = value;
            }
        }

        public string Inventario
        {
            get
            {
                return inventario;
            }

            set
            {
                inventario = value;
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

        public string Personal
        {
            get
            {
                return personal;
            }

            set
            {
                personal = value;
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

        public string Area
        {
            get
            {
                return area;
            }

            set
            {
                area = value;
            }
        }

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

        public string Gerencia
        {
            get
            {
                return gerencia;
            }

            set
            {
                gerencia = value;
            }
        }

        public DateTime Fecha_asig
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
    }
}