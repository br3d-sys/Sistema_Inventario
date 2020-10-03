using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Farmacia.Controllers
{
    public class AreaController : Controller
    {
        // GET: Area
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Consultar_Area()
        {
            return View();
        }
        public ActionResult Modificar_Area()
        {
            return View();
        }
        public ActionResult Registrar_Area()
        {
            return View();
        }
    }
}