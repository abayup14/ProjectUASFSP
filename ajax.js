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
    var idUser = parseInt($("#idUser").val());
    var currPar = parseInt($("#currPar").val());

    $.post("ajax.php", {
        idUser: idUser,
        currPar: currPar
    })
    .done(function(data) {
        alert(data);
    });

    // alert("ID: " + idUser + " currPar: " + currPar);
});

$("#btnPrevOther").click(function() {
    
});