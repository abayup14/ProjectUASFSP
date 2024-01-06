// $("#btnNextOther").click(function() {
//     var idUser = $('#idUser').val();
    
//     $.post('ajaxdb_withjson_other.php', {
//         id : idUser
//     })

//     .done(function(data) {
//         if(data == "Data tidak ditemukan"){
//             $("#hasil").html(data);
//         }
//         else{
            
//             var jsonResult = JSON.parse(data);
            
//             var table;
//             table += "<td>" + jsonResult.judul + "<td>";
//             table += "<td>" + jsonResult.nama + "<td>";
//             table += "<td>" + jsonResult.sinopsis + "<td>";
//             table += "<td><a href='read.php?idcerita='" + jsonResult.idcerita + "'>Lihat Cerita</a></td>";
//             table += "</tr></table>";

//             $("#hasil").html(table);
//         }
//     });
// })

$("#btnNextOther").click(function() {
    var iduser = $("#iduser").val();
    var perpage = parseInt($("#perpage").val());
    var currpar = parseInt($("#currPar").val()) + 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
        alert(data);
        // var cerita = JSON.parse(data);
        // alert(currpar);
        $("#currPar").val(currpar);
    });

    // alert("ID: " + idUser + " currPar: " + currPar);
});

$("#btnPrevOther").click(function() {
    var iduser = $("#iduser").val();
    var perpage = parseInt($("#perpage").val());
    var currpar = parseInt($("#currPar").val()) - 1;
    var start = (currpar - 1) * perpage;

    $.post("ajax.php", {
        iduser: iduser,
        start: start,
        perpage: perpage
    })
    .done(function(data) {
        alert(data);
        // var cerita = JSON.parse(data);
        // alert(currpar);
        $("#currPar").val(currpar);
    });
});