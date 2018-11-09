<?php

include_once("aplikacijskiOkvir.php");

$username = $_POST["username"];

$sql = "SELECT korisnicko_ime FROM korisnik WHERE korisnicko_ime = '$username'";
$rezultat = $dbc->selectDB($sql);

$dohvaceno = array();

if (mysqli_num_rows($rezultat)) {
    while ($red = mysqli_fetch_row($rezultat)) {
        $redak["kor_ime"] = $red[0];
        $redak["uspjeh"] = 1;
        $dohvaceno[] = $redak;
    }
}
$dbc->zatvoriDB();

header("Content-Type: application/json");
print json_encode($dohvaceno);
?>
