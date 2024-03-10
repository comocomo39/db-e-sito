<?php
require_once 'header.php';
require_once 'db.inc.php';
?>
<html>
  <p> Se vuoi creare un thread, usa il form!</p>
<form action = "community.inc.php" method = "post">
    <input type ="text" name = "titolo" placeholder ="Titolo thread">
    <input type ="text" name = "corpo" placeholder ="Corpo thread">
    <button type ="submit" name ="submit">Crea!</button>
   </form>
   <table class="table table-hover">
      <br>
      <br>
    <tr>
      <th>Titolo</th>
      <th>Commento</th>
      <th>Utente</th>
    </tr>
    <?php 

$sql = "SELECT ID_Thread, Intestazione, Corpo, Fk_Utente as Utente FROM THREAD";
$result = $conn->query($sql);

if($result -> num_rows >0 ){
  while($row = $result -> fetch_assoc()){
    $id = $row['ID_Thread'];
    echo "<tr><td>" . "<a href = 'commento.php?id=$id'>".$row['Intestazione']."</a>" . "</td><td>". $row["Corpo"]. "</td><td>" . $row["Utente"].  "</td></tr>";
  }
  echo "</table>";
  }
  else {
      echo "0 results";
  }

  /*while ($row = mysqli_fetch_assoc($result)) {
    echo "<div id='link' onClick='addText(\"".$row['Nome']."\"); '>"."</div>";
    $id = $row['ID_Album'];
    echo "<a href = 'album_ar.php?id=$id'>".$row['Nome']."</a>";
     }
  */
  if (isset($_GET["error"])) {
    if($_GET["error"] == "nonloggato"){
     echo "<p>Devi loggarti per poter fare un thread!</p>";
    }
    else if($_GET["error"] == "vuoto"){
      echo "<p>Riempi gli spazi per creare un thread!</p>";
     }
  }
  $conn -> close();
    ?> 
    
</form>
</body>
</html>
