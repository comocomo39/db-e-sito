<html>
<?php
require_once 'header.php';
?>
<head>
<link rel="stylesheet" href="style.css">
</head>
<body>
  
 <div class="immagine-body">
   <a href="index.php"><img src="logo.png" alt="" width="200" height="200" align=left ></a>
 </div>
 <p class = "testo_iniziale">
   <b>Benvenuti su Discogenix!</b> <br>
   Questo è un sito che si occupa di recensioni in ambito musicale. <br>
   Registrati e/o accedi per usufruire di tutte le funzionalità della piattaforma. <br>
   Per recensire gli album, usa la barra!<br> Puoi cercare tra album fatti da solisti e album fatti da un gruppo.
</p>

<p class = "messaggio-benvenuto">
<?php
     
     if(isset($_SESSION["nomeUtente"]))
     {
      echo "<b> Benvenuto " . $_SESSION["nomeUtente"] . "!" . "</b";
     }

  ?>
</p>
</body>
</html>
