using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Bienes
    {

        private int id_bienes;
        private int id_categoria;
        private string categoria;
        private string nombre;
        private string serie;
        private string descripcion;
        private string codigo;
        private Double precio;
        private string imagen;
        private string estado;
        private DateTime fecha_ing;
        private string marca;
        private string color;
        private string modelo;
        private int alto;
        private int ancho;
        private int profundidad;
        private int disponibilidad;

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

        public int Id_categoria
        {
            get
            {
                return id_categoria;
            }

            set
            {
                id_categoria = value;
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

        public string Serie
        {
            get
            {
                return serie;
            }

            set
            {
                serie = value;
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

        public double Precio
        {
            get
            {
                return precio;
            }

            set
            {
                precio = value;
            }
        }

        public string Imagen
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

        public DateTime Fecha_ing
        {
            get
            {
                return fecha_ing;
            }

            set
            {
                fecha_ing = value;
            }
        }

        public string Marca
        {
            get
            {
                return marca;
            }

            set
            {
                marca = value;
            }
        }

        public string Color
        {
            get
            {
                return color;
            }

            set
            {
                color = value;
            }
        }

        public string Modelo
        {
            get
            {
                return modelo;
            }

            set
            {
                modelo = value;
            }
        }

        public int Alto
        {
            get
            {
                return alto;
            }

            set
            {
                alto = value;
            }
        }

        public int Ancho
        {
            get
            {
                return ancho;
            }

            set
            {
                ancho = value;
            }
        }

        public int Profundidad
        {
            get
            {
                return profundidad;
            }

            set
            {
                profundidad = value;
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