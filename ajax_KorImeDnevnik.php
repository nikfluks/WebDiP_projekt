<?php

include_once("aplikacijskiOkvir.php");

$korImeDnevnikVrij = $_POST["korImeDnevnikVrij"];

$sql = "SELECT l.sakupljeni_bodovi, l.potroseni_bodovi, l.datum, l.vrijeme, l.radnja, l.adresa, l.skripta, l.preglednik, k.korisnicko_ime, l.akcija_id 
        FROM log l 
        JOIN korisnik k ON l.korisnik_id=k.korisnik_id 
        WHERE k.korisnicko_ime LIKE '%$korImeDnevnikVrij%'";

$rezultat = $dbc->selectDB($sql);

$dohvaceno = array();

if (mysqli_num_rows($rezultat)) {
    while ($red = mysqli_fetch_row($rezultat)) {
        $redak["sakupljeni"] = $red[0];
        $redak["potroseni"] = $red[1];
        $redak["datum"] = $red[2];
        $redak["vrijeme"] = $red[3];
        $redak["radnja"] = $red[4];
        $redak["adresa"] = $red[5];
        $redak["skripta"] = $red[6];
        $redak["preglednik"] = $red[7];
        $redak["korIme"] = $red[8];
        $redak["akcija"] = $red[9];
        $dohvaceno[] = $redak;
    }
}
$dbc->zatvoriDB();

header("Content-Type: application/json");
print json_encode($dohvaceno);
?>

