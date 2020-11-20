using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text;
using System.Web.Http;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;


namespace Web_Farmacia.Controllers
{
    public class BienesRestController : ApiController
    {
        public IHttpActionResult Get(string id_gerencia, string id_area, string id_personal, string codigo)
        {
            List<Encontrado> enc;
            Modelo_Encontrado me = new Modelo_Encontrado();
            string idg = id_gerencia==null?"":id_gerencia;
            string ida = id_area == null ? "" : id_area;
            string idp = id_personal == null ? "" : id_personal;
            string cod = codigo == null ? "" : codigo;

            enc = me.buscar_rest(idg, ida, idp, cod);

            return Json(new { encontrado = enc });
        }

        public IHttpActionResult Post(FormDataCollection dataCollection)
        {


            int id_bien = Convert.ToInt32(dataCollection.Get("id_bien"));
            string estado = dataCollection.Get("estado"); 
            DateTime fecha = Convert.ToDateTime(dataCollection.Get("fecha"));
            string descripcion = dataCollection.Get("descripcion");
            string imagen = dataCollection.Get("imagen");
            imagen = imagen.Replace(" ", "+");
            //imagen = imagen.Replace("=", "");
            /*int mod4 = imagen.Length%4;
            if (mod4 != 0)
            {
                imagen += new string('=', 4 - mod4);
            }
            int cantidaddd = imagen.Length;*/
            
            Modelo_Inventario mi = new Modelo_Inventario();
            Modelo_Encontrado me = new Modelo_Encontrado();
            Inventario inv;
            Encontrado enc = new Encontrado();
            byte[] img_byte = Convert.FromBase64String(imagen);
            //byte[] img_byte = Encoding.ASCII.GetBytes(imagen);

            inv = mi.buscar_ultimo();
            enc.Estado = estado;
            enc.Fecha = fecha;
            enc.Detalle_estado = descripcion;
            enc.Imagen_byte = img_byte;
            enc.Id_inventario = inv.Id_inventario;
            enc.Inventario = inv.Nombre;
            enc.Id_bienes = id_bien;
            enc.T_documento = "";
            enc.N_documento = "";
            enc.Archivo = "";

            if (me.guardar(enc))
            {
                return Json(new { success = true, message="Se registró correctamente"});
            }
            else
            {
                return Json(new { success = false, message = "No se registró correctamente"});
            }

        }
    }
}
