<?php
require_once 'header.php';
require_once 'db.inc.php';
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
}
?>
<hmtl>
    <p> Ecco gli album presenti del genere <?php
    $sql = "SELECT Nome From Genere where ID_Genere = '$id';";
    $result = $conn->query($sql);
    if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        $nome = $row["Nome"];
        echo "$nome";
    }
}

     ?></p>
      <table class="table table-hover">
    <tr>
      <th>Nome Album</th>
      <th>Lingua</th>
      <th>Anno Uscita</th>
      <th>Durata</th>
      </tr>

<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
$sql = "SELECT album_gruppo.Nome as Nome, album_gruppo.Lingua as Lingua, album_gruppo.Data as Data, album_gruppo.Durata as Durata
FROM album_gruppo,genere,descrizione_al_gr
WHERE genere.ID_Genere = '$id' AND genere.ID_Genere = descrizione_al_gr.FK_GENERE AND descrizione_al_gr.FK_ALBUM = album_gruppo.ID_Album
group by Nome
UNION
SELECT album_artista.Nome as Nome, album_artista.Lingua as Lingua, album_artista.Data as Data, album_artista.Durata as Durata
FROM album_artista,genere,descrizione_al_ar
WHERE genere.ID_Genere = '$id' AND genere.ID_Genere = descrizione_al_ar.FK_GENERE AND descrizione_al_ar.FK_ALBUM = album_artista.ID_Album
group by Nome
ORDER BY Nome DESC
";
$result = $conn->query($sql);
if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        echo "<tr><td>" . $row["Nome"]. "</td><td>". $row["Lingua"]. "</td><td>" . $row["Data"]. "</td><td>". $row["Durata"] ."</td></tr>";
    }
        echo "</table>";    
    }
    else {
        echo "0 results";
    }

}
?>

</html>
