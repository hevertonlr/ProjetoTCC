<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>
<% Util ut = new Util(); %>

<div class="labelsInd tr">
    <div class="icogal td"><span></span></div>
    <div class="txtlb td">Galerias</div>
    <div class="clearfix"></div>
</div>
<div class="itensGaleria tr" align="center">
    <div class="listaitensGaleria">
    <ul class="slides">
        <% foreach(var item in (List<Galerias>)ViewData["galerias"])
        {
            string caminhogal = "~/Images/galeria/miniaturas/"+item.NomearquivoFoto;
                       
        %>
        <li>
            <div class="itemGaleria tr" align="center" onclick="window.open('<%:Url.Content("~/home/galerias/"+item.CodigoGaleria)%>','_self');">
                <div class="imgGaleria tr"><div class="cpGaleria" style="background-image:url(<%: Url.Content(caminhogal)%>)"></div></div>
                <div class="nomeGaleria tr"><%: ut.cortaString(item.Titulogaleria,40) %></div>
            </div>
        </li>
        <% 
        } %>
    </ul>
    </div>
</div>