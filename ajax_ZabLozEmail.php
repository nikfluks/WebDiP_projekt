<?php

include_once("aplikacijskiOkvir.php");

$email = $_POST["email"];

$sql = "SELECT email FROM korisnik WHERE email = '$email'";
$rezultat = $dbc->selectDB($sql);

$dohvaceno = array();

if (mysqli_num_rows($rezultat)) {
    while ($red = mysqli_fetch_row($rezultat)) {
        $redak["email"] = $red[0];
        $redak["uspjeh"] = 1;
        $dohvaceno[] = $redak;
    }
}
$dbc->zatvoriDB();

header("Content-Type: application/json");
print json_encode($dohvaceno);
?>
