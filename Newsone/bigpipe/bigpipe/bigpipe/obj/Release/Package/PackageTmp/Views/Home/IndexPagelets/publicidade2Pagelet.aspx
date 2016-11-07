<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>

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
