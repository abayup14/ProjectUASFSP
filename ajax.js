$(".btn-selanjutnya-lain").click(function() {
    var iduser = $("#iduser-kum-cerita").val();
    var perpage = 4;
    var currpar = parseInt($("#currPar-kum-cerita").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax_other.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
        var cerita = JSON.parse(data);
        $("#currPar-kum-cerita").val(currpar);
        
        var str = "";
        $.each(cerita, function(i, value) {
            str += "<div class='cerita'>";
            str += "<h3>" + value.judul + "</h3>";
            str += "<p>Pemilik Cerita: " + value.nama + "</p>";
            str += "<p>Jumlah Paragraf: " + value.jum_paragraf + "</p>";
            str += "<p><a href='read.php?idcerita=" + value.idcerita + "'>Baca Lebih Lanjut</a></p>";
            str += "</div>";
        });

        $(".container-kumpulan-cerita").append(str);
    });
});

$(".btn-selanjutnya-aku").click(function() {
    var iduser = $("#iduser-ceritaku").val();
    var perpage = parseInt($("#perpage-ceritaku").val());
    var currpar = parseInt($("#currPar-ceritaku").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax_punyaku.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
       var cerita = JSON.parse(data);
       $("#currPar-ceritaku").val(currpar);
       
       var str = "";
       $.each(cerita, function(i, value) {
           str += "<div class='cerita'>";
           str += "<h3>" + value.judul + "</h3>";
           str += "<p>Jumlah Paragraf: " + value.jum_paragraf + "</p>";
           str += "<p><a href='read.php?idcerita=" + value.idcerita + "'>Baca Lebih Lanjut</a></p>";
           str += "</div>";
       });

       $(".container-ceritaku").append(str);
    });
});

$("#kategori").change(function(){
    var selected = $("#kategori").val();
    if(selected == "kum-cerita"){
        $(".container-kumpulan-cerita").show();
        $(".container-ceritaku").hide();
    }
    else if(selected == "kum-ceritaku"){
        $(".container-ceritaku").show();
        $(".container-kumpulan-cerita").hide();
    }
});