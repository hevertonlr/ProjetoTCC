<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<div class="conteudoMenu" align="left">
    <ul>
        <li class="mnhomeli" onclick="window.open('<%=Url.Content("~/")%>','_self');"><div class="mnhomeico"></div></li>
        <li><a href="#">Editoriais</a></li>
        <li><a href="#">Sua Região</a></li>
        <li><a href="#">Economia</a></li>
        <li><a href="#">Saúde</a></li>
        <li><a href="#">Policial</a></li>
    </ul>
</div>
