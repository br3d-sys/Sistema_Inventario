using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Controllers
{
    public class Info
    {

       
        private Categoria obj_cat;
        public string val;
        private List<Usuario> usu;
        private Usuario obj_usu;
        private List<Personal> per;
        private Personal obj_per;
        private List<Bienes> bie;
        private Bienes obj_bie;
        private List<Categoria> cat;
        private List<Gerencia> ger;
        private Gerencia obj_ger;
        private List<Area> are;
        private Area obj_are;
        private List<Inventario> inv;
        private Inventario obj_inv;
        private List<Encontrado> enc;
        private Encontrado obj_enc;

        public List<Usuario> Usu
        {
            get
            {
                return usu;
            }
            set
            {
                usu = value;
            }
        }

        public List<Personal> Per
        {
            get
            {
                return per;
            }
            set
            {
                per = value;
            }
        }

        public Usuario Obj_usu
        {
            get
            {
                return obj_usu;
            }
            set
            {
                obj_usu = value;
            }
        }

        public Personal Obj_per
        {
            get
            {
                return obj_per;
            }
            set
            {
                obj_per = value;
            }
        }

        public List<Bienes> Bie
        {
            get
            {
                return bie;
            }
            set
            {
                bie = value;
            }
        }

        public Bienes Obj_bie
        {
            get
            {
                return obj_bie;
            }
            set
            {
                obj_bie = value;
            }
        }

        public List<Categoria> Cat
        {
            get
            {
                return cat;
            }
            set
            {
                cat = value;
            }
        }

        public List<Gerencia> Ger
        {
            get
            {
                return ger;
            }
            set
            {
                ger = value;
            }
        }

        public Gerencia Obj_ger
        {
            get
            {
                return obj_ger;
            }
            set
            {
                obj_ger = value;
            }
        }

        public List<Area> Are
        {
            get
            {
                return are;
            }
            set
            {
                are = value;
            }
        }

        public Area Obj_are
        {
            get
            {
                return obj_are;
            }
            set
            {
                obj_are = value;
            }
        }

        public Categoria Obj_cat
        {
            get
            {
                return obj_cat;
            }
            set
            {
                obj_cat = value;
            }
        }

        public List<Inventario> Inv
        {
            get
            {
                return inv;
            }
            set
            {
                inv = value;
            }
        }

        public Inventario Obj_inv
        {
            get
            {
                return obj_inv;
            }
            set
            {
                obj_inv = value;
            }
        }

        public List<Encontrado> Enc
        {
            get
            {
                return enc;
            }
            set
            {
                enc = value;
            }
        }

        public Encontrado Obj_enc
        {
            get
            {
                return obj_enc;
            }
            set
            {
                obj_enc = value;
            }
        }
    }
}