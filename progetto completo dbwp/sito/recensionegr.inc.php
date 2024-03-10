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
      
    if(recensioneEsisteGR($conn, $utente, $fkalbum))
     {
        header ("location: recensionegr.php?error=giavotato&id=$fkalbum");
        exit();
    }
    
    if(recensioneVuota($voto) !== false)
    {
        header ("location: recensionegr.php?error=votovuoto&id=$fkalbum");
        exit();
    }
     
     if(votoNonValido($voto) !==false)
     {
        header ("location: recensionegr.php?error=votononvalido&id=$fkalbum");
        exit();
     }
    aggiungirecensioneGR($conn, $utente, $fkalbum, $titolo, $corpo, $voto);
}
else {
    header ("location: recensionegr.php?error=nonloggato");
        exit();
}
?>