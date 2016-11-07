<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="<%=Url.Content("~/Content/index.css") %>" rel="stylesheet" />
    <link href="<%=Url.Content("~/Content/Bibliotecas/Flexslider/indgaleria.css") %>" rel="stylesheet" />
    <link href="<%=Url.Content("~/Content/Bibliotecas/CustomScrollbar/jquery.mCustomScrollbar.css") %>" rel="stylesheet" />
    
    

    <script type="text/javascript">
        /*UTILS*/
        function vddescricao(titulo, descricao) {
            $('#vdtitulo').html(titulo);
            $('#vdresumo').html(cortaString(descricao, 130));
        }
        function diamesanovd(vddate) {
            //vddia vdmes vdano
            meses = new Array("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez");
            //vddate = "02 10 2013";
            var vddata = parseIt(vddate);
            if (typeof (vddata) != "undefined") {
                var dia = vddata.getDate();
                var mes = vddata.getMonth();
                if (dia < 10) { dia = '0' + dia }
                var ano = vddata.getFullYear();
                $('#vddia').html(dia);
                $('#vdmes').html(meses[mes]);
                $('#vdano').html(ano);
            }
        }
        function parseIt(str) {
            var months = {
                "jan": 0,
                "fev": 1,
                "mar": 2,
                "abr": 3,
                "mai": 4,
                "jun": 5,
                "jul": 6,
                "ago": 7,
                "set": 8,
                "out": 9,
                "nov": 10,
                "dez": 11
            };
            var parts = /^\s*(\d+)\s+([A-Za-z]+)\s+(\d+)\s*$/.exec(str);
            var dt;
            if (parts) {
                parts[2] = months[parts[2].toLowerCase()];
                if (typeof parts[2] !== "undefined") {
                    dt = new Date(parseInt(parts[3], 10),
                                  parts[2],
                                  parseInt(parts[1], 10));
                }
            }
            return dt;
        }
        
        function cortaString(str, size) {
            if (str == undefined || str == 'undefined' || str == '' || size == undefined || size == 'undefined' || size == '') {
                return str;
            }

            var shortText = str;
            if (str.length >= size + 3) {
                shortText = str.substring(0, size).concat('...');
            }
            return shortText;
        }
    </script>
    
    <!--YOUTUBE-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Youtube/youtube.js") %>"></script>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="firstitembody" runat="server">
   <div id="fb-root"></div>
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Facebook/facebook.js") %>"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="contentLeft" runat="server">

<% HttpRequest req = HttpContext.Current.Request; %>
    

    <!--BANNERS-->
    <div class="notDestaques tr">
        <% Html.RegisterPagelet(
        new Pagelet("wowslider-container1", null,
		    () => Html.RenderActionToString(req, "home", "bannersPagelet"),
        new []{ Url.Content("~/Content/Bibliotecas/WowSlider/style.css")},
        new []{ Url.Content("~/Scripts/WowSlider/wowslider.js"), 
                Url.Content("~/Scripts/WowSlider/script.js")}
        )); %>
    </div>

    <!--MAIS NOTICIAS-->
    <% Html.RegisterPagelet(
        new Pagelet("maisNoticias","class=\"maisNoticias tr\" align=\"center\"",
		    () => Html.RenderActionToString(req, "home", "noticiasPagelet")
        )); %>
    
 
    <!--VIDEOS-->
    <% Html.RegisterPagelet(
        new Pagelet("indVideos", "class=\"indVideos tr\"",
		    () => Html.RenderActionToString(req, "home", "videosPagelet")
        )); %>

    

    <!--GALERIAS-->
    <% Html.RegisterPagelet(
        new Pagelet("indGalerias", "class=\"indGalerias tr\"",
		    () => Html.RenderActionToString(req, "home", "galeriasPagelet")
        )); %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentRight" runat="server">
    <% HttpRequest req = HttpContext.Current.Request; %>
   
    <!--BANNERS 1-->
    <% Html.RegisterPagelet(
        new Pagelet("publ1", "class=\"publ1 tr\"",
		    () => Html.RenderActionToString(req, "home", "publicidade1Pagelet")
        )); %>
    <!--NOTICIAS MAIS LIDAS-->
    <% Html.RegisterPagelet(
        new Pagelet("maisLidas", "class=\"maisLidas tr\"",
		    () => Html.RenderActionToString(req, "home", "maislidasPagelet")
        )); %>
    <!--PREVISAO DO TEMPO-->
    <% Html.RegisterPagelet(
        new Pagelet("previsaoTempo", "class=\"previsaoTempo tr\"",
            () => Html.RenderActionToString(req, "home", "previsaoPagelet"),
        null,
        new[] { Url.Content("~/Scripts/Previsao/geoloc_prev.js")}
        )); %>

    
    <!--BANNERS 2-->
    <% Html.RegisterPagelet(
        new Pagelet("publ2", "class=\"publ2 tr\"",
		    () => Html.RenderActionToString(req, "home", "publicidade2Pagelet")
        )); %>
    
    <!--MERCADO FINACEIRO-->
    <% Html.RegisterPagelet(
        new Pagelet("mercFinanc", "class=\"mercFinanc tr\"",
            () => Html.RenderActionToString(req, "home", "mercadoPagelet"),
        null,
        new[]{ Url.Content("~/Scripts/Mercado/mercado.js")}
        )); %>
    
    <!--FACEBOOK-->
    <div class="facebook tr">
        <div class="labelsInd tr">
            <div class="icoface td"><span></span></div>
            <div class="txtlb td">Facebook</div>
            <div class="clearfix"></div>
        </div>
        <div class="tr">
            <fb:like-box href="https://www.facebook.com/newsonebr" width="298" height="238" show_faces="true" header="false" stream="false" show_border="false"></fb:like-box>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="lastitembody" runat="server">
    <!--FLEXSLIDER-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Flexslider/jquery.flexslider-min.js") %>"></script>
    <!--CUSTOM SCROLLBAR-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/CustomScrollbar/jquery.mousewheel.min.js") %>"></script>
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/CustomScrollbar/jquery.mCustomScrollbar.min.js") %>"></script>
    <!--CHAMADAS DA APLICACAO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/newsone/application.js") %>"></script>
</asp:Content>
