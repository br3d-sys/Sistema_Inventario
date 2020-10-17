using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;
using System.Web.Script.Serialization;

namespace Web_Farmacia.Controllers
{
    public class UsuarioController : Controller
    {
        Usuario v_usu = new Usuario();
        
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Usuario()
        {
            List<Usuario> usu;
            Metodo_Usuario mu = new Metodo_Usuario();

            Info datos = new Info();
            usu = mu.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Usu = usu;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Usuario(string nombre, string n_documento)
        {

            List<Usuario> usu;
            Metodo_Usuario mu = new Metodo_Usuario();

            Info datos = new Info();
            usu = mu.buscar(nombre,n_documento);

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Usu = usu;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Metodo_Usuario mu = new Metodo_Usuario();
            if (mu.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Usuario");

            //return View();
        }

        public ActionResult Modificar_Usuario(int? id)
        {
            Metodo_Usuario mu = new Metodo_Usuario();

            if (id != null)
            {
                v_usu = mu.obtener(id);

                Info datos = new Info();
                datos.Obj_usu = v_usu;

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Usuario");
            }

            //return View();
        }
        [HttpPost]
        public ActionResult Modificar_Usuario(int id, string nombre, string password, string documento, string n_documento, string correo, string celular, string direccion, string cargo)
        {
            Metodo_Usuario mu = new Metodo_Usuario();
            Usuario usu = new Usuario();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (String.IsNullOrEmpty(nombre))
                {
                    error.Add("sp_nombre", "Ingrese el nombre del Usuario");
                }
                if (String.IsNullOrEmpty(password))
                {
                    error.Add("sp_password", "Ingrese el Password");
                }
                if (String.IsNullOrEmpty(documento))
                {
                    error.Add("sp_documento", "Selecciones el tipo de Documento");
                }
                if (String.IsNullOrEmpty(n_documento))
                {
                    error.Add("sp_n_documento", "Ingrese el N° del documento");
                }
                if (String.IsNullOrEmpty(correo))
                {
                    error.Add("sp_correo", "Ingrese el correo del usuario");
                }
                if (String.IsNullOrEmpty(direccion))
                {
                    error.Add("sp_direccion", "Ingrese la direccion del usuario");
                }
                if (String.IsNullOrEmpty(cargo))
                {
                    error.Add("sp_cargo", "Ingrese el cargo del usuario");
                }

                if (error.Count == 0)
                {
                    usu.Id_usuario = id;
                    usu.Nombre = nombre == null ? "" : nombre;
                    usu.Contrasena = password == null ? "" : password;
                    usu.Documento = documento == null ? "" : documento;
                    usu.N_documento = n_documento == null ? "" : n_documento;
                    usu.Correo = correo == null ? "" : correo;
                    usu.Celular = celular == null ? "" : celular;
                    usu.Direccion = direccion == null ? "" : direccion;
                    usu.Cargo = cargo == null ? "" : cargo;

                    if (mu.actualizar(usu))
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

            return RedirectToAction("Consultar_Usuario");

        }

        public ActionResult Registrar_Usuario()
        {
            List<Usuario> usu;
            Metodo_Usuario mu = new Metodo_Usuario();
            Info dato = new Info();

            usu = mu.listar();
            dato.Usu = usu;

             
            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Usuario(string nombre, string password, string documento, string n_documento, string correo, string celular, string direccion, string cargo)
        {
            Usuario usu = new Usuario();
            Metodo_Usuario mu = new Metodo_Usuario();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (String.IsNullOrEmpty(nombre))
            {
                error.Add("sp_nombre", "Ingrese el nombre del Usuario");
            }
            
            if (String.IsNullOrEmpty(password))
            {
                error.Add("sp_password", "Ingrese el Password");
            }
            if (String.IsNullOrEmpty(documento))
            {
                error.Add("sp_documento", "Selecciones el tipo de Documento");
            }
            if (String.IsNullOrEmpty(n_documento))
            {
                error.Add("sp_n_documento", "Ingrese el N° del documento");
            }
            if (String.IsNullOrEmpty(correo))
            {
                error.Add("sp_correo", "Ingrese el correo del usuario");
            }
            if (String.IsNullOrEmpty(direccion))
            {
                error.Add("sp_direccion", "Ingrese la direccion del usuario");
            }
            if (String.IsNullOrEmpty(celular))
            {
                error.Add("sp_celular", "Ingrese la direccion del usuario");
            }
            if (String.IsNullOrEmpty(cargo))
            {
                error.Add("sp_cargo", "Ingrese el correo del usuario");
            }

            if (error.Count == 0)
            {
                usu.Nombre = nombre == null ? "" : nombre;
                usu.Contrasena = password == null ? "" : password;
                usu.Documento = documento == null ? "" : documento;
                usu.N_documento = n_documento == null ? "" : n_documento;
                usu.Correo = correo == null ? "" : correo;
                usu.Celular = celular == null ? "" : celular;
                usu.Direccion = direccion == null ? "" : direccion;
                usu.Cargo = cargo == null ? "" : cargo;

                if (mu.guardar(usu))
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

        [HttpPost]
        public ActionResult Login_Usuario(string correo, string contrasena)
        {

            Metodo_Usuario mu = new Metodo_Usuario();
            Usuario usu;
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

                if (String.IsNullOrEmpty(correo))
                {
                    error.Add("sp_usuario", "Ingrese su Correo");
                }
                if (String.IsNullOrEmpty(contrasena))
                {
                    error.Add("sp_contrasena", "Ingrese su contrasena");
                }

            if (error.Count == 0)
            {

                usu = mu.validar(correo, contrasena);

                if (usu.Id_usuario !=0)
                {
                    message = "Se actualizaron los datos correctamente";
                    return Json(new { message = message, success = true });
                }
                else
                {
                    message = "El usuario o contraseña son incorrectos";
                    return Json(new { message = message, success = false });
                }

            }
            else
            {
                message = "Ingrese los datos necesarios";
                return Json(new { message = message, success = false, datos = error });
            }
            
        }
        public ActionResult Login_Usuario()
        {

            return View();
        }
        public ActionResult Menu_Principal()
        {

            return View();
        }
    }
}