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
      
    if(recensioneEsisteAR($conn, $utente, $fkalbum) === false)
     {
        header ("location: recensionear.php?error=nonvotato&id=$fkalbum");
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
    $sql = "UPDATE recensione_ar SET Intestazione = '$titolo', Corpo = '$corpo', voto = '$voto' where FK_ALBUM_AR = '$fkalbum' and FK_Utente = '$utente'";
    if (mysqli_query($conn, $sql)) {
        $fkalbum = $_GET["id"];
        mysqli_close($conn);
        header("location: recensionear.php?id=$fkalbum&error=aggiornato");
        exit;
    } 
    else {

        echo "Errore aggiornamento";
    }

}
else {
    $fkalbum = $_GET["id"];
    header ("location: recensionear.php?error=nonloggato&id=$fkalbum");
        exit();
}


?>