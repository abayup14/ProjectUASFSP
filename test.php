<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
</head>
<body>
    <?php
        if (isset($_SESSION["iduser"])) {
            $iduser = $_SESSION["iduser"];
            echo $iduser;
        } else {
            echo "Data not found";
        }
        
    ?>
</body>
</html>
