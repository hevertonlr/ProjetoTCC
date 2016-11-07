using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using normal.Models;

namespace normal.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            
            //Select dos slides principais
            string queryslides = "select * from tb_banners where codigoCategoria = 1 limit 5";
            var bannersslides = normal.Models.Banners.SelectBanners(queryslides);
            ViewData["slides"] = bannersslides;

            //Select das noticias do campo de noticias
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.dataNoticia DESC limit 8";
            var noticias = normal.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;

            //Select dos videos para o campo de videos
            string queryvideos = "select * from tb_videos order by codigoVideo DESC limit 8";
            var videos = normal.Models.Videos.SelectVideos(queryvideos);
            ViewData["videos"] = videos;

            //Select das galerias para o campo de galerias
            string querygalerias = "select tb_galerias.*, tb_fotos.nomearquivoFoto from tb_galerias inner join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where codigoCategoria = 1 limit 8";
            var galerias = normal.Models.Galerias.SelectGalerias(querygalerias);
            ViewData["galerias"] = galerias;

            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;

             return View();
        }
        public ActionResult Galerias()
        {
            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;

            //Select das galerias para o campo de galerias
            string querygalerias = "select tb_galerias.*, tb_fotos.nomearquivoFoto from tb_galerias inner join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where codigoCategoria = 1";
            var galerias = normal.Models.Galerias.SelectGalerias(querygalerias);
            ViewData["galerias"] = galerias;

            return View();
        }
        public ActionResult VerGalerias(int id = 0)
        {
            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;
            
            string queryfotos = "select tb_fotos.* from tb_fotos where codigoGaleria = "+id;
            var fotos = normal.Models.Fotos.SelectFotos(queryfotos);
            ViewData["fotos"] = fotos;

            return View();
        }

        public ActionResult Noticias()
        {
            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;

            //Select das noticias do campo de noticias
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.dataNoticia DESC";
            var noticias = normal.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;


            return View();
        }

        public ActionResult VerNoticias(int id = 0)
        {
            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;

            //Select das noticias do campo de noticias
            string querynot = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto where tb_noticias.codigoNoticia = "+id;
            var noticias = normal.Models.Noticias.SelectNoticias(querynot);
            ViewData["noticias"] = noticias;

            return View();
        }

        public ActionResult Videos()
        {
            //Select dos banners de publicidade do campo 1
            string querypublic1 = "select * from tb_banners where codigoCategoria = 2 limit 5";
            var bannerspublic1 = normal.Models.Banners.SelectBanners(querypublic1);
            ViewData["public1"] = bannerspublic1;

            //Select dos banners de publicidade do campo 2
            string querypublic2 = "select * from tb_banners where codigoCategoria = 3 limit 5";
            var bannerspublic2 = normal.Models.Banners.SelectBanners(querypublic2);
            ViewData["public2"] = bannerspublic2;

            //Select das notícias mais vistas
            string querymaisvistas = "select tb_noticias.*, tb_fotos.nomearquivoFoto from tb_noticias inner join tb_galerias on tb_noticias.codigoGaleria = tb_galerias.codigoGaleria left join tb_fotos on tb_galerias.capaGaleria = tb_fotos.codigoFoto order by tb_noticias.visualizacoesNoticia DESC limit 5";
            var notmaisvistas = normal.Models.Noticias.SelectNoticias(querymaisvistas);
            ViewData["maisvistas"] = notmaisvistas;

            //Select dos videos para o campo de videos
            string queryvideos = "select * from tb_videos order by codigoVideo DESC";
            var videos = normal.Models.Videos.SelectVideos(queryvideos);
            ViewData["videos"] = videos;

            return View();
        }
    }
}
