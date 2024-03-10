<?php
require_once 'db.inc.php';
require_once 'functions.inc.php';
session_start();

if(isset($_POST["submit"], $_SESSION["nomeUtente"]))
{
    $utente = $_SESSION["nomeUtente"];
    $titolo = $_POST["titolo"];
    $corpo = $_POST["corpo"];
    if(threadvuoto($titolo, $corpo !== false))
    {
        header ("location: community.php?error=vuoto");
        exit();
    }
     aggiungiThread($conn, $titolo, $corpo, $utente);
    }
else {
    header ("location: community.php?error=nonloggato");
        exit();
}