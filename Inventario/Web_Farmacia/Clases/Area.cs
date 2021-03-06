﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Area
    {
        private int id_area;
        private int id_gerencia;
        private string nombre;
        private string gerencia;
        private string ubicacion;
        private string descripcion;
        private int disponibilidad;

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

        public string Ubicacion
        {
            get
            {
                return ubicacion;
            }

            set
            {
                ubicacion = value;
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