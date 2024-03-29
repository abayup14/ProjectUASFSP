<?php
    session_start();
    require_once("class/cerita.php");
    require_once("class/users.php");

    if(!isset($_SESSION['iduser'])){
        $domain= $_SERVER['HTTP_HOST'];
        $uri = $_SERVER['REQUEST_URI']; 
        $url = "http://".$domain.$uri;
        header("location: index.php?redirect=$url");
    } else {
        $iduser = $_SESSION["iduser"];
        $nama = $_SESSION["nama"];
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kumpulan Cerita</title>
    <link rel="stylesheet" href="css/style.css">
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
    </script>
    
</head>
<body>
    <header class="header">
        <h1>Cerbung</h1>
        <p>Cerita Bersambung</p>
    </header>

    <form action="new.php" method="GET" class="form-btn-cerita-baru">
        <p><input type="submit" value="Buat Cerita Baru" name="btnbaru"></p>
    </form>

    <div class='combobox-smartphone'>
        <h3>Kategori:</h3>
        <select name="kategori" id="kategori">
            <option value="kum-ceritaku">Ceritaku</option>
            <option value="kum-cerita">Kumpulan Cerita</option>
        </select>
    </div>

    <div class="container">
        <div class="container-kiri">
            <h2 class="text">Kumpulan Cerita</h2>
            <div class="container-kumpulan-cerita">
                <?php 
                    $conn = new mysqli("localhost", "root", "", "project_uas_fsp");

                    $cerita = new Cerita();
                    $result = $cerita->getAllCeritaOther($iduser);
       
                    $perpage_kum_cerita = 4;
                    $total_data = $result->num_rows;
                    $jumlah_page = ceil($total_data / $perpage_kum_cerita);

                    $curr_page_kum_cerita = 1;
                    $start = ($curr_page_kum_cerita-1) * $perpage_kum_cerita;

                    $result = $cerita->getAllCeritaOther($iduser, $start, $perpage_kum_cerita);

                    while ($row = $result->fetch_assoc()) {
                        $judul = $row["judul"];
                        $nama = $row["nama"];
                        $idcerita = $row["idcerita"];
                        $count = 0;
                        $jumparagraf = $cerita->getCountParagraf($idcerita);
                        while ($row2 = $jumparagraf->fetch_assoc()) {
                            $count = $row2["jum_paragraf"];
                        }
                        echo "<div class='cerita'>";
                        echo "<h3>$judul</h3>";
                        echo "<p>Pemilik Cerita: $nama</p>";
                        echo "<p>Jumlah Paragraf: $count</p>";
                        echo "<p><a href='read.php?idcerita=$idcerita'>Baca Lebih Lanjut</a></p>";
                        echo "</div>";
                    }

                    echo "<input type='hidden' id='iduser-kum-cerita' value='$iduser'>";
                    echo "<input type='hidden' id='perpage-kum-cerita' value='$perpage_kum_cerita'>";
                    echo "<input type='hidden' id='currpar-kum-cerita' value='$curr_page_kum_cerita'>";
                ?>
            </div>
            <button class="btn-selanjutnya-lain">Tampilkan Cerita Selanjutnya</button>  
        </div>
          
        <div class="container-kanan">
            <h2 class="text">Ceritaku</h2>
            <div class="container-ceritaku">
                 <!-- ini dummy item-ceritaku -->
                 <?php 
                    $result = $cerita->getAllCeritaUser($iduser);
       
                    $perpage_ceritaku = 2;
                    $total_data = $result->num_rows;
                    $jumlah_page = ceil($total_data / $perpage_ceritaku);

                    $curr_page_ceritaku = 1;
                    $start = ($curr_page_ceritaku-1) * $perpage_ceritaku;

                    $result = $cerita->getAllCeritaUser($iduser, $start, $perpage_ceritaku);

                    while ($row = $result->fetch_assoc()) {
                        $judul = $row["judul"];
                        $idcerita = $row["idcerita"];
                        $count = 0;
                        $jumparagraf = $cerita->getCountParagraf($idcerita);
                        while ($row2 = $jumparagraf->fetch_assoc()) {
                            $count = $row2["jum_paragraf"];
                        }
                        echo "<div class='cerita'>";
                        echo "<h3>$judul</h3>";
                        echo "<p>Jumlah Paragraf: $count</p>";
                        echo "<p><a href='read.php?idcerita=$idcerita'>Baca Lebih Lanjut</a></p>";
                        echo "</div>";
                    }

                    echo "<input type='hidden' id='iduser-ceritaku' value='$iduser'>";
                    echo "<input type='hidden' id='perpage-ceritaku' value='$perpage_ceritaku'>";
                    echo "<input type='hidden' id='currpar-ceritaku' value='$curr_page_ceritaku'>";
                 ?>
            </div>
            <button class="btn-selanjutnya-aku">Tampilkan Cerita Selanjutnya</button>   
        </div>
    </div>
    
    <script src="ajax.js"></script>
    <p class="logout"><a href="logout.php">Logout dari Website</a></p>
</body>
</html>