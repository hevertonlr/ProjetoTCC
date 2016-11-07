<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<div class="menuTopo">
    <div class="conteudomenuTopo">
    <ul>
        <li><a href="<%=Url.Content("~/home/noticias")%>">NOTÍCIAS</a></li>
        <li><a href="<%=Url.Content("~/home/galerias")%>">GALERIAS</a></li>
        <li><a href="http://www.osboneco.com/" target="_blank">ENTRETENIMENTO</a></li>
        <li><a href="<%=Url.Content("~/home/videos")%>">VÍDEOS</a></li>
    </ul>
    </div>
</div>
<div class="conteudoTopo" align="left">
    <div class="logoTopo" onclick="window.open('<%=Url.Content("~/")%>','_self');"></div>
    <div class="pesqTopo" align="right">
        <div id="relogio" class="clockTopo tr"></div>
        <div class="dataTopo tr">Frederico Westphalen, <span id="dataatual" ></span></div>
        <div class="campopesqTopo tr">
            <form action="http://www.google.com/search" method="get" target="_blank">
            <input type="text" class="ipPesqTopo" name="q" value="" placeholder="O que você procura?" />
            <button type="submit" class="btnPesqTopo"></button>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
