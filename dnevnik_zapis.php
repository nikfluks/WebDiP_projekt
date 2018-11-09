<?php

function dnevnik_zapis($radi, $skr, $kor_id) {
    global $dbc;

    $pomak_vremena = dohvatiStupac("pomak_vremena");
    $vrijemeSec = time() + ($pomak_vremena * 60 * 60);

    $datum = date("Y-m-d", $vrijemeSec);
    $vrijeme = date("H:i:s", $vrijemeSec);
    $radnja = $radi;
    $adresa = $_SERVER["REMOTE_ADDR"];
    $skripta = $skr;
    $preglednik = $_SERVER["HTTP_USER_AGENT"];
    $korisnik_id = intval($kor_id);

    $sql = "INSERT INTO log (datum, vrijeme, radnja, adresa, skripta, preglednik, korisnik_id) VALUES " .
            "('$datum', '$vrijeme', '$radnja', '$adresa', '$skripta', '$preglednik', '$korisnik_id')";

    $uspjeh = $dbc->ostaliUpitiDB($sql);
    if (!$uspjeh) {
        trigger_error("Problem kod upisa u bazu podataka!" . $dbc->error, E_USER_ERROR);
    }
}

?>
