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
    public class BienesRestController : ApiController
    {
        public IHttpActionResult Get(string id_gerencia, string id_area, string id_personal, string codigo)
        {
            List<Encontrado> enc;
            Modelo_Encontrado me = new Modelo_Encontrado();
            string idg = id_gerencia==null?"":id_gerencia;
            string ida = id_area == null ? "" : id_area;
            string idp = id_personal == null ? "" : id_personal;
            string cod = codigo == null ? "" : codigo;

            enc = me.buscar_rest(idg, ida, idp, cod);

            return Json(new { encontrado = enc });
        }
    }
}
