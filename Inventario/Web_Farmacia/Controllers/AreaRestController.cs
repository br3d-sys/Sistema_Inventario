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
    public class AreaRestController : ApiController
    {
        public IHttpActionResult Get(int id)
        {
            Modelo_Area ma = new Modelo_Area();
            List<Area> are;

            are = ma.buscar("",id);

            return Json(new {area = are });
        }
    }
}
