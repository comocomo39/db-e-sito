<html>
<table class="table table-bordered">
    <tr>
      <th>Nome Album</th>
      <th>Nome Gruppo</th>
      <th>Lingua</th>
      <th>Anno Uscita</th>
      <th>Durata</th>
      </tr>
<?php
require_once 'header.php';
require_once 'db.inc.php';

if(isset($_GET["id"]))
{
$id = $_GET["id"];
$sql = "SELECT Album_Gruppo.Nome as NomeAlbum, ID_Gruppo, Gruppo.Nome as NomeGruppo, Album_Gruppo.Lingua, Album_Gruppo.Data, Album_Gruppo.Durata from Album_Gruppo, Gruppo where ID_Album = '$id' and codiceG = ID_Gruppo";
$result = $conn->query($sql);
if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        $idgruppo = $row["ID_Gruppo"];
        echo "<tr><td>" . $row["NomeAlbum"]. "</td><td>". "<a href = 'gruppo.php?id=$idgruppo'>".$row['NomeGruppo']."</a>" . "</td><td>" . $row["Lingua"]. "</td><td>" . $row["Data"]. "</td><td>". $row["Durata"] . "</td></tr>";
    }
        echo "</table>";
    }
    else {
        echo "0 results";
    }
}
?>
  <table class="table table-striped">
    <tr>
<th>NTracklist</th>
      <th>Nome Canzone</th>
      </tr>
      
<?php
echo "<br>";
$q = "SELECT Ntracklist, canzone_gruppo.Nome from canzone_gruppo, Album_Gruppo where FK_ALBUMGRUPPO = '$id' and ID_Album = '$id'";
$r = $conn->query($q);
if($r -> num_rows >0 ){
    while($rows = $r -> fetch_assoc()){
        echo "<tr><td>" . $rows["Ntracklist"]. "</td><td>". $rows["Nome"]. "</td></tr>";
    }
    echo "</table>";
}

?>

<table class="table table-bordered">
    <tr>
      <th>Utente</th>
      <th>Voto</th>
      <th>Titolo</th>
      <th>Corpo</th>
    </tr>

<?php

echo "<br>Recensioni fatte da utenti rivolte a questo album:";
$sq = "SELECT FK_Utente, Intestazione, Corpo, voto from recensione_gr where FK_Album_GR = '$id';";
$res = $conn->query($sq);
if($res -> num_rows >0 ){
    while($riga = $res -> fetch_assoc()){
        echo "<tr><td>" . $riga["FK_Utente"]. "</td><td>". $riga["voto"]. "</td><td>". $riga["Intestazione"] . "</td><td>". $riga["Corpo"] ."</td></tr>";
    }
    echo "</table>";
}





$conn -> close();
?>

<p>Vuoi recensire questo disco? Premi sul bottone!</p>
<form action="recensionegr.php?id=<?php echo $id ?>" method="post">
    <input id="submit" type="submit" value="Recensione!">
   </form>
</html>