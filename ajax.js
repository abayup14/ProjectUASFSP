$(".btn-selanjutnya-lain").click(function() {
    var iduser = $("#iduser").val();
    var perpage = 4;
    var currpar = parseInt($("#currPar").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax_other.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
        var cerita = JSON.parse(data);
        $("#currPar").val(currpar);
        
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
    var iduser = $("#iduser").val();
    var perpage = parseInt($("#perpage").val());
    var currpar = parseInt($("#currPar").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax_punyaku.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
       var cerita = JSON.parse(data);
       $("#currPar").val(currpar);
       
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