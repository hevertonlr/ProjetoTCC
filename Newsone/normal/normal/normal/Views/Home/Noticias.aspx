<%@ Page Title="" Language="C#" MasterPageFile="~/Views/NewsOne.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="System.Collections.Generic"%>
<%@ Import Namespace="normal.Models" %>

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
                            <div class="btnvermais" onclick="window.open('<%: Url.Content("~/home/vernoticias/"+ item.CodigoNoticia) %>','_self');" >Veja Mais >></div>
                        </div>
                    </div>
                </div>
            </li>
            <% } %>
        </ul>
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