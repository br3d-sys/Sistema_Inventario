using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Runtime.CompilerServices;

namespace Web_Farmacia.Clases
{
    public class Encontrado
    {
        private int id_encontrado;
        private int id_bienes;
        private string bien;
        private int id_inventario;
        private string inventario;
        private DateTime fecha;
        private string codigo;
        private string estado;
        private System.Drawing.Image imagen;
        private int disponibilidad;

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

        public DateTime Fecha
        {
            get
            {
                return fecha;
            }

            set
            {
                fecha = value;
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

        public System.Drawing.Image Imagen
        {
            get
            {
                return imagen;
            }

            set
            {
                imagen = value;
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