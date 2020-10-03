using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Farmacia.Controllers
{
    public class BienController : Controller
    {
        // GET: Bien
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Registrar_Bien()
        {
            return View();
        }
    }
}