using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class OficinasRestController : ApiController
    {

        public IHttpActionResult Get()
        {
            List<Area> are;
            Modelo_Area ma = new Modelo_Area();
            List<Gerencia> ger;
            Metodo_Gerencia mg = new Metodo_Gerencia();

            are = ma.listar();
            ger = mg.listar();

            return Json(new { area = are, gerencia = ger });
        }

    }
}
