<?php
require_once 'header.php';
require_once 'db.inc.php';
?>
  <html>
  <table class="table table-striped">
    <tr>
      <th>Nome Album</th>
      <th>Nome Artista</th>
      <th>Voto Medio</th>
    </tr>
  <?php 


$sql = "SELECT album_gruppo.nome AS NomeAlbum, gruppo.nome AS NomeArtista, Avg(voto) AS votazione
FROM album_gruppo, recensione_gr, gruppo
WHERE id_album = fk_album_gr AND codiceg = id_gruppo
GROUP BY nomealbum
UNION
SELECT album_artista.nome AS NomeAlbum, artista.nome AS NomeArtista, Avg(voto) AS votazione
FROM album_artista, recensione_ar, artista
WHERE id_album = fk_album_ar AND codicea = id_artista
GROUP BY nomealbum
ORDER BY votazione DESC";
$result = $conn->query($sql);

if($result -> num_rows >0 ){
while($row = $result -> fetch_assoc()){
    echo "<tr><td>" . $row["NomeAlbum"]. "</td><td>". $row["NomeArtista"]. "</td><td>" . $row["votazione"]. "</td></tr>";
}
echo "</table>";
}
else {
    echo "0 results";
}

$conn -> close();
  ?> 
</table>
</body>
</html>

</html>