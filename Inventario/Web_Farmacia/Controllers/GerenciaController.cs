using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Farmacia.Controllers
{
    public class GerenciaController : Controller
    {
        // GET: Gerencia
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Gerencia()
        {
            return View();
        }
        public ActionResult Modificar_Gerencia()
        {
            return View();
        }
    }
}