using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Encontrado
    {
        private int id_encontrado;
        private int id_bienes;
        private int id_inventario;
        private DateTime fecha;
        private string estado;
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