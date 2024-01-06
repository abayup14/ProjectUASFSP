<?php 
    require_once("class/cerita.php");

    if (isset($_POST["iduser"]) && isset($_POST["start"])) {
        $iduser = $_POST["iduser"];
        $start = $_POST["start"];
        $perpage = $_POST["perpage"];

        $array = array();

        $cerita = new Cerita();
        // $res = $cerita->getAllCeritaById($iduser, $start, $perpage);
        $res = $cerita->getAllCeritaOther($iduser, $start, $perpage);
        while ($row = $res->fetch_assoc()) {
            $array[] = $row;
        }
        echo json_encode($array);
    } else {
        echo json_encode(array("error"));
    }
?>