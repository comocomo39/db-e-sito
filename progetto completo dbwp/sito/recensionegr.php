<?php
require_once 'header.php';
require_once 'db.inc.php';
?>
<html>
<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
}
?>

<section class = "recensione form">
  <h2>Scrivi la tua recensione di <?php 
  $q = "SELECT Nome from Album_Gruppo where ID_Album = '$id';";
  $result = $conn->query($q);
  if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
      $nome = $row['Nome'];
        echo "$nome";
    }
  }
   ?>!<br>I voti vanno da 0 a 9</h2>
  <div class ="rec form-form"> 
 <form action = "recensionegr.inc.php?id=<?php echo $id ?>" method = "post">
 <input type ="text" name = "titolo" placeholder ="Titolo recensione...">
 <input type ="text" name = "corpo" placeholder ="Corpo...">
 <input type ="number" name = "voto" placeholder ="Voto...">
 <button type ="submit" name ="submit">Vota!</button>
</form>
 <p><br>Hai effettuato la tua recensione e vuoi cambiarla? Usa il form sottostante!</p>
<form action = "updaterecensionegr.inc.php?id=<?php echo $id ?>" method = "post">
 <input type ="text" name = "titolo" placeholder ="Titolo recensione...">
 <input type ="text" name = "corpo" placeholder ="Corpo...">
 <input type ="number" name = "voto" placeholder ="Voto...">
 <button type ="submit" name ="submit">Aggiorna la tua recensione!</button>
</form>
</class>
<?php
if (isset($_GET["error"])) {
     if($_GET["error"] == "votovuoto"){
      echo "<p>Non hai messo il voto!</p>";
     }
     else if($_GET["error"] == "giavotato"){
      echo "<p>Hai gia una recensione per quel album! Puoi aggiornarla sotto</p>";
     }
      else if($_GET["error"] == "votononvalido"){
        echo "<p>Attenzione! I voti possibili vanno da 0 a 9! </p>";
     }else if($_GET["error"] == "none"){
        echo "<p>Ottimo! Hai effettuato la tua recensione!</p>";
       }
       else if($_GET["error"] == "nonloggato"){
        echo "<p>Loggati per recensire</p>";
       }
       else if($_GET["error"] == "aggiornato"){
        echo "<p>Hai aggiornato la tua recensione!</p>";
       }
       else if($_GET["error"] == "nonvotato"){
        echo "<p>Prima di poter aggiornare una recensione, dovresti averne una!</p>";
       }
}

?>

</section>
</html>