$(".btn-selanjutnya-lain").click(function () {
  var iduser = $("#iduser-kum-cerita").val();
  var perpage = parseInt($("#perpage-kum-cerita").val());
  var currpar = parseInt($("#currpar-kum-cerita").val()) + 1;
  var start = (currpar - 1) * perpage;

  $.post("ajax_other.php", {
    iduser: iduser,
    start: start,
    perpage: perpage,
  }).done(function (data) {
    var cerita = JSON.parse(data);
    $("#currpar-kum-cerita").val(currpar);

    var str = "";
    $.each(cerita, function (i, value) {
      str += "<div class='cerita'>";
      str += "<h3>" + value.judul + "</h3>";
      str += "<p>Pemilik Cerita: " + value.nama + "</p>";
      str += "<p>Jumlah Paragraf: " + value.jum_paragraf + "</p>";
      str +=
        "<p><a href='read.php?idcerita=" +
        value.idcerita +
        "'>Baca Lebih Lanjut</a></p>";
      str += "</div>";
    });

    $(".container-kumpulan-cerita").append(str);
  });
});

$(".btn-selanjutnya-aku").click(function () {
  var iduser = $("#iduser-ceritaku").val();
  var perpage = parseInt($("#perpage-ceritaku").val());
  var currpar = parseInt($("#currpar-ceritaku").val()) + 1;
  var start = (currpar - 1) * perpage;

  $.post("ajax_punyaku.php", {
    iduser: iduser,
    start: start,
    perpage: perpage,
  }).done(function (data) {
    var cerita = JSON.parse(data);
    $("#currpar-ceritaku").val(currpar);

    var str = "";
    $.each(cerita, function (i, value) {
      str += "<div class='cerita'>";
      str += "<h3>" + value.judul + "</h3>";
      str += "<p>Jumlah Paragraf: " + value.jum_paragraf + "</p>";
      str +=
        "<p><a href='read.php?idcerita=" +
        value.idcerita +
        "'>Baca Lebih Lanjut</a></p>";
      str += "</div>";
    });

    $(".container-ceritaku").append(str);
  });
});

$("#kategori").change(function () {
  var selected = $("#kategori").val();
  if (selected == "kum-ceritaku") {
    $(".container-kiri").hide();

    $(".container-kanan").show();
  } else if (selected == "kum-cerita") {
    $(".container-kanan").hide();

    $(".container-kiri").show();
  }
});

// JavaScript media query simulation
function applyMediaQuery() {
  var viewportWidth = window.innerWidth;
  var selectedOption = document.getElementById("kategori").value;

  if (viewportWidth > 576) {
    // Display container-kiri and container-kanan for larger screens
    document.querySelector(".container-kiri").style.display = "block";
    document.querySelector(".container-kanan").style.display = "block";
  } else {
    if (selectedOption === "kum-ceritaku") {
      document.querySelector(".container-kiri").style.display = "none";
      document.querySelector(".container-kanan").style.display = "block";
    } else if (selectedOption === "kum-cerita") {
      document.querySelector(".container-kiri").style.display = "block";
      document.querySelector(".container-kanan").style.display = "none";
    }
  }
}

// Initial call to apply media query on page load
applyMediaQuery();

// Event listener for window resize to reapply media query
window.addEventListener("resize", applyMediaQuery);
