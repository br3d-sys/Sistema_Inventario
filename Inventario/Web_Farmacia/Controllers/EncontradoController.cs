﻿using System;
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

            if (id != null)
            {
                v_enc = me.obtener(id);

                Info datos = new Info();
                datos.Obj_enc = v_enc;

                WebImage im =new WebImage(v_enc.Imagen);

                //using(MemoryStream ms = new MemoryStream())
                //{
                //    v_enc.Imagen.Save(ms, ImageFormat.Jpeg);
                //    ms.WriteTo(Response.OutputStream);
                //}

                

                return View(datos);
            }
            else
            {
                return RedirectToAction("Consultar_Encontrado");
            }

            //return View();
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

                    enc.Id_encontrado = id;
                    enc.Id_bienes = id_bienes == 0 ? 0 : id_bienes;
                    enc.Id_inventario = id_inventario == 0 ? 0 : id_inventario;
                    enc.Fecha = fecha == null ? DateTime.Now : fecha;
                    enc.Estado = estado == null ? "" : estado;
                    enc.Imagen = img == null ? null : img;

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
        public ActionResult Registrar_Encontrado(int id_bienes, int id_inventario, DateTime fecha, string estado, HttpPostedFileBase imagen)
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

            if (error.Count == 0)
            {

                Image img = cambiar_tamaño(imagen);

                enc.Id_bienes = id_bienes == 0 ? 0 : id_bienes;
                enc.Id_inventario = id_inventario == 0 ? 0 : id_inventario;
                enc.Fecha = fecha == null ? DateTime.Now : fecha;
                enc.Estado = estado == null ? "" : estado;
                enc.Imagen = img == null ? null : img;

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


    }
}