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
    $adresa = 'https://' . $dir . 'otkljucavanje_korisnika.php';
    header("Location: $adresa");
}
?>

<html>
    <head>
        <title>Otključaj korisnika</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Otključavanje korisnika">
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

        if (isset($_POST["otkljBlokRadio"])) {
            $broj = 1;
            if (isset($_POST["otkljucavanje"])) {
                $broj = 0; //otkljucaj korisnika, tj postavi broj pogresnih unosa na 0
            } else if (isset($_POST["blokiranje"])) {
                $broj = -1; //blokiranje korisnika, tj postavi broj pogresnih unosa na -1
            }
            if ($broj != 1) {
                $id = $_POST['otkljBlokRadio'];
                $sql = "UPDATE `korisnik` SET `broj_pogresnih_prijava`='$broj' WHERE `korisnik_id`='$id'";

                $skripta = substr($uri, $pos + 1);
                $kor_id = Sesija::dajIdKorisnika();

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                $uspjeh = $dbc->ostaliUpitiDB($sql);
            }
        }
        ?>
        <header>
            <h1>Otključavanje korisnika</h1>
            <figure id="logoSlika">
                <img src="slike/logo.png" usemap="#mapa1" alt="FOI" width="400" height="200">
                <map name="mapa1">
                    <area href="index.php" alt="logo" shape="rect" coords="0,0,200,200" target="index" />
                    <area href="#novi_proizvod_nav" alt="logo" shape="rect" coords="200,0,400,200" />
                </map>
                <figcaption id="logoCap">Interaktivna slika</figcaption>
            </figure>
        </header>

        <nav id="novi_proizvod_nav">
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

        <div class="korisnici_filter">
            <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
                <label for="emailFilter">Email:</label>
                <input id="emailFilter" name="emailFilter" type="text" autofocus="autofocus">

                <label for="brPrijava">Min broj prijava:</label>
                <input id="brPrijava" name="brPrijava" type="text">

                <input id="brojRedovaPoStranici" type="hidden" value=<?php echo dohvatiStupac("stranicenje"); ?>>
            </form>
        </div>

        <div class="margina4040">
            <?php
            //$brojPrijava = dohvatiStupac("broj_neuspjesnih_prijava");
            $sql = "SELECT korisnik_id,ime,prezime,korisnicko_ime,email,broj_pogresnih_prijava 
                    FROM korisnik ";

            //sortiranje
            if (isset($_GET["sort"])) {
                if ($_GET["sort"] == "ime") {
                    $sql .= "ORDER BY ime ";
                } else if ($_GET["sort"] == "prezime") {
                    $sql .= "ORDER BY prezime ";
                } else if ($_GET["sort"] == "email") {
                    $sql .= "ORDER BY email ";
                } else if ($_GET["sort"] == "korIme") {
                    $sql .= "ORDER BY korisnicko_ime ";
                } else if ($_GET["sort"] == "brPrijava") {
                    $sql .= "ORDER BY broj_pogresnih_prijava ";
                }
            } else {
                $sql .= "ORDER BY broj_pogresnih_prijava desc";
            }

            $vrsta = "asc";
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
            ?>
            <form action="otkljucavanje_korisnika.php" method="POST">
                <table class="tablicaZaStranicenje">
                    <tr>
                        <th>Odaberi</th>
                        <th><a href="otkljucavanje_korisnika.php?sort=ime&vrsta=<?php echo $vrsta; ?>">Ime</a></th>
                        <th><a href="otkljucavanje_korisnika.php?sort=prezime&vrsta=<?php echo $vrsta; ?>">Prezime</a></th>
                        <th><a href="otkljucavanje_korisnika.php?sort=korIme&vrsta=<?php echo $vrsta; ?>">Korisničko ime</a></th>
                        <th><a href="otkljucavanje_korisnika.php?sort=email&vrsta=<?php echo $vrsta; ?>">Email</a></th>
                        <th><a href="otkljucavanje_korisnika.php?sort=brPrijava&vrsta=<?php echo $vrsta; ?>">Broj prijava</a></th>
                    </tr>
                    <?php
                    while (list($id, $ime, $prezime, $korIme, $email, $brojPrijava) = $rezultat->fetch_array()) {
                        print "<tr><td><input type='radio' id='$id' name='otkljBlokRadio' value='$id' /></td><td>$ime</td><td>$prezime</td><td>$korIme</td><td>$email</td><td>$brojPrijava</td></tr>\n";
                    }
                    $dbc->zatvoriDB();
                    ?>
                </table>
                <input type="submit" class="gumb" id="otkljucavanje" name="otkljucavanje" value="Otključaj">
                <input type="submit" class="gumb" id="blokiranje" name="blokiranje" value="Blokiraj">
            </form>
        </div>
        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fotkljucavanje_korisnika.php" target="html5">
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