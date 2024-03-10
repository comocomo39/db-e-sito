<?php
require_once 'db.inc.php';
require_once 'functions.inc.php';

if (isset($_POST["submit"])) {
    

$nomeutente = $_POST["nomeUtente"];
$email = $_POST["email"];
$pwd = $_POST["pwd"];
$pwdrepeat = $_POST["pwdrepeat"];



if (inputVuotoRegistrazione($nomeutente, $email, $pwd, $pwdrepeat) !== false) {
    header ("location: registrazione.php?error=emptyInput");
    exit();
    
}
if (nomeUtenteNonValido($nomeutente) !== false) {
    header ("location: registrazione.php?error=invaliduid");
    exit();
    
}
if (emailNonValida($email) !== false) {
    header ("location: registrazione.php?error=invalidemail");
    exit();
    
}
if (passwordMatch($pwd, $pwdrepeat) !== false) {
    header ("location: registrazione.php?error=passwordnotmatch");
    exit();
    
}
if (utenteEsiste($conn, $nomeutente, $email) !== false) {
    header ("location: registrazione.php?error=usernametaken");
    exit();
    
}

creaUtente($conn, $nomeutente, $email, $pwd);
}

else {
    header ("location: registrazione.php");
    exit();
}