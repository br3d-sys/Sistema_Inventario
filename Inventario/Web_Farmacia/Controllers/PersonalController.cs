using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Farmacia.Controllers
{
    public class PersonalController : Controller
    {
        // GET: Personal
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Registrar_Personal()
        {
            return View();
        }
        public ActionResult Consultar_Personal()
        {
            return View();
        }
        public ActionResult Modificar_Personal()
        {
            return View();
        }
    }
}