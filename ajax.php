<?php 
    require_once("class/cerita.php");

    if (isset($_POST["idUser"]) && isset($_POST["currPar"])) {
        $idUser = $_POST["idUser"];
        $currPar = $_POST["currPar"];

        $array = array();

        $cerita = new Cerita();
        // $res = $cerita->getAllCeritaById($idUser);
        $res = $cerita->getAllCeritaOther($idUser);
        while ($row = $res->fetch_assoc()) {
            $array[] = $row;
        }
        echo json_encode($array);
    }
?>