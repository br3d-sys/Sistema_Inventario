using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Web_Farmacia.Clases;
using Web_Farmacia.Models;


namespace Web_Farmacia.Controllers
{
    public class EncontradoController : Controller
    {
        Encontrado v_enc = new Encontrado();
        byte[] arr;
        int id;
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Consultar_Encontrado()
        {
            List<Encontrado> enc;
            Modelo_Encontrado me = new Modelo_Encontrado();

            Info datos = new Info();
            enc = me.listar();

            ViewBag.eliminar = TempData["Eliminar"];

            datos.Enc = enc;

            return View(datos);

            //return View();
        }
        [HttpPost]
        public ActionResult Consultar_Encontrado(string nombre, string codigo, DateTime fecha, int id_inventario)
        {

            List<Encontrado> enc;
            Modelo_Encontrado me = new Modelo_Encontrado();

            Info datos = new Info();
            //enc = me.buscar(nombre,codigo,fecha,id_inventario);

            //ViewBag.eliminar = TempData["Eliminar"];

            //datos.Enc = enc;

            return View(datos);
        }

        public ActionResult eliminar(int id)
        {
            Modelo_Encontrado me = new Modelo_Encontrado();
            if (me.eliminar(id))
            {
                TempData["Eliminar"] = "Se eliminó Correctamente el Registro";
            }
            else
            {
                TempData["Eliminar"] = "No se eliminó Correctamente el Registro";
            }

            return RedirectToAction("Consultar_Encontrado");

            //return View();
        }

