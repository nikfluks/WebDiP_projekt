<?php

include_once("aplikacijskiOkvir.php");

$brPrijavaVrij = $_POST["brPrijavaVrij"];

$sql = "SELECT k.`ime`,k.`prezime`,k.`korisnicko_ime`,k.`email`,k.broj_pogresnih_prijava,k.korisnik_id
        FROM `korisnik` k
        WHERE k.broj_pogresnih_prijava >= '$brPrijavaVrij' ORDER BY k.broj_pogresnih_prijava";

$rezultat = $dbc->selectDB($sql);

$dohvaceno = array();

if (mysqli_num_rows($rezultat)) {
    while ($red = mysqli_fetch_row($rezultat)) {
        $redak["ime"] = $red[0];
        $redak["prezime"] = $red[1];
        $redak["korIme"] = $red[2];
        $redak["email"] = $red[3];
        $redak["brPrijava"] = $red[4];
        $redak["id"] = $red[5];
        $dohvaceno[] = $redak;
    }
}
$dbc->zatvoriDB();

header("Content-Type: application/json");
print json_encode($dohvaceno);
?>

