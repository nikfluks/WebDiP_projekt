<?php

function dohvatiStupac($stupac) {
    global $dbc;
    $sql = "SELECT $stupac FROM `konfiguracija` WHERE konfiguracija_id=1";

    $rezultat = $dbc->selectDB($sql);
    $red = $rezultat->fetch_array();

    $vrijednost = $red[$stupac];
    if ($vrijednost != null) {
        return $vrijednost;
    }
}
?>

