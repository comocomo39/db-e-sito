<?php

function inputVuotoRegistrazione($nomeutente, $email, $pwd, $pwdrepeat)
{
    $result;
    if (empty($nomeutente) || empty($email) || empty($pwd) || empty($pwdrepeat)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function nomeUtenteNonValido($nomeutente)
{
    $result;
    if (!preg_match("/^[a-zA-Z0-9]*$/", $nomeutente)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function emailNonValida($email)
{
    $result;
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function passwordMatch($pwd, $pwdrepeat)
{
    $result;
    if ($pwd !== $pwdrepeat) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function utenteEsiste($conn, $nomeutente, $email)
{
    $sql = "SELECT * FROM UTENTE WHERE nomeutente = ? or email = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: registrazione.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "ss", $nomeutente, $email);
     mysqli_stmt_execute($stmt);

     $resultData = mysqli_stmt_get_result($stmt);

     if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
     }
     else {
        $result = false;
        return $result;
     }

     mysqli_stmt_close($stmt); 

}
function creaUtente($conn, $nomeutente, $email, $pwd)
{
    $sql = "INSERT INTO UTENTE (NomeUtente, Email, Password) values (?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: registrazione.php?error=stmtfailed");
    exit();
    }
    $hashedPwd = password_hash($pwd, PASSWORD_DEFAULT);

     mysqli_stmt_bind_param($stmt, "sss", $nomeutente, $email, $hashedPwd);
     mysqli_stmt_execute($stmt);
     mysqli_stmt_close($stmt); 
     header ("location: registrazione.php?error=none");
     exit();
}

function inputLoginVuoto($nomeutente, $pwd)
{
    $result;
    if (empty($nomeutente) || empty($pwd)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function loginUtente($conn, $nomeutente, $pwd)
{
  $utenteEsiste = utenteEsiste($conn, $nomeutente, $nomeutente);

if ($utenteEsiste === false) {
    header ("location: login.php?error=wronglogin");
        exit();
}

$pwdhashed = $utenteEsiste["Password"];
$checkpwd = password_verify($pwd, $pwdhashed);

if ($checkpwd === false) {
    header ("location: login.php?error=wronglogin");
        exit();
}
else if ($checkpwd === true)
{
    session_start();
    $_SESSION["nomeUtente"] = $utenteEsiste["NomeUtente"];
    header ("location: index.php");
        exit();


}
}
function recensioneVuota($voto)
{
    $result;
    if (empty($voto)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}
function votoNonValido($voto)
{
    $result;
    if ($voto >9 or $voto <0) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function aggiungirecensioneAR($conn, $utente, $fkalbum, $titolo, $corpo, $voto)
{
    $sql = "INSERT INTO recensione_ar (FK_Utente, FK_Album_AR, Intestazione, Corpo, voto) values (?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: recensionear.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "sissi", $utente, $fkalbum, $titolo, $corpo, $voto);
     mysqli_stmt_execute($stmt);
     mysqli_stmt_close($stmt); 
     header ("location: recensionear.php?error=none&id=$fkalbum");
     exit();
}
function aggiungirecensioneGR($conn, $utente, $fkalbum, $titolo, $corpo, $voto)
{
    $sql = "INSERT INTO recensione_gr (FK_Utente, FK_Album_GR, Intestazione, Corpo, voto) values (?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: recensionegr.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "sissi", $utente, $fkalbum, $titolo, $corpo, $voto);
     mysqli_stmt_execute($stmt);
     mysqli_stmt_close($stmt); 
     header ("location: recensionegr.php?error=none&id=$fkalbum");
     exit();
}
function recensioneEsisteAR($conn, $nomeutente, $fkalbum)
{
    $sql = "SELECT * FROM recensione_ar WHERE FK_Utente = ? and FK_Album_AR = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: recensionear.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "ss", $nomeutente, $fkalbum);
     mysqli_stmt_execute($stmt);

     $resultData = mysqli_stmt_get_result($stmt);

     if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
     }
     else {
        $result = false;
        return $result;
     }

     mysqli_stmt_close($stmt); 

}
function recensioneEsisteGR($conn, $nomeutente, $fkalbum)
{
    $sql = "SELECT * FROM recensione_gr WHERE FK_Utente = ? and FK_Album_GR = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: recensionegr.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "ss", $nomeutente, $fkalbum);
     mysqli_stmt_execute($stmt);

     $resultData = mysqli_stmt_get_result($stmt);

     if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
     }
     else {
        $result = false;
        return $result;
     }

     mysqli_stmt_close($stmt); 

}

function aggiungiThread($conn, $titolo, $corpo, $utente)
{
    $sql = "INSERT INTO thread (Intestazione, Corpo, FK_Utente) values (?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: community.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "sss", $titolo, $corpo, $utente);
     mysqli_stmt_execute($stmt);
     mysqli_stmt_close($stmt); 
     header ("location: community.php?error=none");
     exit();
}
function aggiungiCommento($conn, $corpo, $fkthread, $utente)
{
    $sql = "INSERT INTO commento (Corpo, FK_Thread, FK_Utente) values (?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header ("location: commento.php?error=stmtfailed");
    exit();
    }
     mysqli_stmt_bind_param($stmt, "sss", $corpo, $fkthread, $utente);
     mysqli_stmt_execute($stmt);
     mysqli_stmt_close($stmt); 
     header ("location: commento.php?error=none&id=$fkthread");
     exit();
}
function commentovuoto($corpo)
{
    $result;
    if (empty($corpo)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}
function threadvuoto($titolo, $corpo)
{
    $result;
    if (empty($corpo) || empty($titolo)) {
      $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}