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