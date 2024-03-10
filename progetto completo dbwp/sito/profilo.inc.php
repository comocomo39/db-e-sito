<?php
require_once 'db.inc.php';
session_start();

if(isset($_POST["submit"], $_SESSION["nomeUtente"]))
{
    $utente = $_SESSION["nomeUtente"];
     
    $sql = "DELETE from UTENTE where NomeUtente = '$utente'";

    if (mysqli_query($conn, $sql)) {
        session_unset();
        session_destroy();
        mysqli_close($conn);
        header('location: index.php');
        exit;
    } else {

        echo "Errore eliminazione utente";
    }

}
else {
    header('location: index.php');
}
