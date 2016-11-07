<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<div class="conteudoRodape" align="center">
                <div class="tpRodape tr" align="left">
                    <table>
                        <tr>
                            <td>
                                <ul>
                                    <li><div class="logorodape" onclick="window.open('/','_self');"></div></li>
                                    <li><a href="<%=Url.Content("~/home/noticias")%>">notí­cias</a></li>
                                    <li class="divisor">|</li>
                                    <li><a href="<%=Url.Content("~/home/galerias")%>">galerias</a></li>
                                    <li class="divisor">|</li>
                                    <li><a href="http://www.osboneco.com/" target="_blank">entretenimento</a></li>
                                    <li class="divisor">|</li>
                                    <li><a href="<%=Url.Content("~/home/videos")%>">vídeos</a></li>
                                </ul>
                            </td>
                            <td>
                                <ul class="rpSocial">
                                    <li><div class="icoyoutube" onclick="window.open('http://www.youtube.com/channel/UCPrNQdvu8wRmSCJ8YDDE92g','_blank');"><span></span></div></li>
                                    <li><div class="icogplus" onclick="window.open('https://plus.google.com/u/0/112030672909968069529','_blank');"><span></span></div></li>
                                    <li><div class="icotwitter" onclick="window.open('https://twitter.com/hevertonlr','_blank');"><span></span></div></li>
                                    <li><div class="icofacebook" onclick="window.open('https://www.facebook.com/hevertonluan.roieski','_blank');"><span></span></div></li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btRodape tr" align="right">
                    <div class="copyright">© Copyright 2013 News one | Heverton L. Roieski</div>
                </div>
            </div>