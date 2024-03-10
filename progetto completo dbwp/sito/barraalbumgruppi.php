<?php 
require_once 'header.php';
require_once 'db.inc.php';
?>
<table class="table table-bordered">
    <tr>
      <th>Risultato ricerca album:</th>
</tr>

<?php
mysqli_select_db($conn, "progetto")or die(mysql_error());

$ricerca = mysqli_real_escape_string($conn, $_REQUEST['search']);    

$result = mysqli_query($conn, "SELECT Nome, ID_Album FROM Album_Gruppo where Nome Like '%".$ricerca."%'");
while ($row = mysqli_fetch_assoc($result)) {
    $id = $row['ID_Album'];
    echo "<tr><td>" . "<a href = 'album_gr.php?id=$id'>".$row['Nome']."</a>" . "</tr></td>";
     }