<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS GERAL DA VIEW-->
    <link href="<%=Url.Content("~/Content/noticias.css") %>" rel="stylesheet" />
    
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
    <div class="listaNoticias tr">
        <ul>
            <% foreach(var item in (List<Noticias>)ViewData["noticias"])
                {
                    System.DateTime datanot = item.DataNoticia;
                    string dia = datanot.Day.ToString();
                    string[] meses = {"Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"};
                    string mes = meses[datanot.Month];
                    string ano = datanot.Year.ToString();
                    string caminhocapa = "~/Images/galeria/miniaturas/" + item.NomearquivoFoto;
            %>
            <li>
                <div class="ntItem">
                    <div class="ntcapa td">
                        <div class="ntcpimg" style="background-image:url(<%: Url.Content(caminhocapa)%>) !important;)">
                            <div class="ntdata" align="center">
                                <table align="center">
                                    <tr>
                                        <td align="center">
                                            <div class="dia"><%: dia %></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <div class="mes"><%: mes %></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <div class="ano"><%: ano %></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="ntInfo td">
                            
                        <div class="nttitulo tr"><%: ut.cortaString(item.TituloNoticia,80) %></div>
                        <div class="visualizacoes tr"><%: item.VisualizacoesNoticia %></div>
                        <div class="ntresumo tr"><%: ut.cortaString(item.ResumoNoticia,100) %></div>
                        <div class="ntmais tr" align="right">
                            <div class="btnvermais" onclick="window.open('<%:Url.Content("~/home/vernoticias/"+item.CodigoNoticia) %>','_self');" >Veja Mais >></div>
                        </div>
                    </div>
                </div>
            </li>
            <% } %>
        </ul>
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