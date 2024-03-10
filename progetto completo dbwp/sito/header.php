<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


</head>

<body>
<div class="topnav">
<a href="index.php"> <img src="logo.png"  width="30" height="30" > </a>
  <a href="classifica.php">classifiche</a>
  <a href="genere.php">generi</a>
  <a href="community.php">community</a>
  <div class="album-gruppo">
    <form action="barraalbumartisti.php" method = "GET">
      <input type="text" placeholder="cerca album solisti" name="search">
      <button type="submit" style="display: none;"><i class="fa fa-search"></i></button>
    </form>
</div>
 <div class = "album-artista">
    <form action="barraalbumgruppi.php" method = "GET">
      <input type="text" placeholder="cerca album gruppi" name="search">
      <button type="submit" style="display: none;"><i class="fa fa-search"></i></button>
    </form>
</div>

  <div class = "profilo">
  <?php
     if(isset($_SESSION["nomeUtente"]))
     {
      echo "<a href = 'profilo.php' style='text-decoration:none'>profilo</a>";
      echo "<a href = 'logout.inc.php' style='text-decoration:none'>log out</a>";
     }
     else 
     {
      echo "<a href = 'registrazione.php' style='text-decoration:none'>registrati</a>";
      echo "<a href = 'login.php' style='text-decoration:none'>login</a>";
     }

  ?>
  </div>
  </div>
    </body>
</html>