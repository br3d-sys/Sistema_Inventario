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
        private string categoria;
        private byte[] imagen_byte;
        private string detalle_estado;
        private int id_personal;
        private string personal;
        private int id_area;
        private string area;
        private int id_gerencia;
        private string gerencia;

        private string t_documento;
        private string n_documento;
        private string archivo;
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

        public string Categoria
        {
            get
            {
                return categoria;
            }

            set
            {
                categoria = value;
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

        public byte[] Imagen_byte
        {
            get
            {
                return imagen_byte;
            }

            set
            {
                imagen_byte = value;
            }
        }

        public string Detalle_estado
        {
            get
            {
                return detalle_estado;
            }

            set
            {
                detalle_estado = value;
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

        public string T_documento
        {
            get
            {
                return t_documento;
            }

            set
            {
                t_documento = value;
            }
        }

        public string N_documento
        {
            get
            {
                return n_documento;
            }

            set
            {
                n_documento = value;
            }
        }

        public string Archivo
        {
            get
            {
                return archivo;
            }

            set
            {
                archivo = value;
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