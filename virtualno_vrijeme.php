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
    $adresa = 'https://' . $dir . 'virtualno_vrijeme.php';
    header("Location: $adresa");
}
?>
<html>
    <head>
        <title>Virtualno vrijeme</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Virtualno vrijeme">
        <meta name="kljucne_rijeci" content="FOI,Web DiP">
        <meta name="datum_izrade" content="07.03.2017.">  
        <meta name="autor" content="Nikola Fluks">
        <link rel="stylesheet" media="screen" type="text/css" href="css/nikfluks.css">    
    </head>

    <body>
        <?php
        if (!isset($_SESSION["korisnik"])) {
            die("Niste prijavljeni pa ne možete pristupiti stranici!");
        } else if (!($_SESSION["tip"] == admin)) {
            die("Niste administrator pa ne možete pristupiti stranici!");
        } else {
            //echo "Administrator: " . $_SESSION["korisnik"] . "<br>";
        }

        $stvarnoVrijeme;
        $virtualnoVrijeme;

        function dohvatiVrijemeXML() {
            $url = "http://barka.foi.hr/WebDiP/pomak_vremena/pomak.php?format=xml";

            if (!($fp = fopen($url, 'r'))) {
                echo "Problem: nije moguće otvoriti url: " . $url;
                exit;
            }

            // XML data
            $xml_string = fread($fp, 10000);
            fclose($fp);

            // create a DOM object from the XML data
            $domdoc = new DOMDocument;
            $domdoc->loadXML($xml_string);

            $params = $domdoc->getElementsByTagName('brojSati');
            $sati = 0;

            if ($params != NULL) {
                $sati = $params->item(0)->nodeValue;
            }

            global $dbc;

            $sql = "UPDATE `konfiguracija` SET `pomak_vremena`='$sati' WHERE `konfiguracija_id`=1";
            $uspjeh = $dbc->ostaliUpitiDB($sql);
            
            global $uri, $pos;

            $skripta = substr($uri, $pos + 1);
            $kor_id = Sesija::dajIdKorisnika();

            $prviRazmak = strpos($sql, " ");
            $tipUpita = substr($sql, 0, $prviRazmak);

            dnevnik_zapis($tipUpita, $skripta, $kor_id);

            $vrijeme_servera = time();
            $vrijeme_sustava = $vrijeme_servera + ($sati * 60 * 60);
            //echo "Stvarno vrijeme servera: " . date('d.m.Y H:i:s', $vrijeme_servera) . "<br>";
            //echo "Virtualno vrijeme sustava: " . date('d.m.Y H:i:s', $vrijeme_sustava) . "<br>";

            global $stvarnoVrijeme;
            global $virtualnoVrijeme;
            $stvarnoVrijeme = "Stvarno vrijeme servera: " . date('d.m.Y H:i:s', $vrijeme_servera) . "<br>";
            $virtualnoVrijeme = "Virtualno vrijeme sustava: " . date('d.m.Y H:i:s', $vrijeme_sustava) . "<br>";
        }

        if (isset($_POST["dohvatiVrijeme"])) {
            dohvatiVrijemeXML();
        }
        ?>
        <header>
            <h1>Virtualno vrijeme</h1>
            <figure id="logoSlika">
                <img src="slike/logo.png" usemap="#mapa1" alt="FOI" width="400" height="200">
                <map name="mapa1">
                    <area href="index.php" alt="logo" shape="rect" coords="0,0,200,200" target="index" />
                    <area href="#prijava_nav" alt="logo" shape="rect" coords="200,0,400,200" />
                </map>
                <figcaption id="logoCap">Interaktivna slika</figcaption>
            </figure>
        </header>

        <nav id="prijava_nav">
            <ul>
                <li><a href="privatno/korisnici.php">Korisnici</a></li>
                <li><a href="index.php">Početna</a></li>
                <li><a href="registracija.php">Registracija</a></li>

                <?php
                if (!isset($_SESSION["korisnik"])) {
                    echo '<li><a href="prijava.php">Prijava</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="konfiguracija.php">Konfiguracija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="dnevnik.php">Dnevnik</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="otkljucavanje_korisnika.php">Otključavanje korisnika</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="aktivacija.php">Aktivacija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"])) {
                    echo '<li><a href="odjava.php">Odjava</a></li>';
                }
                ?>
                <li><a href="uvjeti_koristenja.php">Uvjeti korištenja</a></li>
            </ul> 
        </nav>

        <div class="margina4040">
            <?php
            if (!empty($stvarnoVrijeme)) {
                echo $stvarnoVrijeme;
            }
            if (!empty($virtualnoVrijeme)) {
                echo $virtualnoVrijeme;
            }
            ?>
        </div>


        <div class="margina4040">     
            <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
                <input type="submit" id="dohvatiVrijeme" class="gumb" name="dohvatiVrijeme" value="Dohvati vrijeme">
            </form>
            <a id="postaviVrijeme" href="http://barka.foi.hr/WebDiP/pomak_vremena/vrijeme.html" name="postaviVrijeme" target="_blank">Postavi vrijeme</a>
        </div>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fazuriraj_proizvod.php" target="html5">
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




