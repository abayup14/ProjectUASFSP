$("#btnNextOther").click(function() {
    var idUser = $('#idUser').val();
    
    $.post('ajaxdb_withjson_other.php', {
        id : idUser
    })

    .done(function(data) {
        if(data == "Data tidak ditemukan"){
            $("#hasil").html(data);
        }
        else{
            
            var jsonResult = JSON.parse(data);
            
            var table;
            table += "<td>" + jsonResult.judul + "<td>";
            table += "<td>" + jsonResult.nama + "<td>";
            table += "<td>" + jsonResult.sinopsis + "<td>";
            table += "<td><a href='read.php?idcerita='" + jsonResult.idcerita + "'>Lihat Cerita</a></td>";
            table += "</tr></table>";

            $("#hasil").html(table);
        }
    });
})