using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Farmacia.Controllers
{
    public class InventarioController : Controller
    {
        // GET: Inventario
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Consultar_Inventario()
        {
            return View();
        }
        public ActionResult Modificar_Inventario()
        {
            return View();
        }
        public ActionResult Registrar_Inventario()
        {
            return View();
        }
    }
}