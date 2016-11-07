<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>

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
                                <td><div class="txtmaisLidas" onclick="window.open('<%:Url.Content("~/home/vernoticias/"+item.CodigoNoticia) %>','_self');"><%: ut.cortaString(item.TituloNoticia,60) %></div></td>
                            </tr>
                        </table>
                    </div>
                </li>
        <%
            }
        %>
    </ul>
</div>