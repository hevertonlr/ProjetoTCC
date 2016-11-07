<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS GERAL DA VIEW-->
    <link href="<%=Url.Content("~/Content/galerias.css") %>" rel="stylesheet" />
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
    <div class="conteudoGalerias">
        <div class="rowgalerias tr">
        <% var cont = 0;
            foreach(var item in (List<Galerias>)ViewData["galerias"])
            {
                
                List<Galerias> lista = new List<Galerias>();
                lista = (List<Galerias>)ViewData["galerias"];
                cont++;
                string caminhogal = "~/Images/galeria/miniaturas/"+item.NomearquivoFoto;
        %>
            <div class="itemGaleria td" align="center" onclick="window.open('<%:Url.Content("~/home/vergalerias/"+item.CodigoGaleria) %>','_self');">
                <div class="imgGaleria tr"><div class="cpGaleria" style="background-image:url(<%: Url.Content(caminhogal)%>)"></div></div>
                <div class="nomeGaleria tr"><%: ut.cortaString(item.Titulogaleria,40) %></div>
            </div>
        <%      if ((cont % 3 == 0) && (cont< lista.Count) )
                {
            %>  <div class="clearfix"></div>
                </div>
                <div class="rowgalerias tr">
            <%
                }
        } %>
            <div class="clearfix"></div>
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
    <!--CHAMADAS DA APLICACAO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/newsone/application.js") %>"></script>
</asp:Content>
