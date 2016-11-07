<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>
<div class="ws_images">
    <ul>
        <%  var bngr = "~/Images/wowslider/images/";
            foreach (var item in (List<Banners>)ViewData["slides"])
        { %>
        <li><a href="<%: Html.DisplayFor(modelItem => item.LinkBanner) %>" target="_blank"><img src="<%=Url.Content(bngr+Html.DisplayFor(modelItem => item.ArquivoBanner)) %>" alt="" title="<%: Html.DisplayFor(modelItem => item.TituloBanner) %>" id="wows1_0" /></a><%: Html.DisplayFor(modelItem => item.SubtituloBanner) %></li>
        <% }%>
                
    </ul>
</div>
            
<div class="ws_thumbs">
    <div style="left:auto !important">
        <% var bnmn = "~/Images/wowslider/thumbs/";
            foreach (var item in (List<Banners>)ViewData["slides"])
            { %>
        <a href="#"><img src="<%=Url.Content(bnmn+Html.DisplayFor(modelItem => item.ArquivoBanner)) %>" alt="<%: Html.DisplayFor(modelItem => item.TituloBanner) %>" /></a>
        <% }%>
    </div>
</div>