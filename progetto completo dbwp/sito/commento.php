<?php
require_once 'header.php';
require_once 'db.inc.php';
 ?>
 <html>
 <p>Thread origine:</p>
 <table class="table table-bordered">
    <tr>
      <th>Intestazione</th>
      <th>Corpo</th>
      <th>Utente</th>
      </tr>
<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
      $sql = "SELECT ID_Thread, Intestazione, Corpo, Fk_Utente as Utente FROM THREAD where ID_Thread = $id";
$result = $conn->query($sql);

if($result -> num_rows >0 ){
  while($row = $result -> fetch_assoc()){
    $id = $row['ID_Thread'];
    echo "<tr><td>" .$row['Intestazione'] . "</td><td>". $row["Corpo"]. "</td><td>" . $row["Utente"].  "</td></tr>";
  }
  echo "</table>";
  }
}
?>
   <table class="table table-bordered">
    <tr>
      <th>Corpo</th>
      <th>Utente</th>
      </tr>
<?php


if(isset($_GET["id"]))
{
$id = $_GET["id"];
$sql = "SELECT Corpo, FK_Utente from commento where FK_Thread = '$id'";
$result = $conn->query($sql);
if($result -> num_rows >0 ){
    while($row = $result -> fetch_assoc()){
        echo "<br>" ."<tr><td>" . $row["Corpo"]. "</td><td>". $row["FK_Utente"]. "</td></tr>";
    }
        echo "</table>";
    }
}

?>
<p> Se vuoi commentare, usa il form!</p>
<form action = "commento.inc.php?id=<?php echo $id ?>" method = "post">
    <input type ="text" name = "corpo" placeholder ="commento...">
    <button type ="submit" name ="submit">Crea!</button>
   </form>

<?php
if (isset($_GET["error"])) {
  if($_GET["error"] == "vuoto"){
   echo "<p>Hai lasciato il form vuoto</p>";
  }
  else if($_GET["error"] == "nonloggato"){
      echo "<p>Devi loggarti per commentare!!</p>";
     }
}

?>
</html>