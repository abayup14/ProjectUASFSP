<?php 
    session_start();
    require_once("class/users.php");
    require_once("class/cerita.php");

    if(!isset($_SESSION['iduser'])){
        $domain= $_SERVER['HTTP_HOST'];
        $uri = $_SERVER['REQUEST_URI']; 
        $url = "http://".$domain.$uri;
        header("location: index.php?redirect=$url");
    } else {
        $iduser = $_SESSION["iduser"];
        $nama = $_SESSION["nama"];
    }
    
    if(isset($_GET["judul"])){
        $judul = $_GET["judul"];
    }
    else{
        $judul = "";
    }

    if (isset($_GET["judul"])) {
        $search = "%".$_GET["judul"]."%";
    } else {
        $search = "%";
    }
?>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kumpulan Cerita</title>
    <script src="js/jquery.js"></script>
    <style>
        .container{
            display: grid;
            grid-template-columns: 2fr 1fr;
        }
        .container-kumpulan-cerita{
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            border-right: 2px solid;
            padding: 20px
        }
        .container-ceritaku{
            display: grid;
            grid-template-columns: 1fr;
            gap: 10px;
            padding: 20px
        }
        .cerita{
            border: 1px solid;
        }
    </style>
</head>
<body>
    <h1>Selamat datang, <?php //echo $nama; ?></h1>
    <form action="homepage.php" method="GET">
        <p>
            <label>Cari Judul</label>
            <input type='text' name='judul' value='<?php //echo $judul; ?>'>
            <input type='submit' name='btncari' value='Cari'>
        </p>
    </form>
    <form action="new.php" method="GET">
        <p><input type="submit" value="Buat Cerita Baru" name="btnbaru"></p>
    </form> -->
    
    <?php
        $conn = new mysqli("localhost", "root", "", "project_uas_fsp");

        // $cerita = new Cerita();
        // $result = $cerita->getCerita($search);

        $perpage = 2;
        $total_data = $result->num_rows;
        $jumlah_page = ceil($total_data / $perpage);

        if(isset($_GET["p"])){
            $p = $_GET["p"];
        }
        else{
            $p = 1;
        }

        if(!is_numeric($p)) $p = 1; 

        echo "<input type='hidden' id='currPar' value='$p'>";


        // if ($p == 1) {
        //     echo "<button id='btnNextOther'>Tampilkan Cerita Selanjutnya</button>";
        // }

        // echo "<ul>";
        
        // echo "<li" . ($p == 1 ? " class='active'" : "") . "><a class='page' href='homepage.php?p=1&judul=$judul'>First</a></li>";

        // if ($p != 1){
        //     $x = $p-1;
        //     echo "<li><a class='page' href='homepage.php?p=$x&judul=$judul'>Prev</a></li>";
        // }
        
        // for($i=1;$i<=$jumlah_page;$i++){
        //     echo "<li" . ($p == $i ? " class='active'" : "") . "><a class='page' href='homepage.php?p=$i&judul=$judul'>$i</a></li>";
        // }

        // if ($p != $jumlah_page){
        //     $x = $p+1;
        //     echo "<li><a class='page' href='homepage.php?p=$x&judul=$judul'>Next</a></li>";
        // }
        
        // echo "<li" . ($p == $jumlah_page ? " class='active'" : "") . "><a class='page' href='homepage.php?p=$jumlah_page&judul=$judul'>Last</a></li>";
        // echo "</ul>";
        
        // if ($p != 1 && $p != $jumlah_page) {
        //     echo "<button id='btnPrevOther'>Tampilkan Cerita Sebelumnya</button>";
        //     echo "<button id='btnNextOther'>Tampilkan Cerita Selanjutnya</button>";
        // }

        if ($p == $jumlah_page) {
            echo "<button id='btnPrevOther'>Tampilkan Cerita Sebelumnya</button>";
        }

        $start = ($p-1) * $perpage;

        echo "<input type='hidden' id='iduser' value='$iduser'>";
        echo "<input type='hidden' id='perpage' value='$perpage'>";


        // echo "<header class='header'><h1>Cerbung</h1><p>Cerita Bersambung</p></header>";
        // echo "<div class='container-kiri'><h2>Kumpulan Cerita</h2>";
        $result = $cerita->getCeritaLimit($search, $start, $perpage);
        echo "<div class='container-kumpulan-cerita'>";
        while ($row = $result->fetch_assoc()) {
            $id_cerita = $row["idcerita"];
            echo "<div class='cerita'>";
            echo "<h3>".$row["judul"]."</h3>";
            echo "<p>".$row["nama"]."</p>";
            echo "<a href='read.php?idcerita=$id_cerita'>Lihat Cerita</a>";
            echo "</div>";
        }
        
        $conn->close();
    ?>
    <script src="ajax.js"></script>
    <p><a href="logout.php">Logout dari Website</a></p>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .container{
            display: grid;
            grid-template-columns: 2fr 1fr;
        }
        .container-kumpulan-cerita{
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            border-right: 2px solid;
            padding: 20px
        }
        .container-ceritaku{
            display: grid;
            grid-template-columns: 1fr;
            gap: 10px;
            padding: 20px
        }
        .cerita{
            border: 1px solid;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Cerbung</h1>
        <p>Cerita Bersambung</p>
    </header>
    <div class="container">

        <div class="container-kiri">
            <h2>Kumpulan Cerita</h2>
            <div class="container-kumpulan-cerita">
                <!-- // ini dummy item-cerita -->
                <div class="cerita">
                    <h3>Judul Cerita</h3>
                    <p>Pemilik Cerita:</p>
                    <a href="">Baca Lebih Lanjut</a>
                </div>
                <div class="cerita">
                    <h3>Judul Cerita</h3>
                    <p>Pemilik Cerita:</p>
                    <a href="">Baca Lebih Lanjut</a>
                </div>
                <div class="cerita">
                    <h3>Judul Cerita</h3>
                    <p>Pemilik Cerita:</p>
                    <a href="">Baca Lebih Lanjut</a>
                </div>
                <div class="cerita">
                    <h3>Judul Cerita</h3>
                    <p>Pemilik Cerita:</p>
                    <a href="">Baca Lebih Lanjut</a>
                </div>
            </div>
            <button class="btn-selanjutnya-lain">Tampilkan Cerita Selanjutnya</button>  
        </div>
          
        <div class="container-kanan">
            <h2>Ceritaku</h2>
            <div class="container-ceritaku">
                 <!-- ini dummy item-ceritaku -->
                <div class="cerita">
                    <h3>Judul Cerita</h3>
                    <a href="">Baca Lebih Lanjut</a>
                </div>
            </div>
            <button class="btn-selanjutnya-aku">Tampilkan Cerita Selanjutnya</button>   
        </div>
    </div>   
</body>
</html>