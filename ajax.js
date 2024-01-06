$(".btn-selanjutnya-lain").click(function() {
    var iduser = $("#iduser").val();
    var perpage = parseInt($("#perpage").val());
    var currpar = parseInt($("#currPar").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax_other.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
        alert(data);
        // var cerita = JSON.parse(data);
        alert(currpar);
        // $("#currPar").val(currpar);
    });

    // alert("ID: " + idUser + " currPar: " + currPar);
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
        alert(data);
        // var cerita = JSON.parse(data);
        alert(currpar);
        // $("#currPar").val(currpar);
    });

    // alert("ID: " + idUser + " currPar: " + currPar);
});