<?php 
    require_once("class/cerita.php");

    if (isset($_POST["iduser"]) && isset($_POST["start"])) {
        $iduser = $_POST["iduser"];
        $start = $_POST["start"];
        $perpage = $_POST["perpage"];

        $array = array();

        $cerita = new Cerita();
        $res = $cerita->getAllCeritaUser($iduser, $start, $perpage);
        while ($row = $res->fetch_assoc()) {
            $judul = $row["judul"];
            $nama = $row["nama"];
            $idcerita = $row["idcerita"];
            $jumparagraf = $cerita->getCountParagraf($idcerita);
            while ($row2 = $jumparagraf->fetch_assoc()) {
                $count = $row2["jum_paragraf"];
                $data_cerita = array("idcerita"=>$idcerita, "judul"=>$judul, "nama"=>$nama, "jum_paragraf"=>$count);
            }
            $array[] = $data_cerita;
        }
        echo json_encode($array);
    } else {
        echo json_encode(array("error"));
    }
?>