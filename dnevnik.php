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
    $adresa = 'https://' . $dir . 'dnevnik.php';
    header("Location: $adresa");
}
?>
<html>
    <head>
        <title>Dnevnik</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Dnevnik">
        <meta name="kljucne_rijeci" content="FOI,Web DiP">
        <meta name="datum_izrade" content="07.03.2017.">  
        <meta name="autor" content="Nikola Fluks">
        <link rel="stylesheet" media="screen" type="text/css" href="css/nikfluks.css">    
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/nikfluksJquery.js"></script>
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
        ?>
        <header>
            <h1>Dnevnik</h1>
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

        <?php
        if (isset($_POST["filterDatum"])) {
            $predlozakDatum = "/^\d?\d\.\d?\d\.\d\d\d\d$/";
            if (!preg_match_all($predlozakDatum, $_POST["odDatum"])) {
                $odDat = "Pogrešan od datum!";
            } else if (!preg_match_all($predlozakDatum, $_POST["doDatum"])) {
                $doDat = "Pogrešan do datum!";
            } else {
                $od = date_create_from_format("d.m.Y", $_POST["odDatum"]);
                $odDatuma = date_format($od, "Y-m-d 00:00:00");

                $do = date_create_from_format("d.m.Y", $_POST["doDatum"]);
                $doDatuma = date_format($do, "Y-m-d 23:55:55");

                $sql = "SELECT l.sakupljeni_bodovi, l.potroseni_bodovi, l.datum, l.vrijeme, l.radnja, l.adresa, l.skripta, l.preglednik, k.korisnicko_ime, l.akcija_id 
                    FROM log l 
                    JOIN korisnik k ON l.korisnik_id=k.korisnik_id 
                    WHERE l.datum BETWEEN '$odDatuma' AND '$doDatuma'";

                $skripta = substr($uri, $pos + 1);
                $kor_id = Sesija::dajIdKorisnika();

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                $rezultat = $dbc->selectDB($sql);

                if ($dbc->pogreskaDB()) {
                    echo "Problem kod upita na bazu podataka!";
                    exit;
                }
            }
        }
        ?>

        <div class="korisnici_filter">
            <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
                <label for="korImeDnevnikFilter">Korisničko ime:</label>
                <input id="korImeDnevnikFilter" name="korImeDnevnikFilter" type="text" autofocus="autofocus">

                <label for="radnjaFilter">Radnja:</label>
                <input id="radnjaFilter" name="radnjaFilter" type="text"><br><br>

                <div id="odDatumGreske">
                    <?php
                    $pocetni = "01." . date("m.Y");
                    $zavrsni = date("d.m.Y");
                    if (isset($odDat)) {
                        echo $odDat . "<br>";
                    }if (isset($doDat)) {
                        echo $doDat . "<br>";
                    }
                    ?>
                </div>

                <label for="odDatum">Od datuma:</label>
                <input id="odDatum" name="odDatum" type="text" value="<?php echo $pocetni; ?>" placeholder="dd.mm.YYYY"><br>

                <label for="doDatum">Do datuma:</label>
                <input id="doDatum" name="doDatum" type="text" value="<?php echo $zavrsni; ?>" placeholder="dd.mm.YYYY"><br>

                <input id="filterDatum" class="gumb" name="filterDatum" type="submit" value="Traži po datumu">
                <input id="brojRedovaPoStranici" type="hidden" value=<?php echo dohvatiStupac("stranicenje"); ?>>
            </form>
        </div>

        <div class="margina4040">
            <?php
            $vrsta = "asc";
            if (!isset($_POST["filterDatum"])) {

                $sql = "SELECT l.sakupljeni_bodovi, l.potroseni_bodovi, l.datum, l.vrijeme, l.radnja, l.adresa, l.skripta, l.preglednik, k.korisnicko_ime, l.akcija_id 
                                FROM log l 
                                JOIN korisnik k ON l.korisnik_id=k.korisnik_id ";

                //sortiranje
                if (isset($_GET["sort"])) {
                    if ($_GET["sort"] == "skBodovi") {
                        $sql .= "ORDER BY sakupljeni_bodovi ";
                    } else if ($_GET["sort"] == "poBodovi") {
                        $sql .= "ORDER BY potroseni_bodovi ";
                    } else if ($_GET["sort"] == "datum") {
                        $sql .= "ORDER BY datum ";
                    } else if ($_GET["sort"] == "vrijeme") {
                        $sql .= "ORDER BY vrijeme ";
                    } else if ($_GET["sort"] == "radnja") {
                        $sql .= "ORDER BY radnja ";
                    } else if ($_GET["sort"] == "adresa") {
                        $sql .= "ORDER BY adresa ";
                    } else if ($_GET["sort"] == "skripta") {
                        $sql .= "ORDER BY skripta ";
                    } else if ($_GET["sort"] == "preglednik") {
                        $sql .= "ORDER BY preglednik ";
                    } else if ($_GET["sort"] == "korisnik") {
                        $sql .= "ORDER BY k.korisnicko_ime ";
                    } else if ($_GET["sort"] == "akcija") {
                        $sql .= "ORDER BY akcija_id ";
                    }
                } else {
                    $sql .= "ORDER BY datum desc, vrijeme desc";
                }


                if (isset($_GET["vrsta"])) {
                    if ($_GET["vrsta"] == "asc") {
                        $vrsta = "desc";
                    } else {
                        $vrsta = "asc";
                    }
                    $sql .= $vrsta;
                }
                //sortiranje

                $skripta = substr($uri, $pos + 1);
                $kor_id = Sesija::dajIdKorisnika();

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                $rezultat = $dbc->selectDB($sql);

                if ($dbc->pogreskaDB()) {
                    echo "Problem kod upita na bazu podataka!";
                    exit;
                }
            }
            ?>

            <table class="tablicaZaStranicenje">
                <tr>
                    <th><a href="dnevnik.php?sort=skBodovi&vrsta=<?php echo $vrsta; ?>">Sakupljeni bodovi</a></th>
                    <th><a href="dnevnik.php?sort=poBodovi&vrsta=<?php echo $vrsta; ?>">Potrošeni bodovi</a></th>
                    <th><a href="dnevnik.php?sort=datum&vrsta=<?php echo $vrsta; ?>">Datum</a></th>
                    <th><a href="dnevnik.php?sort=vrijeme&vrsta=<?php echo $vrsta; ?>">Vrijeme</a></th>
                    <th><a href="dnevnik.php?sort=radnja&vrsta=<?php echo $vrsta; ?>">Radnja</a></th>
                    <th><a href="dnevnik.php?sort=adresa&vrsta=<?php echo $vrsta; ?>">Adresa</a></th>
                    <th><a href="dnevnik.php?sort=skripta&vrsta=<?php echo $vrsta; ?>">Skripta</a></th>
                    <th><a href="dnevnik.php?sort=preglednik&vrsta=<?php echo $vrsta; ?>">Preglednik</a></th>
                    <th><a href="dnevnik.php?sort=korisnik&vrsta=<?php echo $vrsta; ?>">Korisnik</a></th>
                    <th><a href="dnevnik.php?sort=akcija&vrsta=<?php echo $vrsta; ?>">Akcija</a></th>
                </tr>
                <?php
                if (!isset($odDat) && !isset($doDat)) {
                    while (list($sakupljeni, $potroseni, $datum, $vrijeme, $radnja, $adresa, $skripta, $preglednik, $korisnik, $akcija) = $rezultat->fetch_array()) {
                        print "<tr><td>$sakupljeni</td><td>$potroseni</td><td>$datum</td><td>$vrijeme</td><td>$radnja</td><td>$adresa</td><td>$skripta</td><td>$preglednik</td><td>$korisnik</td><td>$akcija</td></tr>\n";
                    }
                }

                $dbc->zatvoriDB();
                ?>
            </table>
        </div>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fdnevnik.php" target="html5">
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

