<htmò>
<table class="table table-striped">
    <tr>
      <th>Nome Album</th>
      <th>Lingua</th>
      <th>Anno Uscita</th>
      <th>Durata</th>
      </tr>

      <?php
      require_once 'header.php';
      require_once 'db.inc.php';

      if(isset($_GET["id"]))
      $id = $_GET["id"];
 ?>
      <h3><?php 
  $q = "SELECT Nome from Gruppo where ID_Gruppo= '$id';";
  $result = $conn->query($q);
  if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
      $nome = $row['Nome'];
        echo "$nome";
    }
  }
   ?></h3>
   <h3>formati da - <?php 
  $q = "SELECT Artista.Nome as NomeArtista from Artista,Gruppo, formazione where FK_ARTISTA = ID_Artista and ID_Gruppo= '$id' and ID_Gruppo = FK_GRUPPO;";
  $result = $conn->query($q);
  if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
      $nome = $row['NomeArtista'];
        echo "$nome";
        echo " - ";
    }
  }
   ?></h3>
<?php

if(isset($_GET["id"]))
{  
$id = $_GET["id"];
$sql = "SELECT ID_Album, Album_Gruppo.Nome as NomeAlbum, Album_Gruppo.Lingua, Album_Gruppo.Data, Album_Gruppo.Durata, Gruppo.Nome as NomeGruppo from Album_Gruppo, Gruppo where ID_Gruppo = '$id' and ID_Gruppo = codiceG";
$result = $conn->query($sql);
if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        $idalbum = $row["ID_Album"];
        echo "<tr><td>" . "<a href = 'album_gr.php?id=$idalbum'>".$row['NomeAlbum']."</a>". "</td><td>" . $row["Lingua"]. "</td><td>" . $row["Data"]. "</td><td>". $row["Durata"] . "</td></tr>";
    }
        echo "</table>";
    }
    else {
        echo "0 results";
    }
    
}

?>
</html>