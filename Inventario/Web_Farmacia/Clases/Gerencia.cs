﻿using System;
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
        private string disponibilidad;

        public int Id_gerencia 
        { 
            get => id_gerencia; 
            set => id_gerencia = value; 
        }
        public string Nombre 
        { 
            get => nombre; 
            set => nombre = value; 
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