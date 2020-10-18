using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class GerenciaController : Controller
    {
        Gerencia v_ger = new Gerencia();

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Gerencia()
        {
            List<Gerencia> ger;
            Metodo_Gerencia mg = new Metodo_Gerencia();

            Info datos = new Info();
            ger = mg.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Ger = ger;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Gerencia(string nombre)
        {

            List<Gerencia> ger;
            Metodo_Gerencia mg = new Metodo_Gerencia();

            Info datos = new Info();
            ger = mg.buscar(nombre);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Ger = ger;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Metodo_Gerencia mg = new Metodo_Gerencia();
            if (mg.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Gerencia");

            //return View();
        }

        public ActionResult Modificar_Gerencia(int? id)
        {
            Metodo_Gerencia mg = new Metodo_Gerencia();

            if (id != null)
            {
                v_ger = mg.obtener(id);

                Info datos = new Info();
                datos.Obj_ger = v_ger;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Gerencia");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Gerencia(int id, string nombre, string descripcion)
        {
            Metodo_Gerencia mg = new Metodo_Gerencia();
            Gerencia ger = new Gerencia();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el nombre del Usuario");
                }
                if (String.IsNullOrEmpty(descripcion))
                {
                    error.Add("sp_descripcion", "Ingrese su Descripción");
                }

                if (error.Count == 0)
                {
                    ger.Id_gerencia = id;
                    ger.Nombre = nombre == null ? "" : nombre;
                    ger.Descripcion = descripcion == null ? "" : descripcion;
                    
                    if (mg.actualizar(ger))
                    {
                        message = "Se actualizaron los datos correctamente";
                    }
                    else
                    {
                        message = "No se logró actualizar lo datos";
                    }

                    return Json(new { message = message, success = true });
                }
                else
                {
                    message = "Ingrese los datos necesarios";
                    return Json(new { message = message, success = false, datos = error });
                }
            }

            return RedirectToAction("Consultar_Gerencia");

        }

        public ActionResult Registrar_Gerencia()
        {
            List<Gerencia> ger;
            Metodo_Gerencia mg = new Metodo_Gerencia();
            Info dato = new Info();

            ger = mg.listar();
            dato.Ger = ger;


            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Gerencia(string nombre, string descripcion)
        {
            Gerencia ger = new Gerencia();
            Metodo_Gerencia mg = new Metodo_Gerencia();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Usuario");
            }

            if (String.IsNullOrEmpty(descripcion))
            {
                error.Add("sp_descripcion", "Ingrese su Descripción");
            }

            if (error.Count == 0)
            {
                ger.Nombre = nombre == null ? "" : nombre;
                ger.Descripcion = descripcion == null ? "" : descripcion;

                if (mg.guardar(ger))
                {
                    message = "Se guardaron los datos correctamente";
                }
                else
                {
                    message = "No se Guardaron lo datos";
                }

                return Json(new { message = message, success = true });
            }
            else
            {
                message = "Ingrese los datos necesarios";
                return Json(new { message = message, success = false, datos = error });
            }

        }
    }
}