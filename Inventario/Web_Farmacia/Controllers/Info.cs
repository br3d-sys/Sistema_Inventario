using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Farmacia.Clases;

namespace Web_Farmacia.Controllers
{
    public class Info
    {

        private List<Usuario> usu;
        private Usuario obj_usu;
        private List<Personal> per;
        private Personal obj_per;
        private List<Bienes> bie;
        private Bienes obj_bie;


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
    }
}