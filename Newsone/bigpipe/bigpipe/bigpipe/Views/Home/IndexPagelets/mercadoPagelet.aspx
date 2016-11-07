<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<div class="labelsInd tr">
    <div class="icomercfin td"><span></span></div>
    <div class="txtlb td">Mercado Financeiro</div>
    <div class="clearfix"></div>
</div>
<div class="infomercfinanc tr">
    <div class="mfinfoTop tr">
        <div class="mfinfoTopleft td">
            <div id="displayName" class="bolsatop tr"></div>
            <div class="descbolsatop tr">BVSP</div>
        </div>
        <div class="mfinfoTopright td">
            <div id="pctchng" class="numtoptop tr"></div>
            <div id="pctchng2" class="pontostop tr"></div>
        </div>
    </div>
    <div class="mfinforBottom tr">
        <table>
            <tr>
                <td>moedas</td>
                <td>variação</td>
                <td>compra</td>
            </tr>
            <tr>
                <td><div class="moeda">Euro</div></td>
                <td><div id="eurovar"></div></td>
                <td id="euro"></td>
            </tr>
            <tr>
                <td><div class="moeda">Dólar Comercial</div></td>
                <td><div id="dolarvar"></div></td>
                <td id="dolar">/td>
            </tr>
        </table>
    </div>
    <div id="timenow" class="mfrodape tr" align="right"></div>
</div>