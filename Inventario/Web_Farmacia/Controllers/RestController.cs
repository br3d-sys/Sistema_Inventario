using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Helpers;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class RestController : ApiController
    {
        
        
        

        //public IHttpActionResult Listar_Oficinas()
        //{
        //    List<Area> are;
        //    Modelo_Area ma = new Modelo_Area();
        //    List<Gerencia> ger;
        //    Metodo_Gerencia mg = new Metodo_Gerencia();

        //    are = ma.listar();
        //    ger = mg.listar();

        //    return Json(new { area = are, gerencia = ger });
        //}

        //public IHttpActionResult Listar_Oficinas()
        //{
        //    List<Area> are;
        //    Modelo_Area ma = new Modelo_Area();
        //    List<Gerencia> ger;
        //    Metodo_Gerencia mg = new Metodo_Gerencia();

        //    are = ma.listar();
        //    ger = mg.listar();

        //    return Json(new { area = are, gerencia = ger });
        //}

        //public ActionResult Consultar_Personal(string nombre, int id_gerencia, int id_area)
        //{
        //    List<Personal> per;
        //    List<Area> are;
        //    List<Gerencia> ger;
        //    Modelo_Personal mp = new Modelo_Personal();
        //    Modelo_Area ma = new Modelo_Area();
        //    Metodo_Gerencia mg = new Metodo_Gerencia();

        //    Info datos = new Info();
        //    per = mp.buscar(nombre, id_gerencia, id_area);
        //    are = ma.listar();
        //    ger = mg.listar();

        //    ViewBag.eliminar = TempData["Eliminar"];

        //    datos.Per = per;
        //    datos.Are = are;
        //    datos.Ger = ger;

        //    return View(datos);
        //}
    }
}
