using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class EmpleadoRestController : ApiController
    {

        public IHttpActionResult Get(int id_area)
        {
            List<Personal> per;
            Modelo_Personal mp = new Modelo_Personal();

            per = mp.buscar("","" , id_area);

            return Json(new { personal = per });
        }
    }
}
