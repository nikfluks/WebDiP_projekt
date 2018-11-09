<?php

include_once("aplikacijskiOkvir.php");

$tipFilterVrij = $_POST["tipFilterVrij"];

$sql = "SELECT k.`ime`,k.`prezime`,k.`email`,k.`korisnicko_ime`,k.`lozinka`,tk.naziv
        FROM `korisnik` k
        JOIN tip_korisnika tk ON k.`tip_korisnika_id`=tk.tip_korisnika_id
        WHERE tk.naziv LIKE '%$tipFilterVrij%' ORDER BY k.korisnicko_ime";

$rezultat = $dbc->selectDB($sql);

$dohvaceno = array();

if (mysqli_num_rows($rezultat)) {
    while ($red = mysqli_fetch_row($rezultat)) {
        $redak["ime"] = $red[0];
        $redak["prezime"] = $red[1];
        $redak["email"] = $red[2];
        $redak["korIme"] = $red[3];
        $redak["lozinka"] = $red[4];
        $redak["tip"] = $red[5];
        $dohvaceno[] = $redak;
    }
}
$dbc->zatvoriDB();

header("Content-Type: application/json");
print json_encode($dohvaceno);
?>
