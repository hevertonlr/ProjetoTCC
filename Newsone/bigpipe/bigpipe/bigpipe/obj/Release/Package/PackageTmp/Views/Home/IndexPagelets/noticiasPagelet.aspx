<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>

<div class="labelsInd tr">
    <div class="iconot td"><span></span></div>
    <div class="txtlb td">Mais Notícias</div>
    <div class="clearfix"></div>
</div>
<div class="ntList tr">
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
                    <% Util ut = new Util();%>
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
<div class="vermaisNoticias tr" align="center">
    <div class="btnvmnot" onclick="window.open('<%:Url.Content("~/home/noticias")%>','_self');">Ver Mais Notícias</div>
</div>
