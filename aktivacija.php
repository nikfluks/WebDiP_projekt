<!DOCTYPE html>
<?php
include_once("aplikacijskiOkvir.php");

if (!isset($_COOKIE[$cookieIme]) || time() > ($_COOKIE[$cookieIme] - (dohvatiStupac("pomak_vremena") * 60 * 60))) {
    header("Location: uvjeti_koristenja_provjera.php");
}

$uri = $_SERVER["REQUEST_URI"];
$pos = strrpos($uri, "/");
$dir = $_SERVER["SERVER_NAME"] . substr($uri, 0, $pos + 1);

if (!isset($_SERVER["HTTPS"]) || strtolower($_SERVER["HTTPS"]) != "on") {
    $adresa = 'https://' . $dir . 'aktivacija.php';
    header("Location: $adresa");
}
?>

<html>
    <head>
        <title>Aktivacija</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Aktivacija">
        <meta name="kljucne_rijeci" content="FOI,Web DiP">
        <meta name="datum_izrade" content="07.03.2017.">  
        <meta name="autor" content="Nikola Fluks">
        <link rel="stylesheet" media="screen" type="text/css" href="css/nikfluks.css">    
    </head>

    <body>
        <?php
        if (isset($_GET["aktkod"]) && isset($_GET["id"])) {
            $upitnik = strpos($uri, "?");
            $duljina = $upitnik - $pos - 1;
            $skripta = substr($uri, $pos + 1, $duljina);

            $kod = $_GET["aktkod"];
            $sql = "SELECT * FROM korisnik WHERE `aktivacijski_link`='$kod'";
            $rezultat = $dbc->selectDB($sql);
            $red = $rezultat->fetch_array();

            $prviRazmak = strpos($sql, " ");
            $tipUpita = substr($sql, 0, $prviRazmak);

            dnevnik_zapis($tipUpita, $skripta, $_GET["id"]);

            $pomak_vremena = dohvatiStupac("pomak_vremena");
            $tren = date("Y-m-d H:i:s", strtotime("+$pomak_vremena hours"));

            if (empty($red)) {
                //echo "Pogrešan aktivacijski kod!<br>";
                $pogresanAktKod = "Pogrešan aktivacijski kod!";
            } else if ($red["aktiviran"] == 1) {
                //echo "Korisnički račun je već aktiviran!<br>";
                $vecAktiviran = "Korisnički račun je već aktiviran!";
            } else if ($tren > $red["datum_isteka_aktivacije"]) {
                //echo "Prošlo je 5 sati i aktivacijski link više ne vrijedi!<br>";
                $aktIstekla = "Prošlo je 5 sati i aktivacijski link više ne vrijedi!";
            } else {
                $sql = "UPDATE `korisnik` SET `aktiviran`='1', datum_registracije='$tren' WHERE `aktivacijski_link`='$kod'";
                $uspjeh = $dbc->ostaliUpitiDB($sql);

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $_GET["id"]);
                dnevnik_zapis("Aktivacija", $skripta, $_GET["id"]);

                //echo "Korisnički račun je aktiviran!<br>";

                $pomak_vremena = dohvatiStupac("pomak_vremena");
                $cookieIstjece2 = (time() + $pomak_vremena * 60 * 60) + (60 * 60 * 24 * 30);
                setcookie($cookieIme, $cookieIstjece2, $cookieIstjece2, $cookiePath);
            }
        } else {
            //echo "Niste unijeli aktivacijski kod!<br>";
            $nepostojeciAktKod = "Niste unijeli aktivacijski kod!";
        }
        $dbc->zatvoriDB();
        //echo "<a href='prijava.php'>Prijava</a>";
        ?>

        <header class="uvjeti">
            <h1>Aktivacija</h1>
            <h3 id="lblUvjeti">
                <?php
                if (isset($nepostojeciAktKod)) {
                    echo $nepostojeciAktKod;
                } else if (isset($pogresanAktKod)) {
                    echo $pogresanAktKod;
                } else if (isset($vecAktiviran)) {
                    echo $vecAktiviran;
                } else if (isset($aktIstekla)) {
                    echo $aktIstekla;
                } else {
                    echo "Korisnički račun je aktiviran!";
                }
                ?>
                <br>
                <a href='prijava.php'>Prijava</a>
            </h3>
        </header>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Faktivacija.php" target="html5">
                <figure id="html5">
                    <img src="slike/HTML5.png" alt="HTML5" width="100" height="100">
                    <figcaption>HTML5 validator</figcaption>
                </figure>
            </a>
            <a href="https://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fcss%2Fnikfluks.css&profile=css3&usermedium=all&warning=1&vextwarning=&lang=en" target="css3">
                <figure id="css3">
                    <img src="slike/CSS3.png" alt="CSS3" width="100" height="100">
                    <figcaption>CSS3 validator</figcaption>
                </figure> 
            </a>
            <address id="mail"><strong>Kontakt: <a href="mailto:nikfluks@foi.hr">Nikola Fluks</a></strong></address>
            <p><small>&copy; 2017. N. Fluks </small></p>
        </footer>
    </body>
</html>


