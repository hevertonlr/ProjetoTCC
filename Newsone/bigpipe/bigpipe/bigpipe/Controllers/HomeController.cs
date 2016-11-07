using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bigpipe.Models;

namespace bigpipe.Views.Home
{
    [HandleError]
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Galerias() 
        {
            //Select das galerias para o campo de galerias
            string querygalerias = "select tb_galerias.*, tb_fotos.nomearquivoFoto from tb_galerias inner join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where codigoCategoria = 1";
            var galerias = bigpipe.Models.Galerias.SelectGalerias(querygalerias);
            ViewData["galerias"] = galerias;
            return View();
        }
        public ActionResult VerGalerias(int id = 0)
        {
            string queryfotos = "select tb_fotos.* from tb_fotos where codigoGaleria = " + id;
            var fotos = bigpipe.Models.Fotos.SelectFotos(queryfotos);
            ViewData["fotos"] = fotos;
            return View();
        }
        public ActionResult Noticias() 
        {
            //Select das noticias do campo de noticias
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.dataNoticia DESC";
            var noticias = bigpipe.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;
            return View();
        }
        public ActionResult VerNoticias(int id = 0) 
        {
            //Select das noticias do campo de noticias
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where tb_noticias.codigoNoticia = " + id;
            var noticias = bigpipe.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;
            return View();
        }

        public ActionResult Videos()
        {
            //Select dos videos para o campo de videos
            string queryvideos = "select * from tb_videos order by codigoVideo DESC";
            var videos = bigpipe.Models.Videos.SelectVideos(queryvideos);
            ViewData["videos"] = videos;
            return View();
        }
        public ActionResult topoPageLet()
        {
            return View("MasterPagelets/topoPagelet");
        }

        public ActionResult menuPageLet()
        {
            return View("MasterPagelets/menuPagelet");
        }

        public ActionResult rodapePageLet()
        {
            return View("MasterPagelets/rodapePagelet");
        }

        public ActionResult bannersPagelet()
        {
            string queryslides = "select * from tb_banners where codigoCategoria = 1 limit 5";
            var bannersslides = bigpipe.Models.Banners.SelectBanners(queryslides);
            ViewData["slides"] = bannersslides;
            return View("IndexPagelets/bannersPagelet");
        }

        public ActionResult noticiasPagelet()
        {
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.dataNoticia DESC limit 8";
            var noticias = bigpipe.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;
            return View("IndexPagelets/noticiasPagelet");
        }

        public ActionResult videosPagelet()
        {
            string queryvideos = "select * from tb_videos order by codigoVideo DESC limit 8";
            var videos = bigpipe.Models.Videos.SelectVideos(queryvideos);
            ViewData["videos"] = videos;
            return View("IndexPagelets/videosPagelet");
        }

        public ActionResult publicidade1Pagelet()
        {
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = bigpipe.Models.Banners.SelectBanners(querypublic1);

            ViewData["public1"] = bannerspublic1;
            return View("IndexPagelets/publicidade1Pagelet");
        }

        public ActionResult publicidade2Pagelet()
        {
            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = bigpipe.Models.Banners.SelectBanners(querypublic2);

            ViewData["public2"] = bannerspublic2;
            return View("IndexPagelets/publicidade2Pagelet");
        }

        public ActionResult previsaoPagelet()
        {
            return View("IndexPagelets/previsaoPagelet");
        }

        public ActionResult mercadoPagelet()
        {
            return View("IndexPagelets/mercadoPagelet");
        }

        public ActionResult galeriasPagelet()
        {
            string querygalerias = "select tb_galerias.*, tb_fotos.nomearquivoFoto from tb_galerias inner join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where codigoCategoria = 1 limit 8";
            var galerias = bigpipe.Models.Galerias.SelectGalerias(querygalerias);
            
            ViewData["galerias"] = galerias;
            return View("IndexPagelets/galeriasPagelet");
        }

        public ActionResult maislidasPagelet()
        {
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = bigpipe.Models.Noticias.SelectNoticias(querymaisvistas);

            ViewData["maisvistas"] = notmaisvistas;
            return View("IndexPagelets/maislidasPagelet");
        }

        /*
        public ActionResult PageLet1()
        {
            //System.Threading.Thread.Sleep(new Random().Next(3000, 10000));
            return View("Pagelets/Pagelet1");
        }*/

        
    }
}
