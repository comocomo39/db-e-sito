<?php
require_once 'db.inc.php';
require_once 'functions.inc.php';

if (isset($_POST["submit"])) {

    $nomeutente = $_POST["nomeUtente"];
    $pwd = $_POST["pwd"];

     if (inputLoginVuoto($nomeutente, $pwd) !== false) {
        header ("location: login.php?error=emptyInput");
        exit();
    }

    loginUtente($conn, $nomeutente, $pwd);
}
else {
    header ("location: login.php");
        exit();
}