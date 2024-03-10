<?php
require_once 'header.php';
?>
<html>
<section class = "registrazione form">
  <h2>Benvenuto! Registrati per poter recensire i tuoi album preferiti.</h2>
  <div class ="signup form-form"> 
 <form action = "registrazione.inc.php" method = "post">
 <input type ="text" name = "nomeUtente" placeholder ="Nome utente...">
 <input type ="email" name = "email" placeholder ="Email...">
 <input type ="password" name = "pwd" placeholder ="Password...">
 <input type ="password" name = "pwdrepeat" placeholder ="Ripeti password...">
 <button type ="submit" name ="submit">Registrati</button>
</form>
</class>
<?php

if (isset($_GET["error"])) {
     if($_GET["error"] == "emptyInput"){
      echo "<p> Riempi tutti i campi</p>";
     }
     else if($_GET["error"] == "invaliduid"){
      echo "<p>Nome utente non valido</p>";
     }
     else if($_GET["error"] == "invalidemail"){
      echo "<p>Email non valida</p>";
     }
     else if($_GET["error"] == "passwordnotmatch"){
      echo "<p>La password non corrisponde!</p>";
     }
     else if($_GET["error"] == "usernametaken"){
      echo "<p>Nome utente gia presente</p>";
     }
     else if($_GET["error"] == "none"){
      echo "<p>Registrazione effettuata con successo!</p>";
     }
}

?>
</section>

<body>

  </body>
  </html>
