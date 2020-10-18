using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class InventarioController : Controller
    {
        Inventario v_inv = new Inventario();

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Inventario()
        {
            List<Inventario> inv;
            Modelo_Inventario mi = new Modelo_Inventario();

            Info datos = new Info();
            inv = mi.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Inv = inv;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Inventario(DateTime fecha_ini, DateTime fecha_fin)
        {

            List<Inventario> inv;
            Modelo_Inventario mi = new Modelo_Inventario();

            Info datos = new Info();
            inv = mi.buscar(fecha_ini, fecha_fin);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Inv = inv;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Modelo_Inventario mi = new Modelo_Inventario();
            if (mi.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Inventario");

            //return View();
        }

        public ActionResult Modificar_Inventario(int? id)
        {
            Modelo_Inventario mi = new Modelo_Inventario();

            if (id != null)
            {
                v_inv = mi.obtener(id);

                Info datos = new Info();
                datos.Obj_inv = v_inv;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Inventario");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Inventario(int id, string nombre, DateTime fecha_ini, DateTime fecha_fin)
        {
            Modelo_Inventario mi = new Modelo_Inventario();
            Inventario inv = new Inventario();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el Nombre");
                }
                if (fecha_ini == null)
                {
                    error.Add("sp_fecha_ini", "Ingrese la Fecha Inicial");
                }
                if (fecha_fin == null)
                {
                    error.Add("sp_fecha_fin", "Ingrese la Fecha Final");
                }

                if (error.Count == 0)
                {
                    inv.Id_inventario = id;
                    inv.Nombre = nombre == null ? "" : nombre;
                    inv.Fecha_ini = fecha_ini == null ? DateTime.Now : fecha_ini;
                    inv.Fecha_fin = fecha_fin == null ? DateTime.Now : fecha_fin;
                    
                    if (mi.actualizar(inv))
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

            return RedirectToAction("Consultar_Inventario");

        }

        public ActionResult Registrar_Inventario()
        {
            List<Inventario> inv;
            Modelo_Inventario mi = new Modelo_Inventario();
            Info dato = new Info();

            inv = mi.listar();
            dato.Inv = inv;


            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Inventario(string nombre, DateTime fecha_ini, DateTime fecha_fin)
        {
            Inventario inv = new Inventario();
            Modelo_Inventario mi = new Modelo_Inventario();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Usuario");
            }

            if (fecha_ini == null)
            {
                error.Add("sp_fecha_ini", "Ingrese la Fecha Inicial");
            }
            if (fecha_fin == null)
            {
                error.Add("sp_fecha_fin", "Ingrese la Fecha Final");
            }
            
            if (error.Count == 0)
            {
                inv.Nombre = nombre == null ? "" : nombre;
                inv.Fecha_ini = fecha_ini == null ? DateTime.Now : fecha_ini;
                inv.Fecha_fin = fecha_fin == null ? DateTime.Now : fecha_fin;
               
                if (mi.guardar(inv))
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