        public ActionResult Ver_Encontrado(int? id)
        {
            
            Modelo_Encontrado me = new Modelo_Encontrado();
            Modelo_Bienes mb = new Modelo_Bienes();
            Bienes bie;

            if (id != null)
            {



                v_enc = me.obtener(id);
                bie = mb.obtener(v_enc.Id_bienes);
                Info datos = new Info();
                datos.Obj_enc = v_enc;
                datos.Obj_bie = bie;
                ////arr = v_enc.arr_byte;
                //Image imagen;

                //MemoryStream ms = new MemoryStream(v_enc.arr_byte);

                //    imagen = Image.FromStream(ms);

                //ms = new MemoryStream();
                //imagen.Save(ms, ImageFormat.Jpeg);
                //ms.Position = 0;


                //return File(ms,"image/jpg");

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Encontrado");
            }

        }
        [HttpPost]
        public ActionResult Modificar_Encontrado(int id, int id_bienes, int id_inventario, DateTime fecha, string estado, HttpPostedFileBase imagen)
        {
            Modelo_Encontrado me = new Modelo_Encontrado();
            Encontrado enc = new Encontrado();
            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id != 0)
            {
                if (id_bienes == 0)
                {
                    error.Add("sp_id_bienes", "Seleccione el Bien");
                }
                if (id_inventario == 0)
                {
                    error.Add("sp_id_inventario", "Seleccione el inventario");
                }
                if (fecha == null)
                {
                    error.Add("sp_fecha", "Selecciones la fecha");
                }
                if (String.IsNullOrEmpty(estado))
                {
                    error.Add("sp_estado", "Seleccione el Estado");
                }
                if (imagen == null)
                {
                    error.Add("sp_imagen", "Seleccione una imagen");
                }

                if (error.Count == 0)
                {

                    Image img = cambiar_tamaño(imagen);

                    using(MemoryStream ms = new MemoryStream())
                    {

                        img.Save(ms, ImageFormat.Jpeg);
                        byte[] arr = Convert.FromBase64String(ms.ToArray().ToString());

                    enc.Id_encontrado = id;
                    enc.Id_bienes = id_bienes == 0 ? 0 : id_bienes;
                    enc.Id_inventario = id_inventario == 0 ? 0 : id_inventario;
                    enc.Fecha = fecha == null ? DateTime.Now : fecha;
                    enc.Estado = estado == null ? "" : estado;
                    enc.Imagen_byte = arr == null ? null : arr;
                    }

                    

                    if (me.actualizar(enc))
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

            return RedirectToAction("Consultar_Encontrado");

        }

        public ActionResult Registrar_Encontrado()
        {
            List<Inventario> inv;
            Modelo_Inventario mi = new Modelo_Inventario();
            Info dato = new Info();

            inv = mi.listar();
            dato.Inv = inv;

            return View(dato);
        }

        [HttpPost]
        public ActionResult Registrar_Encontrado(int id_bienes, int id_inventario, DateTime? fecha, string estado, string detalle_estado,
            HttpPostedFileBase imagen, string tipo_documento, string num_documento, HttpPostedFileBase adj_doc)
        {
            Encontrado enc = new Encontrado();
            Modelo_Encontrado me = new Modelo_Encontrado();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_bienes == 0)
            {
                error.Add("sp_id_bienes", "Seleccione el Bien");
            }

            if (id_inventario == 0)
            {
                error.Add("sp_id_inventario", "Seleccione el inventario");
            }
            if (fecha == null)
            {
                error.Add("sp_fecha", "Seleccione la Fecha");
            }
            if (String.IsNullOrEmpty(estado))
            {
                error.Add("sp_estado", "Seleccione el Estado");
            }
            if (imagen == null)
            {
                error.Add("sp_imagen", "Seleccione la Imagen del Bien");
            }
            if (String.IsNullOrEmpty(detalle_estado))
            {
                error.Add("sp_mod_descripcion", "Describa el estado de bien");
            }
            if (String.IsNullOrEmpty(tipo_documento))
            {
                error.Add("sp_tipo_documento", "Seleccione el Tipo de documento");
            }
            if (String.IsNullOrEmpty(num_documento))
            {
                error.Add("sp_num_documento", "Ingrese el numero del documento");
            }

            if (error.Count == 0)
            {

                Image img = cambiar_tamaño(imagen);

                using (MemoryStream ms = new MemoryStream())
                {
                    img.Save(ms, ImageFormat.Jpeg);
                    byte[] img_byte = ms.ToArray();
                    string im = Convert.ToBase64String(img_byte);

                    enc.Id_bienes = id_bienes == 0 ? 0 : id_bienes;
                    enc.Id_inventario = id_inventario == 0 ? 0 : id_inventario;
                    enc.Fecha = fecha == null ? DateTime.Now : fecha.Value;
                    enc.Estado = estado == null ? "" : estado;
                    enc.Detalle_estado = detalle_estado == null ? "" : detalle_estado;
                    enc.T_documento = tipo_documento == null ? "" : tipo_documento;
                    enc.N_documento = im;
                    enc.Archivo = adj_doc == null ? "" : adj_doc.FileName;
                    enc.Imagen_byte = img_byte == null ? null : img_byte;

                }

                if (me.guardar(enc))
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
        public ActionResult Registrar_Encontrado_Baja(int id_bien, int id_inventario, DateTime ? mod_fecha, string mod_estado,string mod_descripcion,
            HttpPostedFileBase mod_imagen,  string tipo_documento,string num_documento, HttpPostedFileBase adj_doc)
        {
            Encontrado enc = new Encontrado();
            Modelo_Encontrado me = new Modelo_Encontrado();

            string message;
            SortedList<string, string> error = new SortedList<string, string>();

            if (id_bien == 0)
            {
                error.Add("sp_id_bien", "Seleccione el Bien");
            }

            if (id_inventario == 0)
            {
                error.Add("sp_id_inventario", "Seleccione el inventario");
            }
            if (mod_fecha == null)
            {
                error.Add("sp_mod_fecha", "Seleccione la Fecha");
            }
            if (String.IsNullOrEmpty(mod_estado))
            {
                error.Add("sp_mod_estado", "Seleccione el Estado");
            }
            if (String.IsNullOrEmpty(mod_descripcion))
            {
                error.Add("sp_mod_descripcion", "Describa el estado de bien");
            }
            if (mod_imagen == null)
            {
                error.Add("sp_mod_imagen", "Ingrese una fotografia actual del bien");
            }
            if (String.IsNullOrEmpty(tipo_documento))
            {
                error.Add("sp_tipo_documento", "Seleccione el Tipo de documento");
            }
            if (String.IsNullOrEmpty(num_documento))
            {
                error.Add("sp_num_documento", "Ingrese el numero del documento");
            }

            if (error.Count == 0)
            {

                Image img = cambiar_tamaño(mod_imagen);

                using (MemoryStream ms = new MemoryStream())
                {
                    img.Save(ms, ImageFormat.Jpeg);
                    byte[] img_byte = ms.ToArray();
                    string im = Convert.ToBase64String(img_byte);

                    enc.Id_bienes = id_bien == 0 ? 0 : id_bien;
                    enc.Id_inventario = id_inventario == 0 ? 0 : id_inventario;
                    enc.Fecha = mod_fecha == null ? DateTime.Now : mod_fecha.Value;
                    enc.Estado = mod_estado == null ? "" : mod_estado;
                    enc.Detalle_estado = mod_descripcion == null ? "" : mod_descripcion;
                    enc.T_documento = tipo_documento == null ? "" : tipo_documento;
                    enc.N_documento = num_documento == null ? "" : num_documento;
                    enc.Archivo = adj_doc == null ? "": adj_doc.FileName;
                    enc.Imagen_byte = img_byte == null ? null : img_byte;

                }

                if (me.guardar(enc))
                {
                    guardar_archivo(adj_doc);
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
        public ActionResult Consultar_Bienes()
        {

            Modelo_Bienes mb = new Modelo_Bienes();
            List<Bienes> bie = new List<Bienes>();

            bie = mb.listar();

            if(bie == null)
            {
                return Json(new {message="Error al tratar de consultar los bienes",success = false,datos = bie });
            }
            else
            {
                return Json(new { message = "Se consiguió hacer la consulta",success = true, datos = bie });
            }
        }

        private System.Drawing.Image cambiar_tamaño(HttpPostedFileBase imag)
        {
            Image img = Image.FromStream(imag.InputStream);

            const int tmax = 200;

            int h = img.Height;
            int w = img.Width;

            int newH, newW;

            if (h > w & h > tmax)
            {
                newH = tmax;
                newW = (w * tmax) / h;
            }
            if (w > h & w > tmax)
            {
                newW = tmax;
                newH = (h * tmax) / w;
            }
            else
            {
                newH = h;
                newW = w;
            }

            if (h != newH | w != newW)
            {
                Bitmap newImg = new Bitmap(img, newW, newH);
                Graphics graf = Graphics.FromImage(newImg);
                graf.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBilinear;
                graf.DrawImage(img, 0, 0, newImg.Width, newImg.Height);

                return newImg;

            }
            else
            {
                return img;
            }
        }

        public ActionResult ver_imagen(int id)
        {
            Modelo_Encontrado me = new Modelo_Encontrado();
            Encontrado enc;

            enc = me.obtener(id);

            arr = enc.Imagen_byte;

            Image imagen;
            MemoryStream ms = new MemoryStream(arr);
            imagen = Image.FromStream(ms);

            ms = new MemoryStream();
            imagen.Save(ms, ImageFormat.Jpeg);
            ms.Position = 0;

            return File(ms,"image/jpg");
        }

        private bool guardar_archivo(HttpPostedFileBase file)
        {
            string ruta = Server.MapPath("~/Content/Imagenes");

            string archivo = String.Format("{0}\\{1}", ruta, file.FileName);

            if (System.IO.File.Exists(archivo))
            {
                return false;
            }
            else
            {
                return true;
            }

        }

    }
}