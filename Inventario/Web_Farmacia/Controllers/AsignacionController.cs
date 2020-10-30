using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class AsignacionController : Controller
    {
        Asignacion v_asi = new Asignacion();

        // GET: Asignacion
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Asignacion()
        {
            List<Area> are;
            List<Gerencia> ger;
            Modelo_Area ma = new Modelo_Area();
            Metodo_Gerencia mg = new Metodo_Gerencia();
            List<Asignacion> asi;
            Modelo_Asignacion masi = new Modelo_Asignacion();

            Info datos = new Info();
            are = ma.listar();
            ger = mg.listar();
            asi = masi.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Are = are;
            datos.Ger = ger;
            datos.Asi = asi;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Asignacion(string personal, int id_area)
        {

            List<Asignacion> asi;
            Modelo_Asignacion ma = new Modelo_Asignacion();

            Info datos = new Info();
            asi = ma.buscar(personal, id_area);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Asi = asi;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Modelo_Asignacion ma = new Modelo_Asignacion();
            if (ma.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Asignacion");

            //return View();
        }

        public ActionResult Ver_Asignacion(int? id)
        {
            Modelo_Asignacion ma = new Modelo_Asignacion();
            Modelo_Bienes mb = new Modelo_Bienes();
            Bienes bie;
            Modelo_Personal mp = new Modelo_Personal();
            Personal per;

            if (id != null)
            {
                v_asi = ma.obtener(id);
                bie = mb.obtener(v_asi.Id_bienes);
                per = mp.obtener(v_asi.Id_personal);

                Info datos = new Info();
                datos.Obj_asi = v_asi;
                datos.Obj_bie = bie;
                datos.Obj_per = per;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Asignacion");
            }

            //return View();
        }

        //[HttpPost]
        //public ActionResult Modificar_Asignacion(int id, string nombre, string password, string documento, string n_documento, string correo, string celular, string direccion, string cargo)
        //{
        //    Metodo_Usuario mu = new Metodo_Usuario();
        //    Usuario usu = new Usuario();
        //    string message;
        //    SortedList<string, string> error = new SortedList<string, string>();

        //    if (id != 0)
        //    {
        //        if (String.IsNullOrEmpty(nombre))
        //        {
        //            error.Add("sp_nombre", "Ingrese el nombre del Usuario");
        //        }
        //        if (String.IsNullOrEmpty(password))
        //        {
        //            error.Add("sp_password", "Ingrese el Password");
        //        }
        //        if (String.IsNullOrEmpty(documento))
        //        {
        //            error.Add("sp_documento", "Selecciones el tipo de Documento");
        //        }
        //        if (String.IsNullOrEmpty(n_documento))
        //        {
        //            error.Add("sp_n_documento", "Ingrese el N° del documento");
        //        }
        //        if (String.IsNullOrEmpty(correo))
        //        {
        //            error.Add("sp_correo", "Ingrese el correo del usuario");
        //        }
        //        if (String.IsNullOrEmpty(direccion))
        //        {
        //            error.Add("sp_direccion", "Ingrese la direccion del usuario");
        //        }
        //        if (String.IsNullOrEmpty(cargo))
        //        {
        //            error.Add("sp_cargo", "Ingrese el cargo del usuario");
        //        }

        //        if (error.Count == 0)
        //        {
        //            usu.Id_usuario = id;
        //            usu.Nombre = nombre == null ? "" : nombre;
        //            usu.Contrasena = password == null ? "" : password;
        //            usu.Documento = documento == null ? "" : documento;
        //            usu.N_documento = n_documento == null ? "" : n_documento;
        //            usu.Correo = correo == null ? "" : correo;
        //            usu.Celular = celular == null ? "" : celular;
        //            usu.Direccion = direccion == null ? "" : direccion;
        //            usu.Cargo = cargo == null ? "" : cargo;

        //            if (mu.actualizar(usu))
        //            {
        //                message = "Se actualizaron los datos correctamente";
        //            }
        //            else
        //            {
        //                message = "No se logró actualizar lo datos";
        //            }

        //            return Json(new { message = message, success = true });
        //        }
        //        else
        //        {
        //            message = "Ingrese los datos necesarios";
        //            return Json(new { message = message, success = false, datos = error });
        //        }
        //    }

        //    return RedirectToAction("Consultar_Asignacion");

        //}

        public ActionResult Registrar_Asignacion()
        {
            List<Gerencia> ger;
            List<Area> are;
            List<Personal> per;
            List<Bienes> bie;
            Metodo_Gerencia mg = new Metodo_Gerencia();
            Modelo_Area ma = new Modelo_Area();
            Modelo_Personal mp = new Modelo_Personal();
            Modelo_Bienes mb = new Modelo_Bienes();
            Info dato = new Info();

            ger = mg.listar();
            are = ma.listar();
            per = mp.listar();
            bie = mb.listar();

            dato.Ger = ger;
            dato.Are = are;
            dato.Per = per;
            dato.Bie = bie;

            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Asignacion(int id_usuario, int id_encontrado, int id_personal, int id_area, DateTime fecha)
        {
            Asignacion asi = new Asignacion();
            Modelo_Asignacion ma = new Modelo_Asignacion();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_usuario == 0)
            {
                error.Add("sp_id_usuario", "Seleccione el Usuario");
            }

            if (id_encontrado == 0)
            {
                error.Add("sp_id_encontrado", "Seleccione el Bien");
            }
            if (id_personal == 0)
            {
                error.Add("sp_id_personal", "Seleccione el Personal");
            }
            if (id_area == 0)
            {
                error.Add("sp_id_area", "Seleccione el Area");
            }
            if (fecha == null)
            {
                error.Add("sp_fecha", "Seleccione la Fecha");
            }

            if (error.Count == 0)
            {
                asi.Id_usuario = id_usuario == 0 ? 0 : id_usuario;
                asi.Id_encontrado = id_encontrado == 0 ? 0 : id_encontrado;
                asi.Id_personal = id_personal == 0 ? 0 : id_personal;
                asi.Id_area = id_area == 0 ? 0 : id_area;
                asi.Fecha_asig = fecha == null ? DateTime.Now : fecha;

                if (ma.guardar(asi))
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

        public ActionResult Consultar_Encontrado()
        {
            Modelo_Encontrado me = new Modelo_Encontrado();
            List<Encontrado> enc = new List<Encontrado>();

            enc = me.listar();

            if (enc == null)
            {
                return Json(new { message = "Error al tratar de consultar los bienes", success = false, datos = enc });
            }
            else
            {
                return Json(new { message = "Se consiguió hacer la consulta", success = true, datos = enc });
            }
        }

        public ActionResult Consultar_Personal()
        {
            Modelo_Personal mp = new Modelo_Personal();
            List<Personal> per = new List<Personal>();

            per = mp.listar();

            if (per == null)
            {
                return Json(new { message = "Error al tratar de consultar el personal", success = false, datos = per });
            }
            else
            {
                return Json(new { message = "Se consiguió hacer la consulta", success = true, datos = per });
            }
        }

    }
}