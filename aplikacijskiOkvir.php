<?php

define('admin', '3');
define('moder', '2');
define('obicni', '1');
//include_once('obradaPogresaka.php');
//include_once('korisnik.php');
include_once('konfiguracija_funkcija.php');
include_once('baza.class.php');
include_once('sesija.class.php');
//include_once('autentikacija.php');
include_once('provjera_korisnika.php');
include_once('dnevnik_zapis.php');


$dbc = new Baza();
$dbc->spojiDB();
Sesija::kreirajSesiju();

$cookieIme = "UvjetiKoristenja";
$cookiePath = "/";

$pomak_vremena = dohvatiStupac("pomak_vremena");
$cookieIstjece = (time() + $pomak_vremena * 60 * 60) + (60 * 60 * 24 * 3);
?>