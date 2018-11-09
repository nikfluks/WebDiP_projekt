<!DOCTYPE html>
<?php
include_once("../aplikacijskiOkvir.php");

if (!isset($_COOKIE[$cookieIme]) || time() > ($_COOKIE[$cookieIme] - (dohvatiStupac("pomak_vremena") * 60 * 60))) {
    header("Location: ../uvjeti_koristenja_provjera.php");
}

$uri = $_SERVER["REQUEST_URI"];
$pos = strrpos($uri, "/");
$dir = $_SERVER["SERVER_NAME"] . substr($uri, 0, $pos + 1);

if (isset($_SERVER["HTTPS"])) {
    $adresa = 'http://' . $dir . 'korisnici.php';
    header("Location: $adresa");
}
?>
<html>
    <head>
        <title>Korisnici</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="naslov" content="Korisnici">
        <meta name="kljucne_rijeci" content="FOI,Web DiP">
        <meta name="datum_izrade" content="07.03.2017.">  
        <meta name="autor" content="Nikola Fluks">
        <link rel="stylesheet" media="screen" type="text/css" href="../css/nikfluks.css">    
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/nikfluksJquery.js"></script>
    </head>

    <body>
        <header>
            <h1>Korisnici</h1>
            <figure id="logoSlika">
                <img src="../slike/logo.png" usemap="#mapa1" alt="FOI" width="400" height="200">
                <map name="mapa1">
                    <area href="../index.php" alt="logo" shape="rect" coords="0,0,200,200" target="index" />
                    <area href="#prijava_nav" alt="logo" shape="rect" coords="200,0,400,200" />
                </map>
                <figcaption id="logoCap">Interaktivna slika</figcaption>
            </figure>
        </header>

        <nav id="registracija_nav">
            <ul>
                <li><a href="korisnici.php">Korisnici</a></li>
                <li><a href="../index.php">Početna</a></li>
                <li><a href="../registracija.php">Registracija</a></li>

                <?php
                if (!isset($_SESSION["korisnik"])) {
                    echo '<li><a href="../prijava.php">Prijava</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="../konfiguracija.php">Konfiguracija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="../dnevnik.php">Dnevnik</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="../otkljucavanje_korisnika.php">Otključavanje korisnika</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"]) && $_SESSION["tip"] == admin) {
                    echo '<li><a href="../aktivacija.php">Aktivacija</a></li>';
                }
                ?>

                <?php
                if (isset($_SESSION["korisnik"])) {
                    echo '<li><a href="../odjava.php">Odjava</a></li>';
                }
                ?>
                <li><a href="../uvjeti_koristenja.php">Uvjeti korištenja</a></li>
            </ul> 
        </nav>

        <div class="korisnici_filter">
            <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
                <label for="korImeFilter">Korisničko ime:</label>
                <input id="korImeFilter" name="korImeFilter" type="text" autofocus="autofocus">

                <label for="tipFilter">Tip korisnika:</label>
                <input id="tipFilter" name="tipFilter" type="text">

                <input id="brojRedovaPoStranici" type="hidden" value=<?php echo dohvatiStupac("stranicenje"); ?>>
            </form>
        </div>
        

        <div class="margina4040">
            <?php
            $sql = "SELECT k.`ime`,k.`prezime`,k.`email`,k.`korisnicko_ime`,k.`lozinka`,tk.naziv 
                    FROM `korisnik` k 
                    JOIN tip_korisnika tk ON k.`tip_korisnika_id`=tk.tip_korisnika_id ";

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
                } else if ($_GET["sort"] == "lozinka") {
                    $sql .= "ORDER BY lozinka ";
                } else if ($_GET["sort"] == "tip") {
                    $sql .= "ORDER BY tk.tip_korisnika_id ";
                }
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

            $rezultat = $dbc->selectDB($sql);

            if ($dbc->pogreskaDB()) {
                echo "Problem kod upita na bazu podataka!";
                exit;
            }
            ?>

            <table class="tablicaZaStranicenje">
                <tr>
                    <th><a href="korisnici.php?sort=ime&vrsta=<?php echo $vrsta; ?>">Ime</a></th>
                    <th><a href="korisnici.php?sort=prezime&vrsta=<?php echo $vrsta; ?>">Prezime</a></th>
                    <th><a href="korisnici.php?sort=email&vrsta=<?php echo $vrsta; ?>">Email</a></th>
                    <th><a href="korisnici.php?sort=korIme&vrsta=<?php echo $vrsta; ?>">Korisničko ime</a></th>
                    <th><a href="korisnici.php?sort=lozinka&vrsta=<?php echo $vrsta; ?>">Lozinka</a></th>
                    <th><a href="korisnici.php?sort=tip&vrsta=<?php echo $vrsta; ?>">Tip korisnika</a></th>
                </tr>

                <?php
                while (list($ime, $prezime, $email, $kor_ime, $lozinka, $tip) = $rezultat->fetch_array()) {
                    print "<tr><td>$ime</td><td>$prezime</td><td>$email</td><td>$kor_ime</td><td>$lozinka</td><td>$tip</td></tr>\n";
                }
                $dbc->zatvoriDB();
                ?>
            </table>
        </div>

        <footer>
            <p>Vrijeme potrebno za rješavanje aktivnog dokumenta: 3h </p>
            <a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fdnevnik.php" target="html5">
                <figure id="html5">
                    <img src="../slike/HTML5.png" alt="HTML5" width="100" height="100">
                    <figcaption>HTML5 validator</figcaption>
                </figure>
            </a>
            <a href="https://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fbarka.foi.hr%2FWebDiP%2F2016%2Fzadaca_05%2Fnikfluks%2Fcss%2Fnikfluks.css&profile=css3&usermedium=all&warning=1&vextwarning=&lang=en" target="css3">
                <figure id="css3">
                    <img src="../slike/CSS3.png" alt="CSS3" width="100" height="100">
                    <figcaption>CSS3 validator</figcaption>
                </figure> 
            </a>
            <address id="mail"><strong>Kontakt: <a href="mailto:nikfluks@foi.hr">Nikola Fluks</a></strong></address>
            <p><small>&copy; 2017. N. Fluks </small></p>
        </footer>
    </body>
</html>

