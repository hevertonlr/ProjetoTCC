﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/InicialMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Helpers" %>
<%@ Import Namespace="bigpipe.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--CSS GERAL DA VIEW-->
    <link href="<%=Url.Content("~/Content/videos.css") %>" rel="stylesheet" />
    <!--PREVISAO DO TEMPO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Previsao/geoloc_prev.js") %>"></script>
    <!--MERCADO FINANCEIRO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Mercado/mercado.js") %>"></script>
    <!--YOUTUBE API-->
    <script type= "text/javascript" src="<%=Url.Content("~/Scripts/Youtube/youtube2.js") %>"></script>
    <!-- FUNÇÕES UTEIS -->
    <script type="text/javascript">
        function vddescricao(titulo, descricao) {
            $('#vdtitulo').html(titulo);
            $('#vdresumo').html(cortaString(descricao, 140));
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
            var months = { "jan": 0, "fev": 1, "mar": 2, "abr": 3, "mai": 4, "jun": 5, "jul": 6, "ago": 7, "set": 8, "out": 9, "nov": 10, "dez": 11 };
            var parts = /^\s*(\d+)\s+([A-Za-z]+)\s+(\d+)\s*$/.exec(str);
            var dt;
            if (parts) {
                parts[2] = months[parts[2].toLowerCase()];
                if (typeof parts[2] !== "undefined") {
                    dt = new Date(parseInt(parts[3], 10), parts[2], parseInt(parts[1], 10));
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="firstitembody" runat="server">
    <div id="fb-root"></div>
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/Facebook/facebook.js") %>"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentLeft" runat="server">
    
        <div class="labelsInd tr">
            <div class="icovid td"><span></span></div>
            <div class="txtlb td">Vídeos</div>
            <div class="clearfix"></div>
        </div>
        <div class="conteudoVideos tr">
            <div class="vdshow tr">
                <div class="vddata" align="center">
                    <table align="center">
                        <tr>
                            <td align="center">
                                <div id="vddia" class="dia"></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div id="vdmes" class="mes"></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div id="vdano" class="ano"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="vdplayer tr" id="player"></div>
                <div id="vdtitulo" class="vdtitulo tr"></div>
                <div id="vdresumo" class="vddesc tr"></div>
            </div>

            <div class="vdlist tr">
                <ul>
                    <%  int cont = 0;
                        var youtubeId = " ";
                        var nomevd = " ";
                        var resumovd = " ";
                        string firstytid = " ";
                
                        foreach(var item in (List<Videos>)ViewData["videos"])
                        {
                            cont++;
                            Match ytID = Regex.Match(item.HtmlVideo, "^[^v]+v=(.{11}).*");
                            youtubeId = ytID.Groups[1].Value;
                            nomevd = item.TituloVideo;
                            resumovd = item.ResumoVideo;
                            if(cont==1){
                                firstytid = youtubeId;
                        
                    %>             <script type="text/javascript">

                                       function returnid() {
                                           var id = '<%:firstytid%>';
                                           return id;
                                       }
                                       $('#vdtitulo').html('<%: nomevd %>');
                                       $('#vdresumo').html(cortaString('<%: resumovd %>', 140));
                                       $(window).load(function () {
                                           diamesanovd($('#vddata<%:item.CodigoVideo%>').text());
                                       });
                                       

                                    </script>
                    <%        }  
                            
                    %>
                            <script type="text/javascript">

                                getYouTubeInfo('<%: youtubeId %>', '<%: Html.DisplayFor(modelItem => item.CodigoVideo) %>');
                            </script>
                    <li>
                        <div class="vditem" onclick="player.cueVideoById('<%: youtubeId %>');vddescricao('<%: nomevd %>','<%: resumovd %>');diamesanovd($('#vddata<%:item.CodigoVideo%>').text());">
                            <div class="minvd td" style="background-image:url(<%: "http://i1.ytimg.com/vi/"+ youtubeId + "/default.jpg"%>)"><span></span></div>
                            <div class="descminvd td">
                                <div class="titulo tr"><%: Html.DisplayFor(modelItem => item.TituloVideo) %></div>
                                <div class="info tr">
                                    <table>
                                        <tr>
                                            <td>
                                                <div id="vddata<%: Html.DisplayFor(modelItem => item.CodigoVideo) %>" class="data"></div>
                                            </td>
                                            <td>
                                                <div id="vdviews<%: Html.DisplayFor(modelItem => item.CodigoVideo) %>" class="visualizacoes">0</div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </li>
                    <% } %>
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
    
    <!--CHAMADAS DA APLICACAO-->
    <script type="text/javascript" src="<%=Url.Content("~/Scripts/newsone/application.js") %>"></script>
    
</asp:Content>
