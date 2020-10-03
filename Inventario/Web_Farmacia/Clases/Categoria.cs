using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Categoria
    {
        private int id_categoria;
        private string nombre;
        private string Descripcion;
        private int disponibilidad;

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
                return nombre
            }
            set
            {
                nombre = value;
            }
        }
        public string Descripcion1
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