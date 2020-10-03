using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Bien
    {

        private int id_bien;
        private int id_categoria;
        private string nombre;
        private string descripcion;
        private string codigo;
        private Double precio;
        private string imagen;
        private string estado;
        private string fecha_ing;
        private string marca;
        private string color;
        private string modelo;
        private string alto;
        private string ancho;
        private string profundidad;
        private string disponibilidad;

        public int Id_bien
        {
            get
            {
                return id_bien;
            }

            set
            {
                id_bien = value;
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

        public string Fecha_ing
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

        public string Alto
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

        public string Ancho
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

        public string Profundidad
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

        public string Disponibilidad
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