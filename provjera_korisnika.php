<?php

function dohvatiKorisnikId($korisnik) {
    global $dbc;

    $sql = "SELECT korisnik_id FROM korisnik WHERE korisnicko_ime='$korisnik'";
    $rezultat = $dbc->selectDB($sql);
    $red = $rezultat->fetch_array();

    if (empty($red)) {
        echo "Korisnik ne postoji!";
        exit();
    } else {
        return $red["korisnik_id"];
    }
}
?>

