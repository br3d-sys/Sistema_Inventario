using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class BienController : Controller
    {
        Bienes v_bie = new Bienes();

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Bien()
        {
            List<Bienes> bie;
            Modelo_Bienes mb = new Modelo_Bienes();

            Info datos = new Info();
            bie = mb.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Bie = bie;

            return View(datos);

        }
        //[HttpPost]
        //public ActionResult Consultar_Personal(string nombre, string dni)
        //{

        //    return View();
        //}

        public ActionResult eliminar(int id)
        {
            Modelo_Bienes mb = new Modelo_Bienes();
            if (mb.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Bien");

            //return View();
        }

        public ActionResult Modificar_Bien(int? id)
        {
            Modelo_Bienes mb = new Modelo_Bienes();

            if (id != null)
            {
                v_bie = mb.obtener(id);

                Info datos = new Info();
                datos.Obj_bie = v_bie;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Bien");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Bien(int id, int id_categoria, string nombre, string descripcion, string codigo, double precio, string estado, DateTime fecha_ing, string marca, string color, string modelo, string alto, string ancho, string profundidad)
        {
            Modelo_Bienes mb = new Modelo_Bienes();
            Bienes bie = new Bienes();
            string message;
            string imagen="";
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (id_categoria == 0)
                {
                    error.Add("sp_id_categoria", "Seleccione la categoria");
                }
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el nombre");
                }
                if (String.IsNullOrEmpty(descripcion))
                {
                    error.Add("sp_descripcion", "Ingrese su descripción");
                }
                if (String.IsNullOrEmpty(codigo))
                {
                    error.Add("sp_codigo", "Ingrese el Codigo del bien");
                }
                if (precio==0)
                {
                    error.Add("sp_precio", "Ingrese el Valor del bien");
                }
                if (String.IsNullOrEmpty(estado))
                {
                    error.Add("sp_estado", "Ingrese el estado del bien");
                }
                if (fecha_ing == null)
                {
                    error.Add("sp_fecha_ing", "Ingrese la fecha");
                }
                if (String.IsNullOrEmpty(marca))
                {
                    error.Add("sp_marca", "Ingrese la Marca");
                }
                if (String.IsNullOrEmpty(color))
                {
                    error.Add("sp_color", "Ingrese el color del bien");
                }
                if (String.IsNullOrEmpty(modelo))
                {
                    error.Add("sp_modelo", "Ingrese el modelo");
                }
                if (String.IsNullOrEmpty(alto))
                {
                    error.Add("sp_alto", "Ingrese el alto");
                }
                if (String.IsNullOrEmpty(ancho))
                {
                    error.Add("sp_anchor", "Ingrese el ancho");
                }
                if (String.IsNullOrEmpty(profundidad))
                {
                    error.Add("sp_profundidad", "Ingrese la Profundidad");
                }

                if (error.Count == 0)
                {
                    bie.Id_bienes = id;
                    bie.Id_categoria = id_categoria == 0 ? 0 : id_categoria; ;
                    bie.Nombre = nombre == null ? "" : nombre;
                    bie.Descripcion = descripcion == null ? "" : descripcion;
                    bie.Codigo = codigo == null ? "" : codigo;
                    bie.Precio = precio == 0 ? 0 : precio;
                    bie.Estado = estado == null ? "" : estado;
                    bie.Fecha_ing = fecha_ing == null ? DateTime.Now : fecha_ing;
                    bie.Marca = marca == null ? "" : marca;
                    bie.Color = color == null ? "" : color;
                    bie.Modelo = modelo == null ? "" : modelo;
                    bie.Alto = alto == null ? "" : alto;
                    bie.Ancho = ancho == null ? "" : ancho;
                    bie.Profundidad = profundidad == null ? "" : profundidad;
                    bie.Imagen = imagen == null ? "" : imagen;

                    if (mb.actualizar(bie))
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

            return RedirectToAction("Consultar_Bien");

        }

        public ActionResult Registrar_Bien()
        {

            return View();
        }
<<<<<<< HEAD
        public ActionResult Consultar_Bien()
        {
            return View();
        }
        public ActionResult Modificar_Bien()
        {
            return View();
=======

        [HttpPost]
        public ActionResult Registrar_Bien(int id_categoria, string nombre, string descripcion, string codigo, double precio, string estado, DateTime fecha_ing, string marca, string color, string modelo, string alto, string ancho, string profundidad)
        {
            Bienes bie = new Bienes();
            Modelo_Bienes mb = new Modelo_Bienes();

            string message;
            string imagen = "";
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_categoria == 0)
            {
                error.Add("sp_id_categoria", "Seleccione la categoria");
            }
            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre");
            }
            if (String.IsNullOrEmpty(descripcion))
            {
                error.Add("sp_descripcion", "Ingrese su descripción");
            }
            if (String.IsNullOrEmpty(codigo))
            {
                error.Add("sp_codigo", "Ingrese el Codigo del bien");
            }
            if (precio == 0)
            {
                error.Add("sp_precio", "Ingrese el Valor del bien");
            }
            if (String.IsNullOrEmpty(estado))
            {
                error.Add("sp_estado", "Ingrese el estado del bien");
            }
            if (fecha_ing==null)
            {
                error.Add("sp_fecha_ing", "Ingrese la fecha");
            }
            if (String.IsNullOrEmpty(marca))
            {
                error.Add("sp_marca", "Ingrese la Marca");
            }
            if (String.IsNullOrEmpty(color))
            {
                error.Add("sp_color", "Ingrese el color del bien");
            }
            if (String.IsNullOrEmpty(modelo))
            {
                error.Add("sp_modelo", "Ingrese el modelo");
            }
            if (String.IsNullOrEmpty(alto))
            {
                error.Add("sp_alto", "Ingrese el alto");
            }
            if (String.IsNullOrEmpty(ancho))
            {
                error.Add("sp_anchor", "Ingrese el ancho");
            }
            if (String.IsNullOrEmpty(profundidad))
            {
                error.Add("sp_profundidad", "Ingrese la Profundidad");
            }

            if (error.Count == 0)
            {
                bie.Id_categoria = id_categoria == 0 ? 0 : id_categoria; ;
                bie.Nombre = nombre == null ? "" : nombre;
                bie.Descripcion = descripcion == null ? "" : descripcion;
                bie.Codigo = codigo == null ? "" : codigo;
                bie.Precio = precio == 0 ? 0 : precio;
                bie.Estado = estado == null ? "" : estado;
                bie.Fecha_ing = fecha_ing == null ? DateTime.Now : fecha_ing;
                bie.Marca = marca == null ? "" : marca;
                bie.Color = color == null ? "" : color;
                bie.Modelo = modelo == null ? "" : modelo;
                bie.Alto = alto == null ? "" : alto;
                bie.Ancho = ancho == null ? "" : ancho;
                bie.Profundidad = profundidad == null ? "" : profundidad;
                bie.Imagen = imagen == null ? "" : imagen;

                if (mb.guardar(bie))
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

>>>>>>> master
        }
    }
}