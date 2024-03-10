<?php
require_once 'db.inc.php';
require_once 'functions.inc.php';
session_start();

if(isset($_POST["submit"], $_SESSION["nomeUtente"], $_GET["id"]))
{    
    $fkalbum = $_GET["id"];
    $utente = $_SESSION["nomeUtente"];
    $titolo = $_POST["titolo"];
    $corpo= $_POST["corpo"];
    $voto= $_POST["voto"];
      
    if(recensioneEsisteAR($conn, $utente, $fkalbum))
     {
        header ("location: recensionear.php?error=giavotato&id=$fkalbum");
        exit();
    }
    
    if(recensioneVuota($voto) !== false)
    {
        header ("location: recensionear.php?error=votovuoto&id=$fkalbum");
        exit();
    }
     
     if(votoNonValido($voto) !==false)
     {
        header ("location: recensionear.php?error=votononvalido&id=$fkalbum");
        exit();
     }
    aggiungirecensioneAR($conn, $utente, $fkalbum, $titolo, $corpo, $voto);
}
else {
    header ("location: recensionear.php?error=nonloggato");
        exit();
}
?>