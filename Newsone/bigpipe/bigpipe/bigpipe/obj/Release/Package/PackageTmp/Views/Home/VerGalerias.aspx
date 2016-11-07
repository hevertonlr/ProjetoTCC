<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS GERAL DA VIEW-->
    <link href="<%=Url.Content("~/Content/vergalerias.css") %>" rel="stylesheet" />
    <!--CSS DO JQUERY FLEXSLIDER-->
    <link href="<%=Url.Content("~/Content/Bibliotecas/Flexslider/flexfotos.css") %>" rel="stylesheet" />
    <!--PREVISAO DO TEMPO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Previsao/geoloc_prev.js") %>"></script>
    <!--MERCADO FINANCEIRO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Mercado/mercado.js") %>"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="firstitembody" runat="server">
    <div id="fb-root"></div>
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Facebook/facebook.js") %>"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentLeft" runat="server">
    <% Util ut = new Util();%>
    <div class="labelsInd tr">
        <div class="icogal td"><span></span></div>
        <div class="txtlb td">Galerias</div>
        <div class="clearfix"></div>
    </div>
    <div class="conteudoVerGalerias">
        <% string htmlfotosmn = "";
           string htmlfotosgr = "";
           foreach(var item in (List<Fotos>)ViewData["fotos"])
        {
            string caminhogal = "~/Images/galeria/miniaturas/"+item.NomearquivoFoto;
            string caminhogalgr = "~/Images/galeria/imagens/"+ item.NomearquivoFoto;
            htmlfotosmn += "<li><img src="+Url.Content(caminhogal)+" /></li>";
            htmlfotosgr += "<li><img src="+Url.Content(caminhogalgr)+" /></li>";
        } %>
        <div id="slider" class="flexslider">
          <ul class="slides">
            <%=htmlfotosgr%>
          </ul>
        </div>
        <div id="carousel" class="flexslider">
          <ul class="slides">
            <%=htmlfotosmn%>
          </ul>
        </div>
    </div>
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
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/CustomScrollbar/jquery.mousewheel.min.js") %>"></script>
    <script>
        $(window).load(function () {
            // The slider being synced must be initialized first
            $('#carousel').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: false,
                slideshow: false,
                itemWidth: 210,
                itemMargin: 5,
                move: 1,
                asNavFor: '#slider'
            });

            $('#slider').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: false,
                slideshow: false,
                sync: "#carousel"
            });
        });
    </script>
    <!--CHAMADAS DA APLICACAO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/newsone/application.js") %>"></script>
    
</asp:Content>
