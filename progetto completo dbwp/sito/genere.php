<?php
require_once 'header.php';
require_once 'db.inc.php';
?>
<html>
      <table class="table table-hover">
    <tr>
      <th>Nome genere</th>
      <th>Descrizione</th>
    </tr>
  <?php 

$sql = "SELECT ID_Genere, Nome, Descrizione FROM GENERE";
$result = $conn->query($sql);

if($result -> num_rows >0 ){
  while($row = $result -> fetch_assoc()){
      $id = $row['ID_Genere'];
      echo "<tr><td>" . "<a href = 'albumgenere.php?id=$id'>".$row['Nome']."</a>" . "</td><td>". $row["Descrizione"]. "</td></tr>";

  }
  echo "</table>";
  }
  else {
      echo "0 results";
  }
  
  $conn -> close();
    ?> 

</body>
</html>
