function getYouTubeInfo(id, cod) {
    $.ajax({
        url: "http://gdata.youtube.com/feeds/api/videos/" + id + "?v=2&alt=json",
        dataType: "jsonp",
        success: function (data) { parseresults(data, cod); }
    });
}
function parseresults(data, cod) {
    //var title = data.entry.title.$t;
    //var description = data.entry.media$group.media$description.$t;
    var viewcount = data.entry.yt$statistics.viewCount;
    //var author = data.entry.author[0].name.$t;
    var dataup = data.entry.published.$t;
    var dt = new Date(dataup);
    dataup = dt.customFormat("#DD# #MMM# #YYYY#");

    $('#vddata' + cod).html(dataup);
    //$('#description').html('<b>Description</b>: ' + description);
    $('#vdviews' + cod).html(viewcount);
    //getComments(data.entry.gd$comments.gd$feedLink.href + '&max-results=50&alt=json', 1);
    
}


Date.prototype.customFormat = function (formatString) {
    var YYYY, YY, MMMM, MMM, MM, M, DDDD, DDD, DD, D, hhh, hh, h, mm, m, ss, s, ampm, AMPM, dMod, th;
    var dateObject = this;
    YY = ((YYYY = dateObject.getFullYear()) + "").slice(-2);
    MM = (M = dateObject.getMonth() + 1) < 10 ? ('0' + M) : M;
    MMM = (MMMM = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"][M - 1]).substring(0, 3);
    DD = (D = dateObject.getDate()) < 10 ? ('0' + D) : D;
    DDD = (DDDD = ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-Feira", "Quinta-feira", "Sexta-feira", "Sábado"][dateObject.getDay()]).substring(0, 3);
    th = (D >= 10 && D <= 20) ? 'th' : ((dMod = D % 10) == 1) ? 'st' : (dMod == 2) ? 'nd' : (dMod == 3) ? 'rd' : 'th';
    formatString = formatString.replace("#YYYY#", YYYY).replace("#YY#", YY).replace("#MMMM#", MMMM).replace("#MMM#", MMM).replace("#MM#", MM).replace("#M#", M).replace("#DDDD#", DDDD).replace("#DDD#", DDD).replace("#DD#", DD).replace("#D#", D).replace("#th#", th);

    h = (hhh = dateObject.getHours());
    if (h == 0) h = 24;
    if (h > 12) h -= 12;
    hh = h < 10 ? ('0' + h) : h;
    AMPM = (ampm = hhh < 12 ? 'am' : 'pm').toUpperCase();
    mm = (m = dateObject.getMinutes()) < 10 ? ('0' + m) : m;
    ss = (s = dateObject.getSeconds()) < 10 ? ('0' + s) : s;
    return formatString.replace("#hhh#", hhh).replace("#hh#", hh).replace("#h#", h).replace("#mm#", mm).replace("#m#", m).replace("#ss#", ss).replace("#s#", s).replace("#ampm#", ampm).replace("#AMPM#", AMPM);
}


var tag = document.createElement('script');
var player;
var done = false;

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubeIframeAPIReady() {
    id = returnid();
    player = new YT.Player('player', {
        height: '405',
        width: '672',
        videoId: id,
        playerVars: {
            'autohide': true,
            'autoplay': 0,
            'controls': 0,
            'theme': 'light'
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });

}

function onPlayerReady(event) {
    event.target.stopVideo();
    //event.target.playVideo();
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 6000);
        done = true;
    }
}

function stopVideo() {
    player.stopVideo();
}