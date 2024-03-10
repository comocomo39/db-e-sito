<?php
require_once 'header.php';
?>
<html>
<section class = "registrazione form">
  <h2>Log in</h2>
  <div class ="signup form-form"> 
 <form action = "login.inc.php" method = "post">
 <input type ="text" name = "nomeUtente" placeholder ="Nome utente/Email...">
 <input type ="password" name = "pwd" placeholder ="Password...">
 <button type ="submit" name ="submit">Log in</button>
</form>
</class>
<?php
if (isset($_GET["error"])) {
     if($_GET["error"] == "emptyInput"){
      echo "<p> Riempi tutti i campi</p>";
     }
     else if($_GET["error"] == "wronglogin"){
      echo "<p>Login non valido</p>";
     }
}
?>
</section>
  </html>