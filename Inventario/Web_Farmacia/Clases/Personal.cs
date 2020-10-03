using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Farmacia.Clases
{
    public class Personal
    {

        private int id_personal;
        private int id_area;
        private string nombre;
        private string cargo;
        private string t_documento;
        private string n_documento;
        private int edad;
        private string sexo;
        private string est_civil;
        private string celular;
        private string direccion;
        private string correo;
        private int disponibilidad;

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

        public string Cargo
        {
            get
            {
                return cargo;
            }

            set
            {
                cargo = value;
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

        public int Edad
        {
            get
            {
                return edad;
            }

            set
            {
                edad = value;
            }
        }

        public string Sexo
        {
            get
            {
                return sexo;
            }

            set
            {
                sexo = value;
            }
        }

        public string Est_civil
        {
            get
            {
                return est_civil;
            }

            set
            {
                est_civil = value;
            }
        }

        public string Celular
        {
            get
            {
                return celular;
            }

            set
            {
                celular = value;
            }
        }

        public string Direccion
        {
            get
            {
                return direccion;
            }

            set
            {
                direccion = value;
            }
        }

        public string Correo
        {
            get
            {
                return correo;
            }

            set
            {
                correo = value;
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