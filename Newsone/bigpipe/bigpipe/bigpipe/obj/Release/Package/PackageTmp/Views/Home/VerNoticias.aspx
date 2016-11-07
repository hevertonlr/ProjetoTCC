<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS GERAL DA VIEW-->
    <link href="<%=Url.Content("~/Content/vernoticias.css") %>" rel="stylesheet" />
    <!--CSS DO JQUERY COLORBOX-->
    <link href="<%=Url.Content("~/Scripts/Colorbox/example4/colorbox.css") %>" rel="stylesheet" />
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
        <div class="iconot td"><span></span></div>
        <div class="txtlb td">Notícias</div>
        <div class="clearfix"></div>
    </div>
    <div class="conteudoNoticia">
        <%  foreach (var item in (List<Noticias>)ViewData["noticias"])
            { 
        %>
                <div class="tituloNoticia"><%: item.TituloNoticia %></div>
                <div class="dataNoticia"><%: ut.formatadata(item.DataNoticia) %></div>
                <div class="resumoNoticia"><%: item.ResumoNoticia %></div>
                <div class="descricaoNoticia"><%: item.DescricaoNoticia %></div>
                <div class="fonteNoticia"><%: item.FonteNoticia %></div>        
                
                <div class="labelsInd tr">
                    <div class="icogal td"><span></span></div>
                    <div class="txtlb td">Imagens</div>
                    <div class="clearfix"></div>
                </div>
                <div class="imagensNoticia">
        <%      string queryfotos = "select tb_fotos.* from tb_fotos where codigoGaleria = " + item.CodigoGaleria;
                var fotos = bigpipe.Models.Fotos.SelectFotos(queryfotos);
                foreach (var item2 in (List<Fotos>)fotos)
                {
                    string caminhogal = "~/Images/galeria/miniaturas/" + item.NomearquivoFoto;
                    string caminhogalgr = "~/Images/galeria/imagens/" + item.NomearquivoFoto;
        %>          <div class="imgGaleria tr"><a href="<%: Url.Content(caminhogalgr)%>" class="group1"><div class="cpGaleria" style="background-image:url(<%: Url.Content(caminhogal)%>)"></div></a></div>
        <%            
                }
        %>
                </div>    
        <%        
            }
        %>
        
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
    <!--COLORBOX-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Colorbox/jquery.colorbox-min.js") %>"></script>
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Colorbox/i18n/jquery.colorbox-pt-br.js") %>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Examples of how to assign the Colorbox event to elements
            $(".group1").colorbox({ rel: 'group1', maxWidth: "100%", maxHeight: "100%" });
        });
    </script>
    <!--CHAMADAS DA APLICACAO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/newsone/application.js") %>"></script>
    
</asp:Content>