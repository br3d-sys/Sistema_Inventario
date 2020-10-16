using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class CategoriaController : Controller
    {
        Categoria v_cat;

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Categoria()
        {
            List<Categoria> cat;
            Modelo_Categoria mc = new Modelo_Categoria();

            Info datos = new Info();
            cat = mc.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Cat = cat;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Categoria(string nombre)
        {

            List<Categoria> cat;
            Modelo_Categoria mc = new Modelo_Categoria();

            Info datos = new Info();
            cat = mc.buscar(nombre);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Cat = cat;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Modelo_Categoria mc = new Modelo_Categoria();
            if (mc.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Categoria");

            //return View();
        }

        public ActionResult Modificar_Categoria(int? id)
        {
            Modelo_Categoria mc = new Modelo_Categoria();

            if (id != null)
            {
                v_cat = mc.obtener(id);

                Info datos = new Info();
                datos.Obj_cat = v_cat;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Categoria");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Categoria(int id, string nombre, string descripcion)
        {
            Modelo_Categoria mc = new Modelo_Categoria();
            Categoria cat = new Categoria();
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
                    error.Add("sp_descripcion", "Ingrese la Descripcion");
                }
                

                if (error.Count == 0)
                {
                    cat.Id_categoria = id;
                    cat.Nombre = nombre == null ? "" : nombre;
                    cat.Descripcion = descripcion == null ? "" : descripcion;
                   

                    if (mc.actualizar(cat))
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

            return RedirectToAction("Consultar_Categoria");

        }

        public ActionResult Registrar_Categoria()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Registrar_Categoria(string nombre, string descripcion)
        {
            Categoria cat = new Categoria();
            Modelo_Categoria mc = new Modelo_Categoria();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Usuario");
            }
            if (String.IsNullOrEmpty(descripcion))
            {
                error.Add("sp_descripcion", "Ingrese la Descripcion");
            }

            if (error.Count == 0)
            {
                cat.Nombre = nombre == null ? "" : nombre;
                cat.Descripcion = descripcion == null ? "" : descripcion;

                if (mc.guardar(cat))
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