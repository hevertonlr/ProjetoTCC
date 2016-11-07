<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

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