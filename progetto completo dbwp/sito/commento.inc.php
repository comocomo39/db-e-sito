<?php
require_once 'db.inc.php';
require_once 'functions.inc.php';
session_start();

if(isset($_POST["submit"], $_SESSION["nomeUtente"], $_GET["id"]))
{
    $fkthread = $_GET["id"];
    $utente = $_SESSION["nomeUtente"];
    $corpo = $_POST["corpo"];

    if(commentovuoto($corpo) !== false)
    {
        header ("location: commento.php?error=vuoto&id=$fkthread");
        exit();
    }
     aggiungiCommento($conn, $corpo, $fkthread, $utente);

    }
else {
    $fkthread = $_GET["id"];
    header ("location: commento.php?error=nonloggato&id=$fkthread");
        exit();
}