<?php
require_once 'header.php';
require_once 'db.inc.php';
?>
<html>

<table class="table table-striped">
    <tr>
      <th>Nome Album</th>
      <th>Intestazione</th>
      <th>Corpo</th>
      <th>Voto</th>
    </tr>
<?php
     
     if(isset($_SESSION["nomeUtente"]))
     {
      echo "<b>Profilo di " . $_SESSION["nomeUtente"] . "</b";
     
    $nome = $_SESSION["nomeUtente"];

     $sql1 = "SELECT Nome, Intestazione, Corpo, Voto FROM Recensione_Ar, Album_Artista where FK_Utente = '$nome' and FK_Album_Ar = ID_Album";
     $result1 = $conn->query($sql1);
     if($result1 -> num_rows >0 ){
      while($row1 = $result1 -> fetch_assoc()){
          echo "<tr><td>" . $row1["Nome"]. "</td><td>". $row1["Intestazione"]. "</td><td>". $row1["Corpo"]. "</td><td>". $row1["Voto"]. "</td></tr>";
         }
      }
      $sql2 = "SELECT Nome, Intestazione, Corpo, Voto FROM Recensione_Gr, Album_Gruppo where FK_Utente = '$nome' and FK_Album_Gr = ID_Album";
      $result2 = $conn->query($sql2);
         if($result2 -> num_rows >0 ){
             while($row2 = $result2 -> fetch_assoc()){
              echo "<tr><td>" . $row2["Nome"]. "</td><td>". $row2["Intestazione"]. "</td><td>". $row2["Corpo"]. "</td><td>". $row2["Voto"]. "</td></tr>";
             }
             echo "</table>";
             }

            }
  ?>
  <div class = "fondobottone">
          </br>
<form action = profilo.inc.php method = "POST">
  <button type ="submit" name ="submit">Elimina profilo<br></button>
</div>
  </html>