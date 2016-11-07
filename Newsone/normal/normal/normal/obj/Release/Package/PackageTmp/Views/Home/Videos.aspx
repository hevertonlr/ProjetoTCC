<%@ Page Title="" Language="C#" MasterPageFile="~/Views/NewsOne.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="System.Collections.Generic"%>
<%@ Import Namespace="normal.Models" %>

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
    <!--BANNERS 1-->
    <div class="publ1 tr">
        <div class="lbPubl tr">Publicidade</div>
        <div class="listapublic1">
            <ul class="slides">
            <%  var bnpb1 = "~/Images/public1/";
                foreach (var item in (List<Banners>)ViewData["public1"])
                {
                    if ((item.LinkBanner!="") && (item.LinkBanner!=null))
                    {
                    %>
                    <li><div onclick="window.open('<%: Html.DisplayFor(modelItem => item.LinkBanner) %>','_blank');" class="imgPublic tr" style="background-image:url(<%=Url.Content( bnpb1 + Html.DisplayFor(modelItem => item.ArquivoBanner)) %>);"></div></li>
                    <%                
                    }else
	                {
                    %>
                    <li><div class="imgPublic tr" style="background-image:url(<%=Url.Content( bnpb1 + Html.DisplayFor(modelItem => item.ArquivoBanner)) %>);"></div></li>
                    <%
	                }
                }
            %>
            </ul>
        </div>
    </div>
    <!--NOTICIAS MAIS LIDAS-->
    <div class="maisLidas tr">
        <div class="labelsInd tr">
            <div class="iconot td"><span></span></div>
            <div class="txtlb td">Mais Lidas</div>
            <div class="clearfix"></div>
        </div>
        <div class="tr" align="center">
            <ul>
                <%  var cont = 0;
                    Util ut = new Util();
                    foreach (var item in (List<Noticias>)ViewData["maisvistas"])
                    {
                        cont++;
                %>        
                        <li>
                            <div class="itmaisLidas">
                                <table>
                                    <tr>
                                        <td><div class="nummaisLidas"><%: cont %></div></td>
                                        <td><div class="txtmaisLidas" onclick="window.open('/home/vernoticias/<%: item.CodigoNoticia %>','_self');"><%: ut.cortaString(item.TituloNoticia,60) %></div></td>
                                    </tr>
                                </table>
                            </div>
                        </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <!--PREVISAO DO TEMPO-->
    <div class="previsaoTempo tr">
        <div class="labelsInd tr">
            <div class="icotempo td"><span></span></div>
            <div class="txtlb td">Previsão do Tempo</div>
            <div class="clearfix"></div>
        </div>
        <div class="descricaoPrevisaoTempo tr">
            <div class="cidade tr">
                <div class="nmcidade tr"><span id="nomecidade"></span> - <span id="ufcidade"></span></div>
                <div class="prevcompleta tr" onclick="linkprevisao();">veja a previsão completa</div>
            </div>
            <div class="infoprevisao tr">
                <div class="previmg td" align="center">
                    <div id="imgcidade" class="imgprev tr"></div>
                    <div id="txtimg" class="txtprev tr"></div>
                </div>
                <div class="descprev td" align="center">
                    <div class="maxminprev tr" align="left">
                        <div id="tempmax" class="maxprev tr"></div>
                        <div id="tempmin" class="minprev tr"></div>
                    </div>
                    <div class="mtnprev tr">
                        <table>
                            <tr>
                                <td>
                                    <div id="imgmanha" class="mimg tr"></div>
                                    <div class="mtxt tr">Manhã</div>
                                </td>
                                <td>
                                    <div id="imgtarde" class="timg tr"></div>
                                    <div class="ttxt tr">Tarde</div>
                                </td>
                                <td>
                                    <div id="imgnoite" class="nimg tr"></div>
                                    <div class="ntxt tr">Noite</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--BANNERS 2-->
    <div class="publ2 tr">
        <div class="lbPubl tr">Publicidade</div>
        <div class="listapublic2">
            <ul class="slides">
            <%  var bnpb2 = "~/Images/public2/";
                foreach (var item in (List<Banners>)ViewData["public2"])
                {
                    if ((item.LinkBanner!="") && (item.LinkBanner!=null))
                    {
                    %>
                    <li><div onclick="window.open('<%: Html.DisplayFor(modelItem => item.LinkBanner) %>','_blank');" class="imgPublic tr" style="background-image:url(<%=Url.Content( bnpb2 + Html.DisplayFor(modelItem => item.ArquivoBanner)) %>);"></div></li>
                    <%                
                    }else
	                {
                    %>
                    <li><div class="imgPublic tr" style="background-image:url(<%=Url.Content( bnpb2 + Html.DisplayFor(modelItem => item.ArquivoBanner)) %>);"></div></li>
                    <%
	                }
                }
            %>
            </ul>
        </div>
    </div>
    
    <!--MERCADO FINACEIRO-->
    <div class="mercFinanc tr">
        <div class="labelsInd tr">
            <div class="icomercfin td"><span></span></div>
            <div class="txtlb td">Mercado Financeiro</div>
            <div class="clearfix"></div>
        </div>
        <div class="infomercfinanc tr">
            <div class="mfinfoTop tr">
                <div class="mfinfoTopleft td">
                    <div id="displayName" class="bolsatop tr"></div>
                    <div class="descbolsatop tr">BVSP</div>
                </div>
                <div class="mfinfoTopright td">
                    <div id="pctchng" class="numtoptop tr"></div>
                    <div id="pctchng2" class="pontostop tr"></div>
                </div>
            </div>
            <div class="mfinforBottom tr">
                <table>
                    <tr>
                        <td>moedas</td>
                        <td>variação</td>
                        <td>compra</td>
                    </tr>
                    <tr>
                        <td><div class="moeda">Euro</div></td>
                        <td><div id="eurovar"></div></td>
                        <td id="euro"></td>
                    </tr>
                    <tr>
                        <td><div class="moeda">Dólar Comercial</div></td>
                        <td><div id="dolarvar"></div></td>
                        <td id="dolar"></td>
                    </tr>
                </table>
            </div>
            <div id="timenow" class="mfrodape tr" align="right"></div>
        </div>
    </div>
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
