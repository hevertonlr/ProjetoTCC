<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="bigpipe.Models" %>

<div class="labelsInd tr">
    <div class="icovid td"><span></span></div>
    <div class="txtlb td">Vídeos</div>
    <div class="clearfix"></div>
</div>
<div class="tr">
    <div class="vdshow td">
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
    <div class="vdlist td">
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
                                
                                diamesanovd($('#vddata<%:item.CodigoVideo%>').text());

                            </script>
            <%        }  
                            
            %>
                    <script type="text/javascript">
                        
                        getYouTubeInfo('<%: youtubeId %>', '<%: Html.DisplayFor(modelItem => item.CodigoVideo) %>');
                    </script>
            <li>
                <div class="vditem tr" onclick="player.cueVideoById('<%: youtubeId %>');vddescricao('<%: nomevd %>','<%: resumovd %>');diamesanovd($('#vddata<%:item.CodigoVideo%>').text());">
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
<div class="vdmais tr" align="center">
    <div class="btnmais" onclick="window.open('<%:Url.Content("~/home/videos")%>','_self')">Ver Mais Vídeos</div>
</div>
