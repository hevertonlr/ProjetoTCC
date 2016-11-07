var lat = "";
var long = "";
var uf = "";
var cidade = "";
$(function () {


    // Try HTML5 geolocation
    /*
  	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(getnomecidade, locationError);
	}
  	else {
  	    getnomecidade();
		showError("Your browser does not support Geolocation!");
	}
	
	function locationError(error){
		switch(error.code) {
			case error.TIMEOUT:
			    showError("A timeout occured! Please try again!");
			    getnomecidade();
				break;
			case error.POSITION_UNAVAILABLE:
			    showError('We can\'t detect your location. Sorry!');
			    getnomecidade();
				break;
			case error.PERMISSION_DENIED:
			    showError('Please allow geolocation access for this to work.');
			    getnomecidade();
				break;
			case error.UNKNOWN_ERROR:
			    showError('An unknown error occured!');
			    getnomecidade();
				break;
		}

	}
	
	function showError(msg){
		$('#nomecidade').html(msg);
	}
	function removeAcento(strToReplace) {
	str_acento= "·‡„‚‰ÈËÍÎÌÏÓÔÛÚıÙˆ˙˘˚¸Á¡¿√¬ƒ…» ÀÕÃŒœ”“’÷‘⁄Ÿ€‹«";
	str_sem_acento = "aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC";
	var nova="";
		for (var i = 0; i < strToReplace.length; i++) {
			if (str_acento.indexOf(strToReplace.charAt(i)) != -1) {
				nova+=str_sem_acento.substr(str_acento.search(strToReplace.substr(i,1)),1);
			} else {
				nova+=strToReplace.substr(i,1);
			}
		}
		return nova;
	}
    
	function getnomecidade(position){ 
		//-27.358889,-53.393889 fw
	    //-27.598,-48.549 florianopolis
	    if (typeof position == 'undefined') {
	        lat = position.coords.latitude;
	        long = position.coords.longitude;
	    } else {
	        lat = -27.358889;
	        long = -53.393889;
	    }
		
		$.ajax({
			type: 'GET',
			dataType: "json",
			url: "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+long+"&sensor=false",
			data: {},
			success: function(data) {
				$.each( data['results'],function(i, val) {
					$.each( val['address_components'],function(i, val) {
						
						if (val['types'] == "locality,political") {
							if (val['long_name']!="") {
								$('#nomecidade').html(val['long_name'].toUpperCase());
								cidade=removeAcento(val['long_name'].toLowerCase().replace(" ","-"));
							}
							else {
								$('#nomecidade').html("Frederico Westphalen");
								cidade='frederico-westphalen';
							}
						}
						if (val['types'] == "administrative_area_level_1,political") {
							if (val['short_name']!="") {
							    $('#ufcidade').html(val['short_name'].toUpperCase());
								uf=val['short_name'].toLowerCase();
							}
							else {
								$('#ufcidade').html("RS");
								uf='rs';
							}
						}
						
					});
				});
				console.log('GeoLocalizacao Executada');
				//alert ("teste/"+uf+"/"+cidade);
				gettemperatura(uf,cidade);
				//$('#tmpcidade').html(data['results']);
			},
			error: function () { console.log('Erro na GeoLocalizacao'); } 
		}); 
	};*/
    $(document).ready(function () {
        getnomecidade();
    })
    function getnomecidade() {
        //alert ('teste'+uf+cidade);
        $.ajax({
            type: 'GET',
            dataType: 'jsonp',
            url: 'http://api.globo.com/geo',
            jsonpCallback: 'globoapi_geo_callback',
            success: function (data) {
                $.each(data, function (key, value) {
                    uf = data.state.code.toLowerCase();
                    cidade = data.city.code;
                    $('#nomecidade').html(data.city.name.toUpperCase().replace('', '&nbsp;'));
                    $('#ufcidade').html(data.state.code);
                });
                console.log('Cidade e Estado Encontrados');
                gettemperatura(uf, cidade);
            },
            error: function () { console.log('Erro na Busca da Cidade'); }
        });
    }

    function gettemperatura(uf, cidade) {
        //alert ('teste'+uf+cidade);
        $.ajax({
            type: 'GET',
            dataType: 'jsonp',
            url: 'http://api.g1.globo.com/tempo/cidade-resumida/' + uf + '/' + cidade + '.jsonp',
            jsonpCallback: 'g1_previsao_cidade',
            success: function (data) {
                $.each(data.previsoes, function (key, value) {
                    //alert(value.temperatura.minima + " - " + value.temperatura.maxima);
                    $('#tempmin').html(value.temperatura.minima + "&deg;");
                    $('#tempmax').html(value.temperatura.maxima + "&deg;");
                    $('#imgcidade').addClass("midia-padrao midia-gg-" + value.icone);

                    $('#imgmanha').addClass("midia-padrao midia-p-" + value.icone_manha);
                    $('#imgtarde').addClass("midia-padrao midia-p-" + value.icone_tarde);
                    $('#imgnoite').addClass("midia-padrao midia-p-" + value.icone_noite);
                    $('#txtimg').html(value.frase);
                    //html("<div class=\"tr midia-padrao midia-g-" + value.icone + "\"></div>");

                });
                console.log('Previsao do Tempo Executada')
            },
            error: function () { console.log('Erro na Previsao do Tempo'); }
        });
    }



});
function linkprevisao() {
    window.open('http://g1.globo.com/previsao-do-tempo/' + uf + '/' + cidade + '.html', '_blank');
};