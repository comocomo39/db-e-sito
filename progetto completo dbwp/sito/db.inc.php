<?php
//i dati del database
$hostname = "localhost";
$username = "amministratore";
$password = "password";
$dbname = "progetto";

// creazione connessione
$conn = new mysqli($hostname,$username, $password, $dbname);// Check connessione

if ($conn === false){
  die("Connection failed: " . $dbc->check_error);
}
