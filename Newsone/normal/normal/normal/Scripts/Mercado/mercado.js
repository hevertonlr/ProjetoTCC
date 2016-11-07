function mercadofinanc() {
    //alert ('teste'+uf+cidade);
    var url = 'http://g1.globo.com/indicadorg1/quotelist/quote/g1ind_indices_bovespa/';

    $.ajax({
        url: "http://query.yahooapis.com/v1/public/yql",
        type: "GET",
        dataType: "json",
        data: {
            q: "select * from json where url=\"" + url + "\"",
            format: "json"
        },
        success: function (data) {
            console.log("Mercado Financeiro 2 Executado");
            $.each(data, function (key, value) {
                //data.query.results.json.EURBRL_R.CF_LAST
                //console.log(data.query.results.json);
                //alert(value.temperatura.minima + " - " + value.temperatura.maxima);

                $('#displayName').html(data.query.results.json._BVSP.DSPLY_NAME);
                $('#pctchng').html(data.query.results.json._BVSP.PCTCHNG);
                //49.867 pts (-225)
                num = parseFloat(data.cfNetchng);
                if (num > 0) {
                    txt = '+';
                } else {
                    txt = '-';
                }
                $('#pctchng2').html(parseFloat(data.query.results.json._BVSP.CF_LAST) + ' pts ' + '(' + data.query.results.json._BVSP.CF_NETCHNG + ')');
                $('#timenow').html(data.query.results.json._BVSP.TIME_NOW + ' | Thomson Reuters');
                //$('#').html();
                //$('#').html();
            });
        }
    });

    /*
                $.ajax({
                    type: 'GET',
                    dataType: 'jsonp',
                    url: 'http://api.globo.com/finance.jsonp',
                    jsonpCallback: 'g1_economia_mercado',
                    success: function (data) {
                        $.each(data, function (key, value) {
                            //alert(value.temperatura.minima + " - " + value.temperatura.maxima);
                            var num = parseFloat(data.pctchng);
                            var txt = '';
                            if (num > 0) {
                                txt = '+';
                            } else {
                                txt = '-';
                            }
                            $('#displayName').html(data.displayName);
                            $('#pctchng').html(txt + data.pctchng + '%');
                            //49.867 pts (-225)
                            num = parseFloat(data.cfNetchng);
                            if (num > 0) {
                                txt = '+';
                            } else {
                                txt = '-';
                            }
                            $('#pctchng2').html(data.cfLast + ' pts ' + '(' + txt + parseFloat(data.cfNetchng) + ')');
                            $('#timenow').html(data.timeNow + ' | Thomson Reuters');
                            //28/08/2013 | Thomson Reuters
                            //var pc = data.pctchng;                        
                            
                        });
                        console.log('Mercado Financeiro Executado')
                    },
                    error: function () { console.log('Erro no Mercado Financeiro'); }
                });*/
}
function parseDouble(value) {
    if (typeof value == "string") {
        value = value.match(/^-?\d*/)[0];
    }
    return !isNaN(parseInt(value)) ? value * 1 : NaN;
}
function mercadofinanc3() {

    var url = 'http://g1.globo.com/indicadorg1/quotelist/quote/moedas/';
    var num = -1;
    var plus = "";
    var minus = "";
    $.ajax({
        url: "http://query.yahooapis.com/v1/public/yql",
        type: "GET",
        dataType: "json",
        data: {
            q: "select * from json where url=\"" + url + "\"",
            format: "json"
        },
        success: function (data) {
            console.log("Mercado Financeiro 1 Executado");
            $.each(data, function (key, value) {
                $('#euro').html(data.query.results.json.EURBRL_R.CF_LAST);
                $('#eurovar').html(data.query.results.json.EURBRL_R.CALC_PCTCHNG);

                num = data.query.results.json.EURBRL_R.CALC_PCTCHNG;
                if (typeof (num) != "undefined") {
                    plus = num.indexOf("+");
                    minus = num.indexOf("-");
                    if (plus >= 0) {
                        $('#eurovar').addClass('varplus');
                    } else if (minus >= 0) {
                        $('#eurovar').addClass('varminus');
                    }
                }
                $('#dolar').html(data.query.results.json.BRL_BRBY.CF_LAST);
                $('#dolarvar').html(data.query.results.json.BRL_BRBY.CALC_PCTCHNG);
                //var num = parseDouble(data.query.results.json.BRL_BRBY.CALC_PCTCHNG);

                num = JSON.stringify(data.query.results.json.BRL_BRBY.CALC_PCTCHNG);
                if (typeof (num) != "undefined") {
                    plus = num.indexOf("+");
                    minus = num.indexOf("-");
                    if (plus >= 0) {
                        $('#dolarvar').addClass('varplus');
                    } else if (minus >= 0) {
                        $('#dolarvar').addClass('varminus');
                    }
                }

            });
        },
        error: function (jqwXHR, textStatus, errorThown) { console.log(jqwXHR, textStatus, errorThown); },

    });
    //});

}


function parsere(data) {
    alert(data);
    //var title = data.entry.title.$t;
    //var description = data.entry.media$group.media$description.$t;
    //var viewcount = data.entry.yt$statistics.viewCount;
    //var author = data.entry.author[0].name.$t;
    //var dataup = data.entry.published.$t;
    //var dt = new Date(dataup);
    //dataup = dt.customFormat("#DD# #MMM# #YYYY#");

    //$('#vddata' + cod).html(dataup);
    //$('#description').html('<b>Description</b>: ' + description);
    //$('#vdviews' + cod).html(viewcount);
    //getComments(data.entry.gd$comments.gd$feedLink.href + '&max-results=50&alt=json', 1);

}



$(document).ready(function () {
    mercadofinanc();
    //mercadofinanc2();
    mercadofinanc3();
    //getDados();
});