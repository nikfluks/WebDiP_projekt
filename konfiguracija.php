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
    $adresa = 'https://' . $dir . 'konfiguracija.php';
    header("Location: $adresa");
}
?>
<html>
    <head>
        <title>Konfiguracija</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Konfiguracija">
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
        ?>
        <header>
            <h1>Konfiguracija</h1>
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

        <div class="uspjesno_azurirano_div">
            <?php
            if (isset($_POST["spremiKonfiguraciju"])) {

                $id = $_POST["id"];
                $trajanjeSesija = $_POST["trajanjeSesija"];
                $stranicenje = $_POST["stranicenje"];
                $pomakVremena = $_POST["pomakVremena"];
                $brojNeuspjesnihPrijava = $_POST["brojNeuspjesnihPrijava"];
                $trajanjeAktivacije = $_POST["trajanjeAktivacije"];

                $sql = "UPDATE konfiguracija SET trajanje_sesije='$trajanjeSesija', stranicenje='$stranicenje', pomak_vremena='$pomakVremena', broj_neuspjesnih_prijava='$brojNeuspjesnihPrijava', trajanje_aktivacije='$trajanjeAktivacije' WHERE konfiguracija_id='$id'";

                $uspjeh = $dbc->ostaliUpitiDB($sql);

                $skripta = substr($uri, $pos + 1);
                $kor_id = Sesija::dajIdKorisnika();

                $prviRazmak = strpos($sql, " ");
                $tipUpita = substr($sql, 0, $prviRazmak);

                dnevnik_zapis($tipUpita, $skripta, $kor_id);

                if ($dbc->pogreskaDB()) {
                    echo "Problem kod upita na bazu podataka!";
                    exit;
                }
                echo '<span class="uspjesno_azurirano_span">Uspješno ažurirana konfiguracija!</span>';
            }
            ?>
        </div>

        <div class="azuriraj <?php
        if (isset($_POST["konfiguracijaRadio"])) {
            echo "prikazi";
        } else {
            echo "sakrij";
        }
        ?>">
                 <?php
                 if (isset($_POST["konfiguracijaRadio"])) {

                     $id = $_POST["konfiguracijaRadio"];
                     $sql = "SELECT * FROM `konfiguracija` WHERE konfiguracija_id='$id'";

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

                     echo '<form action="konfiguracija.php" method="post">';

                     while (list($id, $trajanjeSesija, $stranicenje, $pomakVremena, $brojNeuspjesnihPrijava, $trajanjeAktivacije) = $rezultat->fetch_array()) {
                         echo '<label class="azurirajLabele" for=' . $id . '>Id:</label>';
                         echo "<input class='inputReadOnly' type='text' id='$id' name='id' value='$id' readonly=readonly><br>";

                         echo '<label class="azurirajLabele" for=' . $trajanjeSesija . '>Trajanje sesije:</label>';
                         echo "<input type='text' id='$trajanjeSesija' name='trajanjeSesija' value='$trajanjeSesija'><br>";

                         echo '<label class="azurirajLabele" for=' . $stranicenje . '>Straničenje:</label>';
                         echo "<input type='text' id='$stranicenje' name='stranicenje' value='$stranicenje'><br>";

                         echo '<label class="azurirajLabele" for=' . $pomakVremena . '>Pomak vremena:</label>';
                         echo "<input class='inputReadOnly' type='text' id='$pomakVremena' name='pomakVremena' value='$pomakVremena' readonly=readonly><br>";

                         echo '<label class="azurirajLabele" for=' . $brojNeuspjesnihPrijava . '>Broj prijava:</label>';
                         echo "<input type='text' id='$brojNeuspjesnihPrijava' name='brojNeuspjesnihPrijava' value='$brojNeuspjesnihPrijava'><br>";

                         echo '<label class="azurirajLabele" for=' . $trajanjeAktivacije . '>Trajanje aktivacije:</label>';
                         echo "<input type='text' id='$trajanjeAktivacije' name='trajanjeAktivacije' value='$trajanjeAktivacije'><br>";
                     }
                     echo '<input type="submit" id="spremiKonfiguraciju" class="gumb" name="spremiKonfiguraciju" value="Spremi">';
                     echo "</form>";
                 }

                 if (isset($_POST["postaviVirtualnoVrijeme"])) {
                     header("Location: virtualno_vrijeme.php");
                 }
                 ?>
        </div>

        <div class="margina4040">            
            <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
                <?php
                $sql = "SELECT * FROM `konfiguracija`";

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

                print "<table class='tablica_konfiguracije'><tr><th>Odaberi</th><th>Trajanje sesije</th><th>Straničenje</th><th>Pomak vremena</th><th>Broj neuspješnih prijava</th><th>Trajanje aktivacije</th></tr>\n";

                while (list($id, $trajanjeSesija, $stranicenje, $pomakVremena, $brojNeuspjesnihPrijava, $trajanjeAktivacije) = $rezultat->fetch_array()) {
                    print "<tr><td><input type='radio' id='$id' name='konfiguracijaRadio' value='$id' /></td><td>$trajanjeSesija</td><td>$stranicenje</td><td>$pomakVremena</td><td>$brojNeuspjesnihPrijava</td><td>$trajanjeAktivacije</td></tr>\n";
                }
                print "</table>\n";

                $dbc->zatvoriDB();
                ?>
                <input type="submit" id="promjeniKonfiguraciju" class="gumb" name="promjeniKonfiguraciju" value="Promjeni">
                <input type="submit" id="postaviVirtualnoVrijeme" class="gumb" name="postaviVirtualnoVrijeme" value="Postavi virtualno vrijeme">
            </form>
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

