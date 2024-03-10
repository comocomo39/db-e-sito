<html>
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
  $q = "SELECT Nome from Artista where ID_Artista= '$id';";
  $result = $conn->query($q);
  if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
      $nome = $row['Nome'];
        echo "$nome";
    }
  }
   ?></h3>
<?php

if(isset($_GET["id"]))
{  
$id = $_GET["id"];
$sql = "SELECT ID_Album, Album_Artista.Nome as NomeAlbum, Album_Artista.Lingua, Album_Artista.Data, Album_Artista.Durata, Artista.Nome as NomeArtista from Album_Artista, Artista where ID_Artista = '$id' and ID_Artista = codiceA";
$result = $conn->query($sql);
if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        $idalbum = $row["ID_Album"];
        echo "<tr><td>" . "<a href = 'album_ar.php?id=$idalbum'>".$row['NomeAlbum']."</a>". "</td><td>" . $row["Lingua"]. "</td><td>" . $row["Data"]. "</td><td>". $row["Durata"] . "</td></tr>";
    }
        echo "</table>";
    }
    else {
        echo "0 results";
    }
    
}

?>
</html>