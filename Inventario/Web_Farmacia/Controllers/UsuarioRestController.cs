using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;

namespace Web_Farmacia.Controllers
{
    public class UsuarioRestController : ApiController
    {
        [HttpPost]
        public IHttpActionResult Post(FormDataCollection colleccion)
        {
            Metodo_Usuario mu = new Metodo_Usuario();
            Usuario usu;
            string message;

            usu = mu.validar(colleccion.Get("correo"), colleccion.Get("contrasena"));

            if (usu.Id_usuario != 0)
            {
                message = "Usuario y Contraseña Correctos";
                return Json(new { message = message, success = true });
            }
            else
            {
                message = "El usuario o contraseña son incorrectos";
                return Json(new { message = message, success = false });
            }
        }

    }
}
