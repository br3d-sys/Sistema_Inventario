using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class AreaController : Controller
    {
        Area v_are = new Area();

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Area()
        {
            List<Area> are;
            Modelo_Area ma = new Modelo_Area();

            Info datos = new Info();
            are = ma.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Are = are;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Area(string nombre, int id_gerencia)
        {

            List<Area> are;
            Modelo_Area ma = new Modelo_Area();

            Info datos = new Info();
            are = ma.buscar(nombre, id_gerencia);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Are = are;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Modelo_Area ma = new Modelo_Area();
            if (ma.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Area");

            //return View();
        }

        public ActionResult Modificar_Area(int? id)
        {
            Modelo_Area ma = new Modelo_Area();

            if (id != null)
            {
                v_are = ma.obtener(id);

                Info datos = new Info();
                datos.Obj_are = v_are;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Area");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Area(int id, int id_gerencia, string nombre, string ubicacion, string descripcion)
        {
            Modelo_Area ma = new Modelo_Area();
            Area are = new Area();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (id_gerencia == 0)
                {
                    error.Add("sp_id_gerencia", "Seleccione la Gerencia");
                }
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el Nombre de Area");
                }
                if (String.IsNullOrEmpty(ubicacion))
                {
                    error.Add("sp_ubicacion", "Ingrese su Ubicación");
                }
                if (String.IsNullOrEmpty(descripcion))
                {
                    error.Add("sp_descripcion", "Ingrese su Descripción");
                }

                if (error.Count == 0)
                {
                    are.Id_area = id;
                    are.Id_gerencia = id_gerencia == 0 ? 0 : id_gerencia;
                    are.Nombre = nombre == null ? "" : nombre;
                    are.Ubicacion = ubicacion == null ? "" : ubicacion;
                    are.Descripcion = descripcion == null ? "" : descripcion;
                   
                    if (ma.actualizar(are))
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

            return RedirectToAction("Consultar_Area");

        }

        public ActionResult Registrar_Area()
        {
            List<Area> are;
            Modelo_Area ma = new Modelo_Area();
            Info dato = new Info();

            are = ma.listar();
            dato.Are = are;


            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Area(int id_gerencia, string nombre, string ubicacion, string descripcion)
        {
            Area are = new Area();
            Modelo_Area ma = new Modelo_Area();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_gerencia == 0)
            {
                error.Add("sp_id_gerencia", "Seleccione la Gerencia");
            }

            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Area");
            }

            if (String.IsNullOrEmpty(ubicacion))
            {
                error.Add("sp_ubicacion", "Ingrese la Ubicación");
            }
            if (String.IsNullOrEmpty(descripcion))
            {
                error.Add("sp_descripcion", "Ingrese la Descripción");
            }
            
            if (error.Count == 0)
            {
                are.Id_gerencia = id_gerencia == 0 ? 0 : id_gerencia;
                are.Nombre = nombre == null ? "" : nombre;
                are.Ubicacion = ubicacion == null ? "" : ubicacion;
                are.Descripcion = descripcion == null ? "" : descripcion;
                
                if (ma.guardar(are))
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