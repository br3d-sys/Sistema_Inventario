using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class PersonalController : Controller
    {
        Personal v_per = new Personal();

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Personal()
        {
            List<Personal> per;
            Modelo_Personal mp = new Modelo_Personal();

            Info datos = new Info();
            per = mp.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Per = per;

            return View(datos);

        }
        //[HttpPost]
        //public ActionResult Consultar_Personal(string nombre, string dni)
        //{

        //    return View();
        //}

        public ActionResult eliminar(int id)
        {
            Modelo_Personal mp = new Modelo_Personal();
            if (mp.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Personal");

            //return View();
        }

        public ActionResult Modificar_Personal(int? id)
        {
            Modelo_Personal mp = new Modelo_Personal();

            if (id != null)
            {
                v_per = mp.obtener(id);

                Info datos = new Info();
                datos.Obj_per = v_per;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Personal");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Personal(int id, int id_area, string nombre, string cargo, string t_documento, string n_documento, int edad, string sexo, string est_civil, string celular, string direccion, string correo)
        {
            Modelo_Personal mp = new Modelo_Personal();
            Personal per = new Personal();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (id_area ==0)
                {
                    error.Add("sp_id_area", "Seleccione el area");
                }
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el nombre del Usuario");
                }
                if (String.IsNullOrEmpty(cargo))
                {
                    error.Add("sp_cargo", "Ingrese el Cargo");
                }
                if (String.IsNullOrEmpty(t_documento))
                {
                    error.Add("sp_t_documento", "Ingrese el tipo de documento");
                }
                if (String.IsNullOrEmpty(n_documento))
                {
                    error.Add("sp_n_documento", "Ingrese el N° del documento");
                }
                if (edad==0)
                {
                    error.Add("sp_edad", "Ingrese la edad del personal");
                }
                if (String.IsNullOrEmpty(sexo))
                {
                    error.Add("sp_sexo", "Seleccione el Sexo");
                }
                if (String.IsNullOrEmpty(est_civil))
                {
                    error.Add("sp_est_civil", "Seleccione su estado civil");
                }
                if (String.IsNullOrEmpty(correo))
                {
                    error.Add("sp_correo", "Ingrese el correo del personal");
                }
                if (String.IsNullOrEmpty(celular))
                {
                    error.Add("sp_correo", "Ingrese el correo del personal");
                }
                if (String.IsNullOrEmpty(direccion))
                {
                    error.Add("sp_direccion", "Ingrese la direccion del personal");
                }
                if (String.IsNullOrEmpty(cargo))
                {
                    error.Add("sp_celular", "Ingrese el Cargo");
                }

                if (error.Count == 0)
                {
                    per.Id_personal = id;
                    per.Id_area = id_area == 0 ? 0 : id_area; ;
                    per.Nombre = nombre == null ? "" : nombre;
                    per.Cargo = cargo == null ? "" : cargo;
                    per.T_documento = t_documento == null ? "" : t_documento;
                    per.N_documento = n_documento == null ? "" : n_documento;
                    per.Edad = edad == 0 ? 0 : edad;
                    per.Sexo = sexo == null ? "" : sexo;
                    per.Est_civil = est_civil == null ? "" : est_civil;
                    per.Correo = correo == null ? "" : correo;
                    per.Celular = celular == null ? "" : celular;
                    per.Direccion = direccion == null ? "" : direccion;
                    per.Cargo = cargo == null ? "" : cargo;

                    if (mp.actualizar(per))
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

            return RedirectToAction("Consultar_Personal");

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
            return View();
        }


        [HttpPost]
        public ActionResult Registrar_Personal(int id_area, string nombre, string cargo, string t_documento, string n_documento, int edad, string sexo, string est_civil, string celular, string direccion, string correo)
        {
            Personal per = new Personal();
            Modelo_Personal mp = new Modelo_Personal();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_area == 0)
            {
                error.Add("sp_id_area", "Seleccione el area");
            }
            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Usuario");
            }
            if (String.IsNullOrEmpty(cargo))
            {
                error.Add("sp_cargo", "Ingrese el Cargo");
            }
            if (String.IsNullOrEmpty(t_documento))
            {
                error.Add("sp_t_documento", "Ingrese el tipo de documento");
            }
            if (String.IsNullOrEmpty(n_documento))
            {
                error.Add("sp_n_documento", "Ingrese el N° del documento");
            }
            if (edad == 0)
            {
                error.Add("sp_edad", "Ingrese la edad del personal");
            }
            if (String.IsNullOrEmpty(sexo))
            {
                error.Add("sp_sexo", "Seleccione el Sexo");
            }
            if (String.IsNullOrEmpty(est_civil))
            {
                error.Add("sp_est_civil", "Seleccione su estado civil");
            }
            if (String.IsNullOrEmpty(correo))
            {
                error.Add("sp_correo", "Ingrese el correo del personal");
            }
            if (String.IsNullOrEmpty(celular))
            {
                error.Add("sp_correo", "Ingrese el correo del personal");
            }
            if (String.IsNullOrEmpty(direccion))
            {
                error.Add("sp_direccion", "Ingrese la direccion del personal");
            }
            if (String.IsNullOrEmpty(cargo))
            {
                error.Add("sp_celular", "Ingrese el Cargo");
            }

            if (error.Count == 0)
            {
                per.Id_area = id_area == 0 ? 0 : id_area; ;
                per.Nombre = nombre == null ? "" : nombre;
                per.Cargo = cargo == null ? "" : cargo;
                per.T_documento = t_documento == null ? "" : t_documento;
                per.N_documento = n_documento == null ? "" : n_documento;
                per.Edad = edad == 0 ? 0 : edad;
                per.Sexo = sexo == null ? "" : sexo;
                per.Est_civil = est_civil == null ? "" : est_civil;
                per.Correo = correo == null ? "" : correo;
                per.Celular = celular == null ? "" : celular;
                per.Direccion = direccion == null ? "" : direccion;
                per.Cargo = cargo == null ? "" : cargo;

                if (mp.guardar(per))
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